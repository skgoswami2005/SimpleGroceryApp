//
//  ContentView.swift
//  groceryapp
//
//  Created by Shubham on 13/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var changeScreen: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 50) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text("We deliver \ngrocery at your \ndoorstep")
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                
                Text("groccer gives you fresh vegetables and fruits, \nOrder fresh at groccer")
                    .multilineTextAlignment(.center )
                
                Button{
                    changeScreen = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                        
                        Text("Get started")
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                }
                .frame(width: 200, height: 70)
                .foregroundStyle(Color.purple)
            }
            .navigationDestination(isPresented: $changeScreen) {
                Shop()
            }
        }
    }
}

#Preview {
    ContentView()
}
