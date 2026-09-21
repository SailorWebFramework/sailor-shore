import Sailor
import Navigator
import Tailwind

@MainActor struct DocsPage: @preconcurrency Page {
    var body: some Page {
        Div {
            Div {
                H1("Getting Started with Sailor")
                    .classes {
                        TW.text4xl
                        TW.fontBold
                        TW.mb2
                    }
                    .style { "padding-top: 100px;" }

                Paragraph("Build type-safe web apps in pure Swift, compiled to WebAssembly.")
                    .classes {
                        TW.textXl
                        TW.textSlate400
                        TW.mb8
                    }

                // Step 1: Creating a project
                DocSection(
                    step: "1",
                    title: "Create Your Project",
                    description: "Start with a standard Swift package. Sailor apps are Swift executables that compile to WebAssembly."
                )
                DocCodeBlock("""
                mkdir MySailorApp && cd MySailorApp
                swift package init --type executable
                """)

                // Step 2: Add dependency
                DocSection(
                    step: "2",
                    title: "Add the Sailor Dependency",
                    description: "Add Sailor to your Package.swift. You can also add Navigator for routing and Fleet-Tailwind for utility-class styling."
                )
                DocCodeBlock("""
                // swift-tools-version: 6.0
                import PackageDescription

                let package = Package(
                    name: "MySailorApp",
                    platforms: [.macOS(.v13)],
                    dependencies: [
                        .package(url: "https://github.com/SailorWebFramework/Sailor",
                                 branch: "feature-fin"),
                    ],
                    targets: [
                        .executableTarget(
                            name: "MySailorApp",
                            dependencies: ["Sailor"],
                            path: "Sources"
                        ),
                    ]
                )
                """)

                // Step 3: First page
                DocSection(
                    step: "3",
                    title: "Write Your First Page",
                    description: "A Sailor app is a struct conforming to Website. It defines a head (metadata) and a body (content). Every HTML tag is a Swift type with typed attributes."
                )
                DocCodeBlock("""
                import Sailor

                @main
                struct MySailorApp: @preconcurrency Website {

                    @MainActor var head: some Head {
                        HTML.Head {
                            HTML.Title("My App")
                            HTML.Meta().charset("UTF-8")
                        }
                    }

                    @MainActor var body: some Body {
                        HTML.Body {
                            HTML.H1("Hello, Sailor!")
                            HTML.P("This is my first Sailor app.")
                        }
                    }
                }
                """)

                // Step 4: Reactivity
                DocSection(
                    step: "4",
                    title: "Add Reactivity with @State",
                    description: "Use @State to create reactive properties. When a @State value changes, only the elements that depend on it re-render automatically. No virtual DOM, no manual subscriptions."
                )
                DocCodeBlock("""
                import Sailor
                import Sailboat

                @MainActor struct Counter: @preconcurrency Page {
                    @State var count: Int = 0

                    var body: some Page {
                        HTML.Div {
                            HTML.Span("Count: \\(count)")
                                .style {
                                    CSS.font(size: .px(24))
                                    CSS.font(weight: .bold)
                                }

                            HTML.Button("Increment")
                                .onClick { count += 1 }

                            HTML.Button("Reset")
                                .onClick { count = 0 }
                        }
                    }
                }
                """)

                // Step 5: Styling with Tailwind
                DocSection(
                    step: "5",
                    title: "Style with Tailwind Classes",
                    description: "Use Fleet-Tailwind for utility-class styling alongside Sailor's typed CSS. The .classes { } result builder accepts TW constants that map to Tailwind CSS classes."
                )
                DocCodeBlock("""
                import Tailwind

                HTML.Div {
                    HTML.H1("Styled Heading")
                        .classes {
                            TW.text4xl
                            TW.fontBold
                            TW.textBlue400
                        }
                    HTML.P("Mix TW classes with inline CSS.")
                        .classes {
                            TW.textSlate400
                            TW.textLg
                        }
                        .style {
                            "line-height: 1.8;"
                        }
                }
                .classes {
                    TW.p6
                    TW.bgGray900
                    TW.roundedLg
                    TW.flex
                    TW.flexCol
                    TW.gap4
                }
                """)

                // Step 6: Routing
                DocSection(
                    step: "6",
                    title: "Add Navigation with Typed Routes",
                    description: "Use Navigator for client-side routing. Define your routes as an enum conforming to Routable, then use Router to render pages and Link for navigation."
                )
                DocCodeBlock("""
                import Navigator

                enum AppRoute: Routable {
                    case home
                    case about
                    case blog

                    static var patterns: [RoutePattern<AppRoute>] {
                        [
                            .exact("/", .home),
                            .exact("/about", .about),
                            .exact("/blog", .blog),
                        ]
                    }

                    var path: String {
                        switch self {
                        case .home: return "/"
                        case .about: return "/about"
                        case .blog: return "/blog"
                        }
                    }
                }

                // In your body:
                Router(for: AppRoute.self) { route in
                    switch route {
                    case .home: HomePage()
                    case .about: AboutPage()
                    case .blog: BlogPage()
                    }
                } notFound: {
                    NotFoundPage()
                }

                // For navigation links:
                Link(to: AppRoute.about) {
                    HTML.Span("About Us")
                }
                """)

                // Step 7: Build and run
                DocSection(
                    step: "7",
                    title: "Build and Run",
                    description: "Compile to WebAssembly and serve locally. Your app runs at near-native speed in the browser with no JavaScript runtime."
                )
                DocCodeBlock("""
                # Build for WebAssembly
                swift build --swift-sdk wasm

                # Serve locally
                swift package js --serve

                # Open http://localhost:8080
                """)

                // Next steps
                Div {
                    H2("Next Steps")
                        .classes {
                            TW.text2xl
                            TW.fontBold
                            TW.mb4
                        }
                    Ul {
                        Li {
                            Link(to: SiteRoute.examples) {
                                Span("Browse interactive examples")
                                    .classes { TW.textBlue400 }
                            }
                        }
                        Li("Explore the Treasure specification for all available HTML tags and CSS properties")
                        Li("Check out the Shipwright code generator to understand how Sailor stays up to date")
                        Li {
                            Anchor("View the source on GitHub")
                                .href("https://github.com/SailorWebFramework")
                                .classes { TW.textBlue400 }
                        }
                    }
                    .classes {
                        TW.textSlate300
                    }
                    .style {
                        "list-style: disc; padding-left: 24px;"
                        "line-height: 2;"
                    }
                }
                .classes {
                    TW.mt8
                    TW.p6
                    TW.bgGray900
                    TW.roundedLg
                }
                .style { "border: 1px solid #1e293b;" }
            }
            .classes {
                TW.mAuto
                TW.p6
            }
            .style {
                CSS.max(width: .px(800))
                "padding-bottom: 80px;"
            }
        }
    }
}

