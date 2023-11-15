//
//  Message.swift
//  transporttt
//
//  Created by haffa dhifi on 15/11/2023.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
