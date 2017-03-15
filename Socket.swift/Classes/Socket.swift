//
//  Socket.swift
//  Socket.swift
//
//  Created by Draveness on 03/06/2017.
//  Copyright (c) 2017 Draveness. All rights reserved.
//

import Foundation

@_silgen_name("csocket_connect") private func csocket_connect(_ fd: Int32, _ host:UnsafePointer<UInt8>, _ port: Int32) -> Int32
@_silgen_name("csocket_read") private func csocket_read(_ fd: Int32, _ data:UnsafePointer<UInt8>, _ length: Int32) -> Int32

public struct Socket {
    let fd: Int32
    let host: String
    let port: Int32
    
    public enum SocketResult {
        case success
        case failure
    }
    
    public init(host: String, port: Int32 = 80) {
        self.host = host
        self.port = port
        self.fd = socket(AF_INET, SOCK_STREAM, 0)
    }
    
    public func connect() -> SocketResult {
        if csocket_connect(fd, host, port) == 0 {
            return .success
        } else {
            return .failure
        }
    }
    
    public func read(length: Int = 1024) -> String {
        var buffer = [UInt8](repeating: 0x0, count: length)
        csocket_read(fd, &buffer, Int32(length))
        return String(bytes: buffer, encoding: .utf8)!
    }
}
