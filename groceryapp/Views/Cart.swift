//
//  Cart.swift
//  groceryapp
//
//  Created by Shubham on 16/03/24.
//

import SwiftUI

struct Cart: View {
    
    @State var totalPrice: Double = 0.0
    
    func calcTotal() {
        
        totalPrice = 0.0
        
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i][2] as! Double
        }
    }
    
    var body: some View {
        VStack{
            List{
                ForEach(0..<cartItems.endIndex, id: \.self){ item in
                    HStack {
                        Image(cartItems[item][0] as! String)
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                        VStack (spacing: 5){
                            Text(cartItems[item][1] as! String)
                            
                            Text("$ \(String(format: "%.2f", cartItems[item][2] as! Double))")
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    cartItems.remove(atOffsets: indexSet)
                    calcTotal()
                })
            }
            
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.green)
                    .frame(height: 120)
                
                HStack{
                    VStack (alignment: .leading){
                        Text("Total price")
                            .foregroundStyle(Color.white)
                        
                        Text("$ \(String(format: "%.2f", totalPrice))")
                            .font(.title)
                            .foregroundStyle(.white)
                    }.padding()
                    
                    Spacer()
                    
                    Button {
                        
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder()
                                .foregroundStyle(Color.white)
                                .frame(width: 120, height: 50)
                            
                            Text("Pay now >")
                                .foregroundStyle(.white)
                        }
                    }
                    .padding()
                }
            }
            .padding()
            
        }
        .onAppear(){
            calcTotal()
        }
        .navigationTitle("My cart")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    Cart()
}
