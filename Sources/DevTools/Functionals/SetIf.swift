//
//  SetIf.swift
//
//
//  Created by Daniel Pustotin on 11.10.2022.
//

@discardableResult
public func set<T>(_ object: inout T, to value: T, if condition: Bool) -> T {
    if condition {
        object = value
    }
    return object
}
