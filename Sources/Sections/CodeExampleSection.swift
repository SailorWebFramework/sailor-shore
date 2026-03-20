import Sailor
import Sailboat
import Tailwind

@MainActor struct CodeExampleSection: @preconcurrency Page {

    @State var count: Int = 0

    var body: some Page {
        Div {
            Div {
                H2("See it in action")
                    .classes {
                        TW.text4xl
                        TW.fontBold
                        TW.textCenter
                        TW.mb4
                    }

                Paragraph("This counter is live \u{2014} built with Sailor, running as WebAssembly in your browser right now.")
                    .classes {
                        TW.textCenter
                        TW.textSlate400
                        TW.mb8
                    }

                Div {
                    // Live demo side
                    Div {
                        H3("Live Demo")
                            .classes {
                                TW.textSm
                                TW.textSlate400
                                TW.uppercase
                            }
                            .style { "letter-spacing: 0.1em; margin: 0 0 24px 0;" }
                        Div {
                            Span("\(count)")
                                .classes {
                                    TW.text6xl
                                    TW.fontBold
                                }
                                .style {
                                    "background: linear-gradient(135deg, #60a5fa, #a78bfa);"
                                    "-webkit-background-clip: text;"
                                    "-webkit-text-fill-color: transparent;"
                                }
                        }
                        .classes { TW.mb6 }
                        Div {
                            Button("- Decrement")
                                .onClick { count -= 1 }
                                .classes {
                                    TW.py2
                                    TW.px5
                                    TW.textSlate200
                                    TW.roundedMd
                                    TW.cursorPointer
                                    TW.textSm
                                    TW.borderNone
                                }
                                .style {
                                    CSS.background(color: .hex("#1e293b"))
                                    "border: 1px solid #334155;"
                                }
                            Button("Reset")
                                .onClick { count = 0 }
                                .classes {
                                    TW.py2
                                    TW.px5
                                    TW.textSlate200
                                    TW.roundedMd
                                    TW.cursorPointer
                                    TW.textSm
                                    TW.borderNone
                                }
                                .style {
                                    CSS.background(color: .hex("#334155"))
                                }
                            Button("+ Increment")
                                .onClick { count += 1 }
                                .classes {
                                    TW.py2
                                    TW.px5
                                    TW.bgBlue500
                                    TW.textWhite
                                    TW.roundedMd
                                    TW.cursorPointer
                                    TW.textSm
                                    TW.borderNone
                                }
                        }
                        .classes {
                            TW.flex
                            TW.gap3
                            TW.justifyCenter
                        }
                    }
                    .classes {
                        TW.p8
                        TW.bgGray900
                        TW.roundedLg
                        TW.textCenter
                        TW.flex1
                    }
                    .style { "border: 1px solid #1e293b;" }

                    // Code side
                    Div {
                        H3("The Swift Code")
                            .classes {
                                TW.textSm
                                TW.textSlate400
                                TW.uppercase
                            }
                            .style { "letter-spacing: 0.1em; margin: 0 0 16px 0;" }
                        Pre {
                            Code(counterCodeExample)
                                .classes {
                                    TW.fontMono
                                    TW.textSlate200
                                }
                                .style {
                                    CSS.font(size: .px(13))
                                    "line-height: 1.6;"
                                }
                        }
                        .classes {
                            TW.m0
                            TW.p6
                            TW.roundedLg
                            TW.overflowAuto
                        }
                        .style {
                            CSS.background(color: .hex("#0f172a"))
                        }
                    }
                    .classes {
                        TW.p8
                        TW.bgGray900
                        TW.roundedLg
                        TW.flex1
                    }
                    .style { "border: 1px solid #1e293b;" }
                }
                .classes {
                    TW.flex
                    TW.gap6
                    TW.flexWrap
                }
            }
            .classes {
                TW.mAuto
                TW.p6
            }
            .style {
                CSS.max(width: .px(1100))
                "padding-top: 60px; padding-bottom: 60px;"
            }
        }
        .id("code")
    }
}

private let counterCodeExample = """
@MainActor struct Counter: @preconcurrency Page {
    @State var count: Int = 0

    var body: some Page {
        Div {
            Span("\\(count)")
            Button("+ Increment")
                .onClick { count += 1 }
            Button("Reset")
                .onClick { count = 0 }
        }
        .classes {
            TW.p5
            TW.flex
            TW.gap3
        }
    }
}
"""
