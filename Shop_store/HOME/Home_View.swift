//
//  Home_View.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/30.
//

import SwiftUI

struct Home_View: View {
    
    @EnvironmentObject var MyData:ShopMenu
    @EnvironmentObject var AgeViews:VGinform
    @ObservedObject var MyDates = ShopMenu()
    
    var body: some View {
        NavigationView{
            VStack {
                VStack{
                    Circle()
                        .frame(width: 170, height: 170, alignment: .center)
                        .foregroundColor(Color(.lightGray))
                    Text("用戶名稱")
                }
                HStack{
                    Spacer()
                    NavigationLink{
                        PurchaseHistory()
                    } label:{
                        enterbuttom(entertext:"購買記錄")
                    }
                    Spacer()
                    NavigationLink{
                        Health_Guidelines_View()
                    } label:{
                        enterbuttom(entertext:"蔬果量指引")
                    }
                    Spacer()
                }
                Spacer()
                    .frame(height: 20)
                HStack{
                    Spacer()
                    NavigationLink{
                        Cartview()
                    } label:{
                        enterbuttom(entertext:"購物車")
                    }
                    Spacer()
                    NavigationLink{
                        Account()
                    } label:{
                        enterbuttom(entertext:"帳戶")
                    }
                    Spacer()
                }
                Spacer()
            }.navigationBarTitle(Text(" "),displayMode: .inline)
        }
    }
}

struct Home_View_Previews: PreviewProvider {
    static var previews: some View {
        Home_View().environmentObject(ShopMenu())
            .environmentObject(VGinform())
    }
}

struct enterbuttom: View {
    @State var entertext = " "
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 180, height: 180, alignment: .center)
                .cornerRadius(20)
                .foregroundColor(Color("HomecolorBU"))
            Text("\(entertext)")
                .foregroundColor(.black)
        }
    }
}
