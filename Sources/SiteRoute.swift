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