// MARK: - Doc Components

@MainActor struct DocSection: @preconcurrency Page {
    let step: String
    let title: String
    let description: String

    init(step: String, title: String, description: String) {
        self.step = step
        self.title = title
        self.description = description
    }

    var body: some Page {
        Div {
            Div {
                Span(step)
                    .classes {
                        TW.inlineBlock
                        TW.w8
                        TW.textCenter
                        TW.bgBlue500
                        TW.textWhite
                        TW.fontBold
                        TW.textSm
                        TW.roundedFull
                    }
                    .style { "height: 32px; line-height: 32px;" }
                H2(title)
                    .classes {
                        TW.text2xl
                        TW.fontBold
                    }
                    .style { "margin: 0;" }
            }
            .classes {
                TW.flex
                TW.itemsCenter
                TW.gap4
            }
            Paragraph(description)
                .classes {
                    TW.textSlate300
                    TW.textBase
                    TW.mt2
                    TW.mb4
                }
        }
        .classes { TW.mt8 }
    }
}

@MainActor struct DocCodeBlock: @preconcurrency Page {
    let code: String

    init(_ code: String) {
        self.code = code
    }

    var body: some Page {
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
            TW.mb6
            TW.p6
            TW.roundedLg
            TW.overflowAuto
        }
        .style {
            CSS.background(color: .hex("#0f172a"))
            "border: 1px solid #1e293b;"
            "white-space: pre-wrap;"
            "word-break: break-word;"
        }
    }
}
