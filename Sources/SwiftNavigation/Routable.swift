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

@available(macOS 10.15, *)
extension RoutableObject {
    
    public func navigate(to destiantion: Destination) {
        stack.append(destiantion)
    }
    
    public func navigate(to destiantions: [Destination]) {
        stack += destiantions
    }
    
    public func navigateBack(_ index: Int) {
        guard index > 0 else { return }
        let safeCount = min(index, stack.count)
        stack.removeLast(safeCount)
    }
    
    public func navigateBack(to destination: Destination) {
        if let index = stack.lastIndex(of: destination), index < stack.count {
            stack.removeLast(stack.count - index - 1)
        }
    }
    
    public func navigateToRoot() {
        stack.removeAll()
    }
}
