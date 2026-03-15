import Sailor

@MainActor struct GetStartedSection: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                H2("Get Started")
                    .style {
                        CSS.font(size: .px(36))
                        CSS.font(weight: .bold)
                        CSS.text(align: .center)
                        "margin-bottom: 40px;"
                    }

                Div {
                    StepCard(number: "1", title: "Create your project", code: """
                    mkdir MyApp && cd MyApp
                    swift package init --type executable
                    """)
                    StepCard(number: "2", title: "Add Sailor dependency", code: """
                    // Package.swift
                    dependencies: [
                        .package(url: "https://github.com/SailorWebFramework/Sailor",
                                 branch: "feature-fin")
                    ]
                    """)
                    StepCard(number: "3", title: "Write your website", code: """
                    @main
                    struct MyApp: Website {
                        var head: some Head {
                            HTML.Head { HTML.Title("My App") }
                        }
                        var body: some Body {
                            HTML.Body {
                                HTML.H1("Hello, Sailor!")
                            }
                        }
                    }
                    """)
                    StepCard(number: "4", title: "Build and run", code: """
                    swift build --swift-sdk wasm
                    swift package js --serve
                    """)
                }
                .style {
                    CSS.display(.grid)
                    "grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));"
                    "gap: 20px;"
                }
            }
            .style {
                CSS.max(width: .px(1100))
                CSS.margin(.auto)
                CSS.padding(.px(24))
                "padding-top: 60px; padding-bottom: 80px;"
            }
        }
        .id("get-started")
    }
}

@MainActor struct StepCard: @preconcurrency Page {
    let number: String
    let title: String
    let code: String

    init(number: String, title: String, code: String) {
        self.number = number
        self.title = title
        self.code = code
    }

    var body: some Page {
        Div {
            Span(number)
                .style {
                    CSS.display(.inline)
                    CSS.width(.px(32))
                    "height: 32px; line-height: 32px;"
                    CSS.text(align: .center)
                    CSS.background(color: .hex("#3b82f6"))
                    CSS.color(.white)
                    CSS.font(weight: .bold)
                    CSS.font(size: .px(14))
                    "border-radius: 50%;"
                    "margin-bottom: 12px;"
                }
            H3(title)
                .style {
                    CSS.font(size: .px(16))
                    CSS.font(weight: .weight(600))
                    "margin: 0 0 12px 0;"
                }
            Preformattedtext {
                Code(code)
                    .style {
                        CSS.font(family: .customIdent("JetBrains Mono, monospace"))
                        CSS.font(size: .px(12))
                        CSS.color(.hex("#a5b4fc"))
                        "line-height: 1.5;"
                    }
            }
            .style {
                CSS.margin(.px(0))
                CSS.padding(.px(16))
                CSS.background(color: .hex("#0f172a"))
                "border-radius: 6px;"
                CSS.overflow(.auto)
                "white-space: pre-wrap;"
                "word-break: break-word;"
            }
        }
        .style {
            CSS.padding(.px(24))
            CSS.background(color: .hex("#111827"))
            "border-radius: 12px;"
            "border: 1px solid #1e293b;"
        }
    }
}
