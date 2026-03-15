import Sailor

@MainActor struct SiteFooter: @preconcurrency Page {
    var body: some Page {
        Footer {
            Div {
                Div {
                    Span("Sailor Web Framework")
                        .style {
                            CSS.font(weight: .weight(600))
                            CSS.font(size: .px(16))
                        }
                    Paragraph("Built with Swift. Compiled to WebAssembly. This site is written in Sailor.")
                        .style {
                            CSS.color(.hex("#64748b"))
                            CSS.font(size: .px(14))
                            "margin: 8px 0 0 0;"
                        }
                }
                Div {
                    Anchor("GitHub")
                        .href("https://github.com/SailorWebFramework")
                        .style {
                            CSS.color(.hex("#94a3b8"))
                            CSS.textDecoration(line: .none)
                            CSS.font(size: .px(14))
                        }
                }
            }
            .style {
                CSS.display(.flex)
                "justify-content: space-between;"
                "align-items: center;"
                CSS.max(width: .px(1100))
                CSS.margin(.auto)
                CSS.padding(.px(24))
                "flex-wrap: wrap; gap: 16px;"
            }
        }
        .style {
            "border-top: 1px solid #1e293b;"
            "margin-top: 40px;"
        }
    }
}
