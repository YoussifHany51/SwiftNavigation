//
//  Router.swift
//  SwiftNavigation
//
//  Created by Youssif Hany on 31/07/2026.
//

import SwiftUI

public final class Router<Routes: Routable>: ObservableObject, RoutableObject {

    public typealias Destination = Routes
    
    @Published public var stack: [Destination] = []

    public init() {}
}
