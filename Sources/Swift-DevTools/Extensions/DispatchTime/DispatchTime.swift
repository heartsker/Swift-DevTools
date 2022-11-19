//
//  DispatchTime.swift
//
//
//  Created by Daniel Pustotin on 28.08.2022.
//

import Dispatch

public extension DispatchTime {
    // MARK: - Public nesting

    enum Interval: Double {
        case second = 1_000_000_000.0
        case millisecond = 1_000_000.0
        case microsecond = 1_000.0
        case nanosecond = 1.0
    }

    // MARK: - Public methods

    func translate(in interval: Interval = .millisecond) -> Double {
        (Double(uptimeNanoseconds) / interval.rawValue * 100.0).rounded() / 100.0
    }

    static func - (lhs: DispatchTime, rhs: DispatchTime) -> DispatchTime {
        DispatchTime(uptimeNanoseconds: lhs.uptimeNanoseconds - rhs.uptimeNanoseconds)
    }
}

extension DispatchTime: CustomStringConvertible {
    public var description: String {
        "\(translate()) ms"
    }
}
