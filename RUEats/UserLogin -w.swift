//
//  UserLogin -w.swift
//  RUEats
//
//  Created by William Wu on 4/9/22.
//

import SwiftUI

struct UserLogin__w: View {
    @State var netID = ""
    @State var rutgersEmail = ""
    @State var password = ""
    
    var body: some View {
        ZStack{
            NavigationView{
                VStack {
                    
                    
//                    TextField("NetID", text: $netID)
//                    TextField("Rutgers school Email", text: $rutgersEmail)
//                    TextField("Password", text: $password)
                    HStack{
                        Text("Forgot Password?")
                        Text("Reset Password")
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Welcome back!")
        }
    }
}

struct UserLogin__w_Previews: PreviewProvider {
    static var previews: some View {
        UserLogin__w()
    }
}
