//
//  ContentView.swift
//  my-swift-ui
//
//  Created by Theramed Boonrod on 18/8/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var myMoney: Double? = 300.0
    
    init() {
        //UITableView.appearance().backgroundColor = .clear
    }
    
    struct FormHiddenBackground: ViewModifier {
        func body(content: Content) -> some View {
            if #available(iOS 16.0, *) {
                content.scrollContentBackground(.hidden)
            } else {
                content.onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .onDisappear {
                    UITableView.appearance().backgroundColor = .systemGroupedBackground
                }
            }
        }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(
                Color.gray.opacity(0.4),
                lineWidth: 1
            )
            .background(.gray.opacity(0.1))
            .cornerRadius(10)
            .frame(height: 220)
            .padding()
            .overlay(
                VStack (alignment: .center) {
                    Form {
                        Section(header: Text("Password")) {
                            TextField("Password", text: $username)
                        }
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        //.background(Color.black)
                        .padding(0)
                        Section(header: Text("Username")) {
                            TextField("Username", text: $password)
                        }
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .padding(0)
                        
                    }
//                    .onAppear { // ADD THESE AFTER YOUR FORM VIEW
//                        UITableView.appearance().backgroundColor = .clear
//                    }
//                    .onDisappear { // CHANGE BACK TO SYSTEM's DEFAULT
//                        UITableView.appearance().backgroundColor = .systemGroupedBackground
//                    }
                    .disableAutocorrection(true)
                    //.scrollContentBackground(.hidden) // 👈 this line will work only on iOS 16 and above
                    //.foregroundColor(Color.blue)
                    //.background(Color.black)
                    .modifier(FormHiddenBackground())
                }
                .padding()
            )
        Button(
            action: {
                
            },
            label: {
                HStack {
                    Spacer()
                    Text("Login")
                    Spacer()
                }
            }
        )
        .buttonStyle(.borderedProminent)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
