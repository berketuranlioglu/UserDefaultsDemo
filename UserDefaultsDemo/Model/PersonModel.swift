//
//  PersonModel.swift
//  UserDefaultsDemo
//
//  Created by Berke Turanlioglu on 18.02.2023.
//

import Foundation

// Codable stands for both Encodable and Decodable
// It is used to store and fetch the data from UserDefaults
struct Person: Codable {
    var name: String
    var date: Date
    var gender: Int
}
