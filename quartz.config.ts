import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4.0 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "🦊 Jonathan's FoxNotes",
    pageTitleSuffix: "",
    enableSPA: true,
    enablePopovers: true,
    // analytics: {
    //   provider: "plausible",
    // },
    analytics: null,
    locale: "en-US",
    baseUrl: "jdwh08.github.io/foxnote-quartzsite",
    ignorePatterns: ["^PRIVATE", "_ObsidianTemplates", ".obsidian", ".trash"],
    defaultDateType: "created",
    generateSocialImages: false,
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: false,
      typography: {
        header: "Newsreader",
        body: "IBM Plex Sans",
        code: "IBM Plex Mono",
      },
      colors: {
        lightMode: {
          light: "#f4e9e1",
          lightgray: "#89b2c5",
          gray: "#876f5a",
          darkgray: "#2a2521",
          dark: "#e96322",
          secondary: "#f29d35",
          tertiary: "#1c2539",
          highlight: "rgba(137, 178, 197, 0.20)",
          textHighlight: "#89b2c5",
        },
        darkMode: {
          light: "#181f2a", // "#1c2539", // page background
          lightgray: "#876f5a",  // borders and links
          gray: "#f29d35",  // graph links, heavy borders
          darkgray: "#f4e9e1",  // body text
          dark: "#e96322",  // header
          secondary: "#f29d35",  // link colour, current node
          tertiary: "#e96322",  // hover, visited nodes
          highlight: "rgba(137, 178, 197, 0.20)",  // 89b2c5 // text highlights
          textHighlight: "#89b2c5",  // highlight background
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "github-light",
          dark: "github-dark",
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.NotFoundPage(),
    ],
  },
}

export default config
