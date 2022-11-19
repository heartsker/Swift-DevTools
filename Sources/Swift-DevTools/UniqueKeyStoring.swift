//
//  UniqueKeyStorable.swift
//
//
//  Created by Daniel Pustotin on 14.08.2022.
//

public protocol UniqueKeyStoring {
    var key: String { get }

    var uid: String { get }
}

// MARK: - Default implementation

public extension UniqueKeyStoring {
    var key: String {
        uid + String(describing: self)
    }
}
