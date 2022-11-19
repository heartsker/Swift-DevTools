//
//  Apply.swift
//
//
//  Created by Daniel Pustotin on 01.09.2022.
//

@discardableResult
public func apply<T>(to object: T, action: Applicator<T>) -> T {
    action(object)
    return object
}
