//
//  CreationTracker.swift
//
//
//  Created by Daniel Pustotin on 08.10.2022.
//

public enum CreationTracker {
    public static func track<T>(_ creator: () -> T ) -> T {
        log.debug("\(T.self)")
        return creator()
    }
}
