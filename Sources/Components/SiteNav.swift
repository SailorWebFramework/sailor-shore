import Sailor
import Navigator
import Tailwind

@MainActor struct SiteNav: @preconcurrency Page {
    var body: some Page {
        Nav {
            Div {
                Link(to: SiteRoute.home) {
                    Span("Sailor")
                        .classes {
                            TW.textXl
                            TW.fontBold
                            TW.textBlue400
                        }
                }
                Div {
                    NavLink("Home", route: .home)
                    NavLink("Docs", route: .docs)
                    NavLink("Examples", route: .examples)
                    Anchor("GitHub")
                        .href("https://github.com/SailorWebFramework")
                        .classes {
                            TW.textSlate400
                            TW.noUnderline
                            TW.textSm
                            TW.fontMedium
                        }
                }
                .classes {
                    TW.flex
                    TW.itemsCenter
                    TW.gap6
                }
            }
            .classes {
                TW.flex
                TW.justifyBetween
                TW.itemsCenter
                TW.mAuto
                TW.p4
            }
            .style {
                CSS.max(width: .px(1100))
            }
        }
        .classes {
            TW.fixed
            TW.top0
            TW.left0
            TW.wFull
            TW.z50
        }
        .style {
            CSS.background(color: .hex("#0a0e17ee"))
            "backdrop-filter: blur(12px);"
            "border-bottom: 1px solid #1e293b;"
        }
    }
}

@MainActor struct NavLink: @preconcurrency Page {
    let text: String
    let route: SiteRoute

    init(_ text: String, route: SiteRoute) {
        self.text = text
        self.route = route
    }

    var body: some Page {
        Link(to: route) {
            Span(text)
                .classes {
                    TW.textSlate400
                    TW.textSm
                    TW.fontMedium
                }
        }
    }
}
