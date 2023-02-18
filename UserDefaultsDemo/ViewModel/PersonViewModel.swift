//
//  PersonViewModel.swift
//  UserDefaultsDemo
//
//  Created by Berke Turanlioglu on 18.02.2023.
//

import Foundation

class PersonViewModel: ObservableObject {
    
    // created person with placeholders
    @Published var person = Person(name: "", date: Date.now, gender: 0)
    
    let genders = ["Male", "Female"] // for the picker view
    let key: String = "savedPerson"  // key for UserDefaults
    
    // ObservableObject classes require an initializer
    init() {
        guard
            // first, we have to reach the stored data
            let data = UserDefaults.standard.data(forKey: key),
            
            // then, it is time to "decode" the struct
            // because there is no direct storage method of structs
            // you have to encode and decode a struct to store
            let savedPerson = try? JSONDecoder().decode(Person.self, from: data)
        else { return }
        
        // person variable is now fetched and being used/
        self.person = savedPerson
    }
    
    // when we hit the save button in our view
    // this function will be used
    func savePerson() {
        // again, first encode it to JSON to store
        if let data = try? JSONEncoder().encode(person) {
            // now you can store with .standard.set
            UserDefaults.standard.set(data, forKey: key)
        } else { return }
    }
}
