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
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 170, height: 170, alignment: .center)
                        .foregroundColor(Color(.lightGray))
                    Text("用戶名稱")                }
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
            Text("\(entertext)")
                .foregroundColor(.white)
                .font(.title2)
                .frame(width: 180, height: 180, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint:.topLeading, endPoint:.bottomTrailing))
                .cornerRadius(20)
        }
    }
}
/*
 Rectangle()
     .frame(width: 180, height: 180, alignment: .center)
     .cornerRadius(20)
     .foregroundColor(Color("HomecolorBU"))
 
 .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
 Button("新增多比資料"){
     IntegrateDate.addAll(shops: [
         Menu(ItemView:"images-2", productname: "白花芥藍", prise: 30, supply: "賴寬宏", foodwight: "?", number: 0),
         Menu(ItemView:"images-3", productname: "白花椰", prise: 50, supply: "賴寬宏", foodwight: "?", number: 0),
         Menu(ItemView:"images-4", productname: "牛奶白菜", prise: 40, supply: "賴寬宏", foodwight: "?", number: 0),
         Menu(ItemView:"images-9", productname: "甜羅美", prise: 25, supply: "黃詩瑜", foodwight: "?", number: 0),
         Menu(ItemView:"images-10", productname: "大陸妹", prise: 30, supply: "黃詩瑜", foodwight: "?", number: 0),
         Menu(ItemView:"images-11", productname: "咸豐菜", prise: 25, supply: "謝唯琪", foodwight: "?", number: 0),
         Menu(ItemView:"images-12", productname: "人參菜", prise: 25, supply: "謝唯琪", foodwight: "?", number: 0),
         Menu(ItemView:"images-13", productname: "山葵葉", prise: 55, supply: "陳守安", foodwight: "?", number: 0),
         Menu(ItemView:"images-14", productname: "豆瓣菜", prise: 35, supply: "黃金山", foodwight: "?", number: 0),
         Menu(ItemView:"images-15", productname: "黑葉白菜", prise: 35, supply: "黃金山", foodwight: "?", number: 0),
         Menu(ItemView:"images-16", productname: "龍葵", prise: 35, supply: "黃金山", foodwight: "?", number: 0)
     ])
 }

 */
