//
//  getStartedUserUI.swift
//  RUEats
//
//  Created by William Wu on 4/9/22.
//

import SwiftUI

struct getStartedUserUI: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var netID = ""
    @State var rutgersEmail = ""
    @State var reenterPassword = ""
    @State var password = ""
    @State var shouldRememberUser = false
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Personal Information")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                Section(header: Text("School Information")){
                    TextField("NetID", text: $netID)
                    TextField("Rutgers Email", text: $netID)
                    TextField("Password", text: $password)
                    TextField("Reenter Password", text: $reenterPassword)
                    Toggle(isOn: $shouldRememberUser, label: { Text("Remember Me?")
                    })
                }
            }
        }
        .navigationTitle("Create Your Account")
        //.navigationBarHidden(false)
    }
}

struct getStartedUserUI_Previews: PreviewProvider {
    @Binding var isActive: Bool
    static var previews: some View {
        getStartedUserUI()
            .preferredColorScheme(.dark)
    }
}
