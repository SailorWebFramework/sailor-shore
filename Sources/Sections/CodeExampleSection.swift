import Sailor
import Sailboat

@MainActor struct CodeExampleSection: @preconcurrency Page {

    @State var count: Int = 0

    var body: some Page {
        Div {
            Div {
                H2("See it in action")
                    .style {
                        CSS.font(size: .px(36))
                        CSS.font(weight: .bold)
                        CSS.text(align: .center)
                        "margin-bottom: 16px;"
                    }

                Paragraph("This counter is live \u{2014} built with Sailor, running as WebAssembly in your browser right now.")
                    .style {
                        CSS.text(align: .center)
                        CSS.color(.hex("#94a3b8"))
                        "margin-bottom: 40px;"
                    }

                Div {
                    // Live demo side
                    Div {
                        H3("Live Demo")
                            .style {
                                CSS.font(size: .px(14))
                                CSS.color(.hex("#94a3b8"))
                                CSS.text(transform: .uppercase)
                                "letter-spacing: 0.1em; margin: 0 0 24px 0;"
                            }
                        Div {
                            Span("\(count)")
                                .style {
                                    CSS.font(size: .px(64))
                                    CSS.font(weight: .bold)
                                    "background: linear-gradient(135deg, #60a5fa, #a78bfa);"
                                    "-webkit-background-clip: text;"
                                    "-webkit-text-fill-color: transparent;"
                                }
                        }
                        .style {
                            "margin-bottom: 24px;"
                        }
                        Div {
                            Button("- Decrement")
                                .onClick { count -= 1 }
                                .style {
                                    CSS.padding(.px(10))
                                    "padding-left: 20px; padding-right: 20px;"
                                    CSS.background(color: .hex("#1e293b"))
                                    CSS.color(.hex("#e2e8f0"))
                                    "border: 1px solid #334155;"
                                    "border-radius: 6px;"
                                    "cursor: pointer;"
                                    CSS.font(size: .px(14))
                                }
                            Button("Reset")
                                .onClick { count = 0 }
                                .style {
                                    CSS.padding(.px(10))
                                    "padding-left: 20px; padding-right: 20px;"
                                    CSS.background(color: .hex("#334155"))
                                    CSS.color(.hex("#e2e8f0"))
                                    "border: none; border-radius: 6px; cursor: pointer;"
                                    CSS.font(size: .px(14))
                                }
                            Button("+ Increment")
                                .onClick { count += 1 }
                                .style {
                                    CSS.padding(.px(10))
                                    "padding-left: 20px; padding-right: 20px;"
                                    CSS.background(color: .hex("#3b82f6"))
                                    CSS.color(.white)
                                    "border: none; border-radius: 6px; cursor: pointer;"
                                    CSS.font(size: .px(14))
                                }
                        }
                        .style {
                            CSS.display(.flex)
                            "gap: 12px;"
                            "justify-content: center;"
                        }
                    }
                    .style {
                        CSS.padding(.px(40))
                        CSS.background(color: .hex("#111827"))
                        "border-radius: 12px;"
                        "border: 1px solid #1e293b;"
                        CSS.text(align: .center)
                        "flex: 1;"
                    }

                    // Code side
                    Div {
                        H3("The Swift Code")
                            .style {
                                CSS.font(size: .px(14))
                                CSS.color(.hex("#94a3b8"))
                                CSS.text(transform: .uppercase)
                                "letter-spacing: 0.1em; margin: 0 0 16px 0;"
                            }
                        Preformattedtext {
                            Code(codeExample)
                                .style {
                                    CSS.font(family: .customIdent("JetBrains Mono, monospace"))
                                    CSS.font(size: .px(13))
                                    CSS.color(.hex("#e2e8f0"))
                                    "line-height: 1.6;"
                                }
                        }
                        .style {
                            CSS.margin(.px(0))
                            CSS.padding(.px(24))
                            CSS.background(color: .hex("#0f172a"))
                            "border-radius: 8px;"
                            CSS.overflow(.auto)
                        }
                    }
                    .style {
                        CSS.padding(.px(40))
                        CSS.background(color: .hex("#111827"))
                        "border-radius: 12px;"
                        "border: 1px solid #1e293b;"
                        "flex: 1;"
                    }
                }
                .style {
                    CSS.display(.flex)
                    "gap: 24px;"
                    "flex-wrap: wrap;"
                }
            }
            .style {
                CSS.max(width: .px(1100))
                CSS.margin(.auto)
                CSS.padding(.px(24))
                "padding-top: 60px; padding-bottom: 60px;"
            }
        }
        .id("code")
    }
}

private let codeExample = """
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
        .style {
            CSS.padding(.px(20))
        }
    }
}
"""
