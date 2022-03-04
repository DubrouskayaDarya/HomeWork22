//
//  ApiConstants.swift
//  HomeWork22
//
//  Created by Дарья Дубровская on 3.03.22.
//

import Foundation

class ApiConstants {
    static let serverPath = "http://localhost:3000/"
    static let postsPath = serverPath + "posts"
    static let postsPathURL = URL(string: postsPath)
    static let remoteUsersUrl = URL (string: "https://jsonplaceholder.typicode.com/users")
}
