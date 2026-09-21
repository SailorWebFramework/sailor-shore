import Sailor
import Tailwind

@MainActor struct SiteFooter: @preconcurrency Page {
    var body: some Page {
        Footer {
            Div {
                Div {
                    Span("Sailor Web Framework")
                        .classes {
                            TW.fontSemibold
                            TW.textBase
                        }
                    Paragraph("Built with Swift. Compiled to WebAssembly. This site is written in Sailor.")
                        .classes {
                            TW.textSlate500
                            TW.textSm
                            TW.mt2
                        }
                        .style { "margin-bottom: 0;" }
                }
                Div {
                    Anchor("GitHub")
                        .href("https://github.com/SailorWebFramework")
                        .classes {
                            TW.textSlate400
                            TW.noUnderline
                            TW.textSm
                        }
                }
            }
            .classes {
                TW.flex
                TW.justifyBetween
                TW.itemsCenter
                TW.mAuto
                TW.p6
                TW.flexWrap
                TW.gap4
            }
            .style {
                CSS.max(width: .px(1100))
            }
        }
        .style {
            "border-top: 1px solid #1e293b;"
            "margin-top: 40px;"
        }
    }
}
