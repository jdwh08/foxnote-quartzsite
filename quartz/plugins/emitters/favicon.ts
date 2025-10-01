import fs from "fs"
import path from "path"
import sharp from "sharp"
import { BuildCtx } from "../../util/ctx"
import { FullSlug, joinSegments, QUARTZ } from "../../util/path"
import { QuartzEmitterPlugin } from "../types"
import { write } from "./helpers"

export const Favicon: QuartzEmitterPlugin = () => ({
  name: "Favicon",
  async *emit({ argv }) {
    const iconPath = joinSegments(QUARTZ, "static", "icon.png")

    // Check if the icon file exists
    if (!fs.existsSync(iconPath)) {
      console.warn(`[Favicon] Icon file not found at ${iconPath}, skipping favicon generation`)
      return
    }

    try {
      // Get absolute path to help with debugging
      const absoluteIconPath = path.resolve(iconPath)
      console.log(`[Favicon] Processing icon file: ${absoluteIconPath}`)

      // Validate file before processing with Sharp
      const stats = fs.statSync(iconPath)
      console.log(`[Favicon] File stats:`, {
        size: stats.size,
        isFile: stats.isFile(),
        mode: stats.mode.toString(8)
      })

      // Check if file is empty or too small to be a valid image
      if (stats.size < 100) {
        throw new Error(`File too small to be a valid image: ${stats.size} bytes`)
      }

      // Read file as buffer to validate it's a proper PNG
      const fileBuffer = fs.readFileSync(iconPath)
      const pngSignature = fileBuffer.slice(0, 8)
      const expectedPngSignature = Buffer.from([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])

      if (!pngSignature.equals(expectedPngSignature)) {
        console.log(`[Favicon] PNG signature mismatch. Got:`, pngSignature.toString('hex'), 'Expected:', expectedPngSignature.toString('hex'))
        throw new Error(`File does not appear to be a valid PNG: ${iconPath}`)
      }

      console.log(`[Favicon] File validation passed, processing with Sharp...`)

      // Verify the file is a valid image by reading its metadata first
      const metadata = await sharp(iconPath).metadata()
      console.log(`[Favicon] Image metadata:`, { format: metadata.format, width: metadata.width, height: metadata.height })

      if (!metadata.format) {
        throw new Error(`Invalid image format for file: ${iconPath}`)
      }

      // Create the favicon with proper error handling
      const faviconContent = sharp(iconPath)
        .resize(48, 48, {
          kernel: sharp.kernel.lanczos3,
          fit: 'contain',
          background: { r: 255, g: 255, b: 255, alpha: 0 }
        })
        .toFormat("png")

      yield write({
        ctx: { argv } as BuildCtx,
        slug: "favicon" as FullSlug,
        ext: ".ico",
        content: faviconContent,
      })

      console.log(`[Favicon] Successfully generated favicon.ico`)
    } catch (error) {
      const err = error as Error
      console.error(`[Favicon] Failed to process icon file at ${iconPath}:`, err)
      console.error(`[Favicon] Error details:`, {
        message: err.message,
        code: (err as any).code,
        errno: (err as any).errno,
        syscall: (err as any).syscall,
        path: (err as any).path
      })

      // Try to create a simple fallback favicon
      console.log(`[Favicon] Attempting to create fallback favicon...`)
      try {
        // Create a simple blue square favicon as fallback
        const fallbackFavicon = sharp({
          create: {
            width: 48,
            height: 48,
            channels: 4,
            background: { r: 37, g: 99, b: 235, alpha: 1 } // Blue background
          }
        }).png()

        yield write({
          ctx: { argv } as BuildCtx,
          slug: "favicon" as FullSlug,
          ext: ".ico",
          content: fallbackFavicon,
        })

        console.log(`[Favicon] Successfully generated fallback favicon.ico`)
      } catch (fallbackError) {
        console.error(`[Favicon] Failed to create fallback favicon:`, fallbackError)
        // Don't throw the error, just skip favicon generation
        return
      }
    }
  },
  async *partialEmit() { },
})
