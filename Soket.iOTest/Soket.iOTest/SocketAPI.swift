//
//  SocketAPI.swift
//  Soket.iOTest
//
//  Created by 김기영 on 2021/12/22.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
    static let shaerd = SocketIOManager()
    var manager = SocketManager(socketURL: URL(string: "211.38.86.92:8081")!)
    var socket: SocketIOClient!
    
    override init() {
        super.init()
        socket = self.manager.socket(forNamespace: "/test")
        
        socket.on("test") { dataArray, ack in
            print(dataArray)
        }
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func sendMessage(_ message: String, _ nickName: String) {
        socket.emit("event", ["message" : "This is a test message"])
        socket.emit("event1", [["name" : "ns"], ["email" : "@naver.com"]])
        socket.emit("event2", ["name": "ns", "email": "@naver.com"])
        socket.emit("msg", ["nick": nickName, "msg": message])
    }
}
