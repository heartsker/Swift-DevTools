//
//  Logger.swift
//
//
//  Created by Daniel Pustotin on 10.07.2022.
//

import struct Foundation.URLRequest

public let log = DevTools.Logger.shared

final public class Logger {
    // MARK: - Public properties

    public static let shared = Logger()

    // MARK: - Public methods

    public func log(_ message: @autoclosure () -> CustomStringConvertible?,
                    file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(.log, message: message(), file: file, function: function, line: line)
    }

    public func debug(_ message: @autoclosure () -> CustomStringConvertible?,
                      file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(.debug, message: message(), file: file, function: function, line: line)
    }

    public func critical(_ message: @autoclosure () -> CustomStringConvertible?,
                         file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(.critical, message: message(), file: file, function: function, line: line)
    }

    public func button(_ message: @autoclosure () -> CustomStringConvertible?,
                       file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(.button, message: message(), file: file, function: function, line: line)
    }

    public func loaded(_ message: @autoclosure () -> CustomStringConvertible?,
                       file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(.loaded, message: message(), file: file, function: function, line: line)
    }

    public func skipped(_ message: @autoclosure () -> CustomStringConvertible?,
                        file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(.skipped, message: message(), file: file, function: function, line: line)
    }

    public func request(_ request: URLRequest,
                        file: String = #fileID, function: String = #function, line: UInt = #line) {
        let message = "Method: \(request.httpMethod?.description ?? "[No method]")\n" +
            "URL: \(request.url?.absoluteURL.description ?? "[No URL]")"
        log(.request, message: message, file: file, function: function, line: line)
    }

    public func metric(_ message: @autoclosure () -> CustomStringConvertible?,
                       file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(.metric, message: message(), file: file, function: function, line: line)
    }

    // MARK: - Methods

    func timer(_ message: @autoclosure () -> CustomStringConvertible?,
               file: String = #fileID, function: String = #function, line: UInt = #line) {
        log(.timer, message: message(), file: file, function: function, line: line)
    }

    // MARK: - Private methods

    private func log(_ level: LogLevel, message: CustomStringConvertible?,
                     file: String, function: String, line: UInt) {
        #if DEBUG
        var str = "\t" + level.rawValue + ":\n"
        if level == .log {
            str = message?.description ?? ""
        } else {
            switch level {
            case .critical:
                str += "In file \(file)\nFunction `\(function)`\nLine \(line)\n"
                str += "\t\t\(message?.description ?? "`nil`")"
            default:
                str += message?.description ?? "`nil`"
            }
            str += "\n"
        }
        // swiftlint:disable:next print_call
        print(str)
        #endif
        lastLogLevel = level
    }

    // MARK: - Private properties

    private var lastLogLevel: LogLevel = .debug

    // MARK: - Private nesting

    private enum LogLevel: String, CaseIterable {
        case log
        case debug = "🛠 Debug 🛠"
        case critical = "🚨 Critical 🚨"
        case timer = "⏰ Timer ⏰"
        case button = "🔆 Button clicked 🔆"
        case loaded = "✅ Loaded ✅"
        case skipped = "🚫 Skipped 🚫"
        case request = "🌐 Request 🌐"
        case metric = "🧮 Metric 🧮"
    }
}
