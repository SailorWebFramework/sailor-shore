import Sailor
import Sailboat
import Navigator
import Tailwind

@MainActor struct ExamplesPage: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                H1("Interactive Examples")
                    .classes {
                        TW.text4xl
                        TW.fontBold
                        TW.mb2
                    }
                    .style { "padding-top: 100px;" }

                Paragraph("Live code examples running as WebAssembly. Each demo below is built with Sailor.")
                    .classes {
                        TW.textXl
                        TW.textSlate400
                        TW.mb8
                    }

                // Example 1: Counter (live)
                ExampleBlock(
                    title: "Counter with @State",
                    description: "Reactive state with automatic re-rendering. Click the buttons \u{2014} only the count display updates."
                ) {
                    CounterDemo()
                }
                ExampleCode(counterCode)

                // Example 2: Basic Elements
                ExampleBlock(
                    title: "Basic Element Creation",
                    description: "HTML tags are Swift structs. Nest them with result builders and set attributes with methods."
                ) {
                    BasicElementsDemo()
                }
                ExampleCode(basicElementsCode)

                // Example 3: Styling with CSS and Tailwind
                ExampleBlock(
                    title: "Styling: CSS + Tailwind",
                    description: "Mix typed inline CSS with Tailwind utility classes. Use .style { } for CSS and .classes { } for TW."
                ) {
                    StylingDemo()
                }
                ExampleCode(stylingCode)

                // Example 4: Events
                ExampleBlock(
                    title: "Events: onClick & onAppear",
                    description: "Attach event handlers directly to elements. onClick fires on user interaction, onAppear fires when the element mounts."
                ) {
                    EventsDemo()
                }
                ExampleCode(eventsCode)

                // Example 5: Navigation
                ExampleBlock(
                    title: "Navigation with Typed Routes",
                    description: "Define routes as enums conforming to Routable. Use Link for type-safe navigation and Router for content switching."
                ) {
                    NavigationDemo()
                }
                ExampleCode(navigationCode)
            }
            .classes {
                TW.mAuto
                TW.p6
            }
            .style {
                CSS.max(width: .px(900))
                "padding-bottom: 80px;"
            }
        }
    }
}

// MARK: - Example Layout Components

@MainActor struct ExampleBlock: @preconcurrency Page {
    let title: String
    let description: String
    // PageBuilder produces `any Fragment`, which cannot satisfy a `Content: Page` generic;
    // keep the builder closure and splice it into the body like the generated tags do.
    let content: () -> any Fragment

    init(title: String, description: String, @PageBuilder content: @escaping () -> any Fragment) {
        self.title = title
        self.description = description
        self.content = content
    }

    var body: some Page {
        Div {
            H2(title)
                .classes {
                    TW.text2xl
                    TW.fontBold
                    TW.mb2
                }
            Paragraph(description)
                .classes {
                    TW.textSlate400
                    TW.textBase
                    TW.mb6
                }
            Div {
                H3("Live Demo")
                    .classes {
                        TW.textSm
                        TW.textSlate400
                        TW.uppercase
                    }
                    .style { "letter-spacing: 0.1em; margin: 0 0 16px 0;" }
                content()
            }
            .classes {
                TW.p6
                TW.bgGray900
                TW.roundedLg
            }
            .style { "border: 1px solid #1e293b;" }
        }
        .classes { TW.mt8 }
    }
}

@MainActor struct ExampleCode: @preconcurrency Page {
    let code: String

    init(_ code: String) {
        self.code = code
    }

    var body: some Page {
        Div {
            H3("Source Code")
                .classes {
                    TW.textSm
                    TW.textSlate400
                    TW.uppercase
                    TW.mb4
                }
                .style { "letter-spacing: 0.1em; margin-top: 0;" }
            Pre {
                Code(code)
                    .classes {
                        TW.fontMono
                        TW.textIndigo300
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
                "white-space: pre-wrap;"
                "word-break: break-word;"
            }
        }
        .classes {
            TW.mt4
            TW.p6
            TW.bgGray900
            TW.roundedLg
        }
        .style { "border: 1px solid #1e293b;" }
    }
}

// MARK: - Live Demos

@MainActor struct CounterDemo: @preconcurrency Page {
    @State var count: Int = 0

