//
//  UserDefaultsDemoApp.swift
//  UserDefaultsDemo
//
//  Created by Berke Turanlioglu on 18.02.2023.
//

import SwiftUI

@main
struct UserDefaultsDemoApp: App {
    
    // here we initialized it
    @StateObject var personViewModel = PersonViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(personViewModel)
                // this instance is also a must to be error-free
        }
    }
}
