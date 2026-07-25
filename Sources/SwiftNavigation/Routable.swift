//
//  Routable.swift
//  SwiftNavigation
//
//  Created by Youssif Hany on 24/07/2026.
//

import Foundation
import SwiftUI


@available(macOS 10.15, *)
public typealias Routable = View & Hashable

@available(macOS 10.15, *)
public protocol RoutableObject: AnyObject {

    associatedtype Destination: Routable

    var stack: [Destination] {get set}

    func navigate(to destination: Destination)
    func navigate(to destinations: [Destination])
    func navigateBack(_ count: Int)
    func navigateBack(to destination: Destination)
    func navigateToRoot()
}
