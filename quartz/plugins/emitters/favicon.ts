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
      console.error(`[Favicon] Failed to process icon file at ${iconPath}:`, error)
      console.error(`[Favicon] Error details:`, {
        message: error.message,
        code: error.code,
        errno: error.errno,
        syscall: error.syscall,
        path: error.path
      })
      // Don't throw the error, just skip favicon generation
      return
    }
  },
  async *partialEmit() { },
})
