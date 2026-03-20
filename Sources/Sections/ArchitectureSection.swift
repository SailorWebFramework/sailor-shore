import Sailor
import Tailwind

@MainActor struct ArchitectureSection: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                H2("Architecture")
                    .classes {
                        TW.text4xl
                        TW.fontBold
                        TW.textCenter
                        TW.mb4
                    }

                Paragraph("Four repos, one pipeline. Each piece does one thing well.")
                    .classes {
                        TW.textCenter
                        TW.textSlate400
                        TW.mb8
                    }

                Div {
                    ArchCard(
                        name: "Treasure",
                        description: "JSON specification files defining every CSS property, HTML tag, and unit type. The single source of truth.",
                        color: "#f59e0b"
                    )
                    Span("\u{2192}")
                        .classes {
                            TW.text3xl
                            TW.textSlate500
                            TW.selfCenter
                        }
                    ArchCard(
                        name: "Shipwright",
                        description: "Python code generator. Reads Treasure JSON and outputs type-safe Swift code for Sailor.",
                        color: "#10b981"
                    )
                    Span("\u{2192}")
                        .classes {
                            TW.text3xl
                            TW.textSlate500
                            TW.selfCenter
                        }
                    ArchCard(
                        name: "Sailor",
                        description: "The web framework. Generated HTML/CSS plus hand-written reactivity, events, and routing.",
                        color: "#3b82f6"
                    )
                }
                .classes {
                    TW.flex
                    TW.gap4
                    TW.justifyCenter
                    TW.flexWrap
                }
                .style { "align-items: stretch;" }

                Div {
                    ArchCard(
                        name: "Sailboat",
                        description: "The signals engine. Pure Swift reactivity framework \u{2014} @State, dependency tracking, reconciliation. Zero dependencies.",
                        color: "#a78bfa"
                    )
                }
                .classes {
                    TW.flex
                    TW.justifyCenter
                    TW.mt6
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
        .id("architecture")
    }
}

@MainActor struct ArchCard: @preconcurrency Page {
    let name: String
    let description: String
    let color: String

    init(name: String, description: String, color: String) {
        self.name = name
        self.description = description
        self.color = color
    }

    var body: some Page {
        Div {
            H3(name)
                .classes {
                    TW.textXl
                    TW.fontSemibold
                }
                .style {
                    CSS.color(.hex(color))
                    "margin: 0 0 8px 0;"
                }
            Paragraph(description)
                .classes {
                    TW.textSlate400
                    TW.textSm
                    TW.m0
                }
        }
        .classes {
            TW.p6
            TW.bgGray900
            TW.roundedLg
            TW.flex1
        }
        .style {
            "border: 1px solid #1e293b;"
            "border-top: 3px solid \(color);"
            CSS.max(width: .px(260))
        }
    }
}
