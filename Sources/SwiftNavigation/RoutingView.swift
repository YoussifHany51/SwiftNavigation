//
//  RoutingView.swift
//  SwiftNavigation
//
//  Created by Youssif Hany on 31/07/2026.
//

import SwiftUI

public struct RoutingView<Root: View, Routes: Routable>: View {
    @Binding private var routes: [Routes]
    private let root: () -> Root

    public init(routes: Binding<[Routes]>,
                @ViewBuilder root: @escaping () -> Root) {
        self._routes = routes
        self.root = root
    }

    public var body: some View {
        NavigationStack(path: $routes) {
            root()
                .navigationDestination(for: Routes.self) { view in
                    view.body
                }
        }
    }
}
