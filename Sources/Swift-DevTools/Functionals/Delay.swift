//
//  Delay.swift
//
//
//  Created by Daniel Pustotin on 26.10.2022.
//

import Dispatch

public func delay(_ time: Double = 1.0, action: VoidAction? = nil) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        action?()
    }
}
