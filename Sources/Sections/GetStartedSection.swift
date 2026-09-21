import Sailor
import Navigator
import Tailwind

@MainActor struct GetStartedSection: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                H2("Get Started")
                    .classes {
                        TW.text4xl
                        TW.fontBold
                        TW.textCenter
                        TW.mb8
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

                Div {
                    Link(to: SiteRoute.docs) {
                        Span("Read the Full Docs")
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
                }
                .classes {
                    TW.textCenter
                    TW.mt8
                }
            }
            .classes {
                TW.mAuto
                TW.p6
            }
            .style {
                CSS.max(width: .px(1100))
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
                .classes {
                    TW.inlineBlock
                    TW.w8
                    TW.textCenter
                    TW.bgBlue500
                    TW.textWhite
                    TW.fontBold
                    TW.textSm
                    TW.roundedFull
                    TW.mb3
                }
                .style { "height: 32px; line-height: 32px;" }
            H3(title)
                .classes {
                    TW.textBase
                    TW.fontSemibold
                    TW.mb3
                }
                .style { "margin-top: 0;" }
            Pre {
                Code(code)
                    .classes {
                        TW.fontMono
                        TW.textIndigo300
                    }
                    .style {
                        CSS.font(size: .px(12))
                        "line-height: 1.5;"
                    }
            }
            .classes {
                TW.m0
                TW.p4
                TW.roundedMd
                TW.overflowAuto
            }
            .style {
                CSS.background(color: .hex("#0f172a"))
                "white-space: pre-wrap;"
                "word-break: break-word;"
            }
        }
        .classes {
            TW.p6
            TW.bgGray900
            TW.roundedLg
        }
        .style {
            "border: 1px solid #1e293b;"
        }
    }
}
