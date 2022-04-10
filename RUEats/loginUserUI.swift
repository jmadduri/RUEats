//
//  loginUserUI.swift
//  RUEats
//
//  Created by William Wu on 4/9/22.
//

import SwiftUI

struct loginUserUI: View {
    @State var isActive = false
    var body: some View {
        NavigationView{
            ZStack{
                Color(.gray).edgesIgnoringSafeArea(.all)
                //NavigationView{
                    VStack{
                        Text("RUeats")
                            .font(.system(size: 50.0, weight: .bold))
                        LoginFoodImage()
                        
                        NavigationLink(destination: getStartedUserUI().navigationBarHidden(true), isActive: $isActive, label: {
                            Text("Get Started")
                                .font(.title3).bold()
                                .foregroundColor(.white)
                                .frame(maxWidth: 350)
                                .padding()
                                .background(.blue)
                                .cornerRadius(55)
                        })
                        
                        NavigationLink(destination: UserLogin__w(), label: {
                            Text("Login In")
                                .font(.title3).bold()
                                .foregroundColor(.blue)
                                .frame(maxWidth: 350)
                                .padding()
                                .background(.white)
                                .cornerRadius(55)
                                .padding(.vertical)
                        })
                        //Spacer()
                    }
                    .padding()
                    
                }
            .navigationBarHidden(true)
        }
    }
}

struct loginUserUI_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            loginUserUI()
                .previewInterfaceOrientation(.portrait)
            loginUserUI()
        }
    }
}

struct GetStartedButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3).bold()
            .foregroundColor(.white)
            .frame(maxWidth: 350)
            .padding()
            .background(.blue)
            .cornerRadius(55)
    }
}

struct SignInButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3).bold()
            .foregroundColor(.blue)
            .frame(maxWidth: 350)
            .padding()
            .background(.white)
            .cornerRadius(55)
            .padding(.vertical)
    }
}

struct LoginFoodImage: View {
    var body: some View {
        Image("allfoods")
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 4))
            .shadow(color: .black, radius: 7)
            .padding(.bottom, 50)
    }
}
