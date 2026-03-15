import Sailor

@main
struct SailorShoreWebsite: @preconcurrency Website {

    @MainActor var head: some Head {
        HTML.Head {
            HTML.Title("Sailor - Swift Web Framework")
            HTML.Meta().charset("UTF-8")
            HTML.Meta().name("viewport").content("width=device-width, initial-scale=1.0")
            HTML.Link(rel: "stylesheet", href: "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono&display=swap")
        }
    }

    @MainActor var body: some Body {
        HTML.Body {
            SiteNav()
            HeroSection()
            FeaturesSection()
            CodeExampleSection()
            ArchitectureSection()
            GetStartedSection()
            SiteFooter()
        }
        .style {
            CSS.margin(.px(0))
            CSS.font(family: .customIdent("Inter, sans-serif"))
            CSS.background(color: .hex("#0a0e17"))
            CSS.color(.hex("#e2e8f0"))
            "line-height: 1.6;"
        }
    }
}
