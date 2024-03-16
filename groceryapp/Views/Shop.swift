//
//  Shop.swift
//  groceryapp
//
//  Created by Shubham on 13/03/24.
//

import SwiftUI

struct Shop: View {
    
    var items: [[Any]] = shopItems
    @State var goToCart: Bool = false
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 5) {
            VStack{
                Text("Good morning")
                    .frame(width: 320, alignment: .leading)
                    .foregroundStyle(Color.gray)
                
                Text("Let's order fresh \nitems for you")
                    .font(.system(size: 38, weight: .semibold, design: .rounded))
                    .frame(width: 320, alignment: .leading)
                
                Spacer().frame(height: 75)
                
                Text("Fresh Items")
                    .frame(width: 320, alignment: .leading)
                    .foregroundStyle(Color.gray)
            }.padding(20)
            
            
            ScrollView() {
                LazyVGrid(columns: columns, spacing: 30 ){
                    ForEach(0..<items.count, id: \.self) { item in
                        ShopItem(imageName: items[item][0] as! String, title: items[item][1] as! String, price: items[item][2] as! Double, color: items[item][3] as!Color, selfIndex: item)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(){
                NavigationLink{
                    Cart()
                } label: {
                    Image(systemName: "cart")
                }
            }
        }
    }
}

#Preview {
    Shop()
}
