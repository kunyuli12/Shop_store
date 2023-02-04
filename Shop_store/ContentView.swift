//
//  ContentView.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/16.
//

import SwiftUI

struct ContentView: View {
    enum selectionName {
        case  shopping_cart
        case  home_view
    }//設定每個分支畫面的函數
    @StateObject var MyData = ShopMenu()//Shop的Model
    @StateObject var AgeViews = VGinform()
    @State var selectionId = selectionName.shopping_cart
    @State var numbers = "home"//進去的第一個畫面
    
    var body: some View {
        VStack {
            TabView(selection:$selectionId){//標記每個view
                Product_List().environmentObject(MyData)
                    .tabItem { Image(systemName:"cart.fill.badge.plus") }
                    .tag(selectionName.shopping_cart)
                Home_View().environmentObject(MyData)
                    .environmentObject(AgeViews)
                    .tabItem { Image(systemName:"house.fill") }
                    .tag(selectionName.home_view)
          }
        }.onAppear{
            selectionId = .home_view//優先顯示honeView得畫面
        }
      }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
