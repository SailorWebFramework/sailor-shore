import Sailor

@MainActor struct SiteNav: @preconcurrency Page {
    var body: some Page {
        Nav {
            Div {
                Span("Sailor")
                    .style {
                        CSS.font(size: .px(24))
                        CSS.font(weight: .bold)
                        CSS.color(.hex("#60a5fa"))
                    }
                Div {
                    NavLink("Features", href: "#features")
                    NavLink("Code", href: "#code")
                    NavLink("Architecture", href: "#architecture")
                    NavLink("Get Started", href: "#get-started")
                }
                .style {
                    CSS.display(.flex)
                    "gap: 24px;"
                }
            }
            .style {
                CSS.display(.flex)
                "justify-content: space-between;"
                "align-items: center;"
                CSS.max(width: .px(1100))
                CSS.margin(.auto)
                CSS.padding(.px(16))
            }
        }
        .style {
            CSS.position(.fixed)
            CSS.top(.px(0))
            CSS.left(.px(0))
            CSS.width(.percent(100))
            CSS.background(color: .hex("#0a0e17ee"))
            "backdrop-filter: blur(12px);"
            "z-index: 100;"
            "border-bottom: 1px solid #1e293b;"
        }
    }
}

@MainActor struct NavLink: @preconcurrency Page {
    let text: String
    let href: String

    init(_ text: String, href: String) {
        self.text = text
        self.href = href
    }

    var body: some Page {
        Anchor(text)
            .href(href)
            .style {
                CSS.color(.hex("#94a3b8"))
                CSS.textDecoration(line: .none)
                CSS.font(size: .px(14))
                CSS.font(weight: .weight(500))
            }
    }
}
