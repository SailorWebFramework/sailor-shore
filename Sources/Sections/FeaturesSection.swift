import Sailor

@MainActor struct FeaturesSection: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                H2("Why Sailor?")

                    .style {
                        CSS.font(size: .px(36))
                        CSS.font(weight: .bold)
                        CSS.text(align: .center)
                        "margin-bottom: 48px;"
                    }

                Div {
                    FeatureCard(
                        icon: "\u{2699}\u{fe0f}",
                        title: "Type-Safe HTML",
                        description: "Every HTML tag is a Swift struct. Attributes are methods with typed parameters. The compiler catches your typos before the browser does."
                    )
                    FeatureCard(
                        icon: "\u{26a1}",
                        title: "Reactive State",
                        description: "@State properties trigger automatic re-renders. Dependency tracking ensures only affected elements update \u{2014} no virtual DOM diffing."
                    )
                    FeatureCard(
                        icon: "\u{1f3a8}",
                        title: "Real CSS, Typed",
                        description: "CSS properties are Swift functions with unit types. CSS.padding(.px(10)), CSS.background(color: .red) \u{2014} autocomplete for every property."
                    )
                    FeatureCard(
                        icon: "\u{1f4e6}",
                        title: "WebAssembly",
                        description: "Compiles to Wasm via SwiftWasm. Runs at near-native speed in the browser. No JavaScript runtime overhead."
                    )
                    FeatureCard(
                        icon: "\u{1f9e9}",
                        title: "Component Model",
                        description: "Pages compose like SwiftUI views. Result builders enable declarative syntax. @EnvironmentObject for dependency injection."
                    )
                    FeatureCard(
                        icon: "\u{1f6e0}\u{fe0f}",
                        title: "Code Generation",
                        description: "521 CSS properties and 103 HTML tags auto-generated from Treasure specs via Shipwright. Always up to date with the web platform."
                    )
                }
                .style {
                    CSS.display(.grid)
                    "grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));"
                    "gap: 24px;"
                }
            }
            .style {
                CSS.max(width: .px(1100))
                CSS.margin(.auto)
                CSS.padding(.px(24))
                "padding-top: 60px; padding-bottom: 60px;"
            }
        }
        .id("features")
    }
}

@MainActor struct FeatureCard: @preconcurrency Page {
    let icon: String
    let title: String
    let description: String

    init(icon: String, title: String, description: String) {
        self.icon = icon
        self.title = title
        self.description = description
    }

    var body: some Page {
        Div {
            Span(icon)
                .style { CSS.font(size: .px(32)) }
            H3(title)
                .style {
                    CSS.font(size: .px(20))
                    CSS.font(weight: .weight(600))
                    "margin: 12px 0 8px 0;"
                }
            Paragraph(description)
                .style {
                    CSS.color(.hex("#94a3b8"))
                    CSS.font(size: .px(15))
                    "margin: 0;"
                }
        }
        .style {
            CSS.padding(.px(28))
            CSS.background(color: .hex("#111827"))
            "border-radius: 12px;"
            "border: 1px solid #1e293b;"
        }
    }
}
