//
//  Server.swift
//  Server
//
//  Created by nyannyan0328 on 2021/09/13.
//

import SwiftUI

struct Server: Identifiable {
    var id = UUID().uuidString
    var name : String
    var flag : String
}

var severs = [

Server(name: "United States", flag: "us"),
Server(name: "India", flag: "in"),
Server(name: "United Kingdom", flag: "uk"),
Server(name: "France", flag: "fr"),
Server(name: "Germany", flag: "ge"),
Server(name: "Singapore", flag: "si"),

]