    var body: some Page {
        Div {
            Span("\(count)")
                .classes {
                    TW.text5xl
                    TW.fontBold
                }
                .style {
                    "background: linear-gradient(135deg, #60a5fa, #a78bfa);"
                    "-webkit-background-clip: text;"
                    "-webkit-text-fill-color: transparent;"
                }
            Div {
                Button("- Decrement")
                    .onClick { count -= 1 }
                    .classes {
                        TW.py2
                        TW.px4
                        TW.textSlate200
                        TW.roundedMd
                        TW.cursorPointer
                        TW.textSm
                        TW.borderNone
                    }
                    .style { CSS.background(color: .hex("#1e293b")) }
                Button("Reset")
                    .onClick { count = 0 }
                    .classes {
                        TW.py2
                        TW.px4
                        TW.textSlate200
                        TW.roundedMd
                        TW.cursorPointer
                        TW.textSm
                        TW.borderNone
                    }
                    .style { CSS.background(color: .hex("#334155")) }
                Button("+ Increment")
                    .onClick { count += 1 }
                    .classes {
                        TW.py2
                        TW.px4
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
                TW.mt4
            }
        }
        .classes { TW.textCenter }
    }
}

@MainActor struct BasicElementsDemo: @preconcurrency Page {
    var body: some Page {
        Div {
            H3("A Heading")
                .classes {
                    TW.textXl
                    TW.fontBold
                    TW.textBlue400
                }
                .style { "margin: 0 0 8px 0;" }
            Paragraph("A paragraph with styled text inside a container.")
                .classes {
                    TW.textSlate300
                    TW.m0
                }
            Div {
                Span("Nested")
                    .classes {
                        TW.textSm
                        TW.bgBlue900
                        TW.textBlue200
                        TW.roundedMd
                        TW.px3
                        TW.py1
                    }
                Span("Elements")
                    .classes {
                        TW.textSm
                        TW.bgPurple900
                        TW.textPurple200
                        TW.roundedMd
                        TW.px3
                        TW.py1
                    }
                Span("Here")
                    .classes {
                        TW.textSm
                        TW.bgGreen900
                        TW.textGreen200
                        TW.roundedMd
                        TW.px3
                        TW.py1
                    }
            }
            .classes {
                TW.flex
                TW.gap2
                TW.mt3
            }
        }
    }
}

@MainActor struct StylingDemo: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                Span("TW Classes")
                    .classes {
                        TW.bgBlue500
                        TW.textWhite
                        TW.px4
                        TW.py2
                        TW.roundedLg
                        TW.fontSemibold
                    }
                Span("Inline CSS")
                    .style {
                        CSS.display(.inline)
                        CSS.padding(.px(8))
                        "padding-left: 16px; padding-right: 16px;"
                        "background: linear-gradient(135deg, #a78bfa, #60a5fa);"
                        CSS.color(.white)
                        "border-radius: 8px;"
                        CSS.font(weight: .weight(600))
                    }
                Span("Both Combined")
                    .classes {
                        TW.px4
                        TW.py2
                        TW.roundedLg
                        TW.fontSemibold
                        TW.textWhite
                    }
                    .style {
                        "background: linear-gradient(135deg, #10b981, #3b82f6);"
                    }
            }
            .classes {
                TW.flex
                TW.gap3
                TW.flexWrap
            }
        }
    }
}

@MainActor struct EventsDemo: @preconcurrency Page {
    @State var message: String = "Click a button!"
    @State var clickCount: Int = 0

    var body: some Page {
        Div {
            Paragraph(message)
                .classes {
                    TW.textLg
                    TW.fontSemibold
                    TW.textSlate200
                    TW.mb4
                }
                .style { "margin-top: 0;" }
            Div {
                Button("Say Hello")
                    .onClick { message = "Hello, Sailor!" }
                    .classes {
                        TW.py2
                        TW.px4
                        TW.bgBlue500
                        TW.textWhite
                        TW.roundedMd
                        TW.cursorPointer
                        TW.textSm
                        TW.borderNone
                    }
                Button("Count Click (\(clickCount))")
                    .onClick {
                        clickCount += 1
                        message = "Clicked \(clickCount) time\(clickCount == 1 ? "" : "s")"
                    }
                    .classes {
                        TW.py2
                        TW.px4
                        TW.bgPurple500
                        TW.textWhite
                        TW.roundedMd
                        TW.cursorPointer
                        TW.textSm
                        TW.borderNone
                    }
                Button("Reset")
                    .onClick {
                        message = "Click a button!"
                        clickCount = 0
                    }
                    .classes {
                        TW.py2
                        TW.px4
                        TW.textSlate200
                        TW.roundedMd
                        TW.cursorPointer
                        TW.textSm
                        TW.borderNone
                    }
                    .style { CSS.background(color: .hex("#334155")) }
            }
            .classes {
                TW.flex
                TW.gap3
                TW.flexWrap
            }
        }
    }
}

