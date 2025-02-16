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
          light: "#faf8f8",
          lightgray: "#e5e5e5",
          gray: "#b8b8b8",
          darkgray: "#4e4e4e",
          dark: "#2b2b2b",
          secondary: "#284b63",
          tertiary: "#84a59d",
          highlight: "rgba(143, 159, 169, 0.15)",
          textHighlight: "#fff23688",
        },
        darkMode: {
          light: "#1c2636",  // page background
          lightgray: "#9bb8d7",  // borders and links
          gray: "#c6acb3",  // graph links, heavy borders
          darkgray: "#f0eef9",  // body text
          dark: "#9b6a6c",  // header
          secondary: "#dbcdd6",  // link colour, current node
          tertiary: "#bc8a89",  // hover, visited nodes
          highlight: "rgba(219, 205, 214, 0.15)",  // dbcdd6 // text highlights
          textHighlight: "#dbcdd6",  // highlight background
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
