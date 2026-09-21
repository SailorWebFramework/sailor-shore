import Sailor
import Navigator
import Tailwind

@main
struct SailorShoreWebsite: @preconcurrency Website {

    @MainActor var head: some Head {
        HTML.Head {
            HTML.Title("Sailor - Swift Web Framework")
            HTML.Meta().charset("UTF-8")
            HTML.Meta().name("viewport").content("width=device-width, initial-scale=1.0")
            HTML.Link(rel: "stylesheet", href: "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono&display=swap")
            HTML.Link(rel: "stylesheet", href: "https://cdn.jsdelivr.net/npm/tailwindcss@3/dist/tailwind.min.css")
        }
    }

    @MainActor var body: some Body {
        HTML.Body {
            SiteNav()
            Router(for: SiteRoute.self) { route in
                switch route {
                case .home:
                    HomePage()
                case .docs:
                    DocsPage()
                case .examples:
                    ExamplesPage()
                }
            } notFound: {
                NotFoundPage()
            }
            SiteFooter()
        }
        .classes {
            TW.m0
            TW.fontNormal
            TW.bgGray950
            TW.textSlate200
        }
        .style {
            CSS.font(family: .customIdent("Inter, sans-serif"))
            "line-height: 1.6;"
        }
    }
}

// MARK: - Page Shells

@MainActor struct HomePage: @preconcurrency Page {
    // Page.body is a single Page, not a result builder; group the sections.
    var body: some Page {
        Div {
            HeroSection()
            FeaturesSection()
            CodeExampleSection()
            ArchitectureSection()
            GetStartedSection()
        }
    }
}

@MainActor struct NotFoundPage: @preconcurrency Page {
    var body: some Page {
        Div {
            H1("404")
                .classes {
                    TW.text6xl
                    TW.fontBold
                    TW.textBlue400
                }
            Paragraph("Page not found.")
                .classes {
                    TW.textXl
                    TW.textSlate400
                    TW.mt4
                }
        }
        .classes {
            TW.textCenter
            TW.py8
        }
        .style {
            "padding-top: 140px; padding-bottom: 80px;"
        }
    }
}
