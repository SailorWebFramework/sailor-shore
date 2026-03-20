import Sailor
import Tailwind

@MainActor struct FeaturesSection: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                H2("Why Sailor?")
                    .classes {
                        TW.text4xl
                        TW.fontBold
                        TW.textCenter
                        TW.mb8
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
            .classes {
                TW.mAuto
                TW.p6
            }
            .style {
                CSS.max(width: .px(1100))
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
                .classes { TW.text3xl }
            H3(title)
                .classes {
                    TW.textXl
                    TW.fontSemibold
                }
                .style { "margin: 12px 0 8px 0;" }
            Paragraph(description)
                .classes {
                    TW.textSlate400
                    TW.textSm
                    TW.m0
                }
        }
        .classes {
            TW.p7
            TW.bgGray900
            TW.roundedLg
        }
        .style {
            "border: 1px solid #1e293b;"
        }
    }
}
