//
//  Timer.swift
//
//
//  Created by Daniel Pustotin on 10.07.2022.
//

import Dispatch

public typealias Timer = Logger.Timer

extension Logger {
    final public class Timer {
        // MARK: - Constructor

        public init(_ title: String = String()) {
            self.title = title
        }

        // MARK: - Public methods

        public func tic() {
            start = DispatchTime.now()
        }

        public func tac() {
            end = DispatchTime.now()

            guard let start = start, let end = end else {
                return
            }

            let diff: Double = {
                (end - start).translate(in: .millisecond)
            }()

            DevTools.log.timer("\(title) took \(diff) ms")
        }

        // MARK: - Private properties

        private var title: String

        private var start: DispatchTime?
        private var end: DispatchTime?
    }
}
