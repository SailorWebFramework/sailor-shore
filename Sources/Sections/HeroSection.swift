import Sailor

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
                .style {
                    CSS.font(size: .px(56))
                    CSS.font(weight: .bold)
                    CSS.margin(.px(0))
                    "line-height: 1.1;"
                    "letter-spacing: -0.02em;"
                }

                Paragraph("Sailor is a Swift-native frontend web framework. Type-safe HTML, reactive state, and real CSS \u{2014} all compiled to WebAssembly. No JavaScript required.")
                    .style {
                        CSS.font(size: .px(20))
                        CSS.color(.hex("#94a3b8"))
                        CSS.max(width: .px(600))
                        CSS.margin(.auto)
                        "margin-top: 24px;"
                        "margin-bottom: 40px;"
                    }

                Div {
                    Anchor("Get Started")
                        .href("#get-started")
                        .style {
                            CSS.display(.inline)
                            CSS.padding(.px(14))
                            "padding-left: 32px; padding-right: 32px;"
                            CSS.background(color: .hex("#3b82f6"))
                            CSS.color(.white)
                            CSS.textDecoration(line: .none)
                            "border-radius: 8px;"
                            CSS.font(weight: .weight(600))
                            CSS.font(size: .px(16))
                        }
                    Anchor("View on GitHub")
                        .href("https://github.com/SailorWebFramework")
                        .style {
                            CSS.display(.inline)
                            CSS.padding(.px(14))
                            "padding-left: 32px; padding-right: 32px;"
                            "border: 1px solid #334155;"
                            CSS.color(.hex("#e2e8f0"))
                            CSS.textDecoration(line: .none)
                            "border-radius: 8px;"
                            CSS.font(weight: .weight(600))
                            CSS.font(size: .px(16))
                        }
                }
                .style {
                    CSS.display(.flex)
                    "gap: 16px;"
                    "justify-content: center;"
                }
            }
            .style {
                CSS.text(align: .center)
                CSS.max(width: .px(800))
                CSS.margin(.auto)
                CSS.padding(.px(24))
                "padding-top: 140px; padding-bottom: 80px;"
            }
        }
    }
}
