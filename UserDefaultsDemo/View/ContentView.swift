//
//  ContentView.swift
//  UserDefaultsDemo
//
//  Created by Berke Turanlioglu on 18.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    // here it is again, EnvironmentObject for the VM
    @EnvironmentObject var personViewModel: PersonViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Full Name") {
                    TextField("Enter your name...", text: $personViewModel.person.name)
                }
                Section("Birth Date and Gender") {
                    DatePicker(selection: $personViewModel.person.date,
                               in: ...Date.now, displayedComponents: .date) {
                        Text("Date of Birth")
                    }
                    Picker("Gender", selection: $personViewModel.person.gender) {
                        ForEach(0 ..< personViewModel.genders.count, id: \.self) {
                            Text(personViewModel.genders[$0])
                        }
                    }
                    .pickerStyle(.menu)
                }
                Button("Save the changes") {
                    personViewModel.savePerson()
                }
                .frame(maxWidth: .infinity) // to center it
            }
            .navigationTitle("Personal Information")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PersonViewModel())
    }
}
