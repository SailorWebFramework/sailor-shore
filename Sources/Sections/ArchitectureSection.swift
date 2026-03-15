import Sailor

@MainActor struct ArchitectureSection: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                H2("Architecture")
                    .style {
                        CSS.font(size: .px(36))
                        CSS.font(weight: .bold)
                        CSS.text(align: .center)
                        "margin-bottom: 16px;"
                    }

                Paragraph("Four repos, one pipeline. Each piece does one thing well.")
                    .style {
                        CSS.text(align: .center)
                        CSS.color(.hex("#94a3b8"))
                        "margin-bottom: 48px;"
                    }

                Div {
                    ArchCard(
                        name: "Treasure",
                        description: "JSON specification files defining every CSS property, HTML tag, and unit type. The single source of truth.",
                        color: "#f59e0b"
                    )
                    Span("\u{2192}")
                        .style {
                            CSS.font(size: .px(32))
                            CSS.color(.hex("#475569"))
                            "align-self: center;"
                        }
                    ArchCard(
                        name: "Shipwright",
                        description: "Python code generator. Reads Treasure JSON and outputs type-safe Swift code for Sailor.",
                        color: "#10b981"
                    )
                    Span("\u{2192}")
                        .style {
                            CSS.font(size: .px(32))
                            CSS.color(.hex("#475569"))
                            "align-self: center;"
                        }
                    ArchCard(
                        name: "Sailor",
                        description: "The web framework. Generated HTML/CSS plus hand-written reactivity, events, and routing.",
                        color: "#3b82f6"
                    )
                }
                .style {
                    CSS.display(.flex)
                    "gap: 16px;"
                    "justify-content: center;"
                    "align-items: stretch;"
                    "flex-wrap: wrap;"
                }

                Div {
                    ArchCard(
                        name: "Sailboat",
                        description: "The signals engine. Pure Swift reactivity framework \u{2014} @State, dependency tracking, reconciliation. Zero dependencies.",
                        color: "#a78bfa"
                    )
                }
                .style {
                    CSS.display(.flex)
                    "justify-content: center;"
                    "margin-top: 24px;"
                }
            }
            .style {
                CSS.max(width: .px(1100))
                CSS.margin(.auto)
                CSS.padding(.px(24))
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
                .style {
                    CSS.font(size: .px(20))
                    CSS.font(weight: .weight(600))
                    CSS.color(.hex(color))
                    "margin: 0 0 8px 0;"
                }
            Paragraph(description)
                .style {
                    CSS.color(.hex("#94a3b8"))
                    CSS.font(size: .px(14))
                    "margin: 0;"
                }
        }
        .style {
            CSS.padding(.px(24))
            CSS.background(color: .hex("#111827"))
            "border-radius: 12px;"
            "border: 1px solid #1e293b;"
            "border-top: 3px solid \(color);"
            CSS.max(width: .px(260))
            "flex: 1;"
        }
    }
}
