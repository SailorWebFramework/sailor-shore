import Sailor
import Navigator
import Tailwind

@MainActor struct HeroSection: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                H1 {
                    Span("Build web apps in ")
                    Span("pure Swift")
                        .style {
                            "background: linear-gradient(135deg, #60a5fa, #a78bfa);"
                            "-webkit-background-clip: text;"
                            "-webkit-text-fill-color: transparent;"
                        }
                }
                .classes {
                    TW.text5xl
                    TW.fontBold
                    TW.m0
                }
                .style {
                    "line-height: 1.1;"
                    "letter-spacing: -0.02em;"
                }

                Paragraph("Sailor is a Swift-native frontend web framework. Type-safe HTML, reactive state, and real CSS \u{2014} all compiled to WebAssembly. No JavaScript required.")
                    .classes {
                        TW.textXl
                        TW.textSlate400
                        TW.mAuto
                        TW.mt6
                        TW.mb8
                    }
                    .style {
                        CSS.max(width: .px(600))
                    }

                Div {
                    Link(to: SiteRoute.docs) {
                        Span("Get Started")
                            .classes {
                                TW.inlineBlock
                                TW.py3
                                TW.px8
                                TW.bgBlue500
                                TW.textWhite
                                TW.noUnderline
                                TW.roundedLg
                                TW.fontSemibold
                                TW.textBase
                            }
                    }
                    Anchor("View on GitHub")
                        .href("https://github.com/SailorWebFramework")
                        .classes {
                            TW.inlineBlock
                            TW.py3
                            TW.px8
                            TW.textSlate200
                            TW.noUnderline
                            TW.roundedLg
                            TW.fontSemibold
                            TW.textBase
                        }
                        .style {
                            "border: 1px solid #334155;"
                        }
                }
                .classes {
                    TW.flex
                    TW.gap4
                    TW.justifyCenter
                }
            }
            .classes {
                TW.textCenter
                TW.mAuto
                TW.p6
            }
            .style {
                CSS.max(width: .px(800))
                "padding-top: 140px; padding-bottom: 80px;"
            }
        }
    }
}