@MainActor struct NavigationDemo: @preconcurrency Page {
    var body: some Page {
        Div {
            Paragraph("This site uses typed routes. Click the nav links above to see Navigator in action. Here is how the routes for this site are defined:")
                .classes {
                    TW.textSlate300
                    TW.mb4
                }
                .style { "margin-top: 0;" }
            Div {
                Link(to: SiteRoute.home) {
                    Span("Home /")
                        .classes {
                            TW.bgBlue900
                            TW.textBlue200
                            TW.px4
                            TW.py2
                            TW.roundedMd
                            TW.textSm
                            TW.fontMedium
                        }
                }
                Link(to: SiteRoute.docs) {
                    Span("Docs /docs")
                        .classes {
                            TW.bgBlue900
                            TW.textBlue200
                            TW.px4
                            TW.py2
                            TW.roundedMd
                            TW.textSm
                            TW.fontMedium
                        }
                }
                Link(to: SiteRoute.examples) {
                    Span("Examples /examples")
                        .classes {
                            TW.bgBlue900
                            TW.textBlue200
                            TW.px4
                            TW.py2
                            TW.roundedMd
                            TW.textSm
                            TW.fontMedium
                        }
                }
            }
            .classes {
                TW.flex
                TW.gap3
                TW.flexWrap
            }
        }
    }
}

// MARK: - Code Strings

private let counterCode = """
@MainActor struct Counter: @preconcurrency Page {
    @State var count: Int = 0

    var body: some Page {
        Div {
            Span("\\(count)")
                .classes {
                    TW.text5xl
                    TW.fontBold
                }
            Button("+ Increment")
                .onClick { count += 1 }
                .classes {
                    TW.py2
                    TW.px4
                    TW.bgBlue500
                    TW.textWhite
                    TW.roundedMd
                }
        }
    }
}
"""

private let basicElementsCode = """
HTML.Div {
    HTML.H3("A Heading")
        .classes {
            TW.textXl
            TW.fontBold
            TW.textBlue400
        }
    HTML.P("A paragraph with styled text.")
    HTML.Div {
        HTML.Span("Nested")
            .classes { TW.bgBlue900; TW.textBlue200; TW.roundedMd; TW.px3; TW.py1 }
        HTML.Span("Elements")
            .classes { TW.bgPurple900; TW.textPurple200; TW.roundedMd; TW.px3; TW.py1 }
    }
    .classes { TW.flex; TW.gap2 }
}
"""

private let stylingCode = """
// Tailwind classes via .classes { }
HTML.Span("TW Classes")
    .classes {
        TW.bgBlue500
        TW.textWhite
        TW.px4
        TW.py2
        TW.roundedLg
    }

// Inline CSS via .style { }
HTML.Span("Inline CSS")
    .style {
        CSS.padding(.px(8))
        CSS.background(color: .hex("#a78bfa"))
        CSS.color(.white)
    }

// Both combined
HTML.Span("Both")
    .classes { TW.px4; TW.py2; TW.roundedLg }
    .style { "background: linear-gradient(135deg, #10b981, #3b82f6);" }
"""

private let eventsCode = """
@MainActor struct EventsDemo: @preconcurrency Page {
    @State var message: String = "Click a button!"
    @State var clickCount: Int = 0

    var body: some Page {
        Div {
            HTML.P(message)
            HTML.Button("Say Hello")
                .onClick { message = "Hello, Sailor!" }
            HTML.Button("Count Click (\\(clickCount))")
                .onClick {
                    clickCount += 1
                    message = "Clicked \\(clickCount) times"
                }
        }
    }
}
"""

private let navigationCode = """
import Navigator

enum SiteRoute: Routable {
    case home
    case docs
    case examples

    static var patterns: [RoutePattern<SiteRoute>] {
        [
            .exact("/", .home),
            .exact("/docs", .docs),
            .exact("/examples", .examples),
        ]
    }

    var path: String {
        switch self {
        case .home: return "/"
        case .docs: return "/docs"
        case .examples: return "/examples"
        }
    }
}

// Type-safe navigation link:
Link(to: SiteRoute.docs) {
    HTML.Span("Go to Docs")
}

// Router switches content by route:
Router(for: SiteRoute.self) { route in
    switch route {
    case .home: HomePage()
    case .docs: DocsPage()
    case .examples: ExamplesPage()
    }
} notFound: {
    NotFoundPage()
}
"""
