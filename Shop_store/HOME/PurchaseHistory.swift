//
//  PurchaseHistory.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/25.
//

import SwiftUI

struct PurchaseHistory: View {
    
    @EnvironmentObject var MyData:ShopMenu
    @State var ShowOrder = false
    @State var indexId = 0
    @State var anser = 0
    @State var myorder = [
        Order(Menu: Menu(ItemView: "Broccoli", productname: "花椰菜", prise: 70, supply: "", foodwight: "2台斤", number: 1), numbers: 1)
    ]
    
    var body: some View {
        VStack {
            Text("購買紀錄")
                .font(.title)
            Rectangle()
                .frame(maxWidth:.infinity)
                .frame(height:1.5)
            Spacer()
            ScrollView(showsIndicators:false) {
                HistoryView()
            }
        }.blur(radius: ShowOrder ? 9 : 0)
            .sheet(isPresented: $ShowOrder){
                showList()
            }
    }
    @ViewBuilder func HistoryView() -> some View{
        ForEach(1..<MyData.orders.count,id:\.self){od in
            HStack {
                Text("第\(od)筆")
                    .offset(x:-40)
                    .font(.title)
                VStack{
                    Text("歷史紀錄")
                        .font(.title)
                        .foregroundColor(Color(.gray))
                   
                    ForEach(myorder){ my in
                        Text("\(my.Menu.prise)元")
                            .font(.title2)
                            .foregroundColor(Color(.gray))
                    }
                    
                }
            }.frame(width: 370, height: 100)
                .background(Color("yellowlight"))
                .cornerRadius(20)
                .onTapGesture {
                    ShowOrder.toggle()
                    myorder = MyData.orders[od].onOrder
            }
        }
    }
    @ViewBuilder func showList() -> some View{
        ZStack{
            Rectangle()
                .foregroundColor(Color("WhiteOne"))
            VStack{
                Text("歷史紀錄")
                    .font(.title)
                ScrollView {
                    ForEach(myorder){ myod in
                        HStack {
                            Image("\(myod.Menu.ItemView)")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .padding(.leading,20)
                            VStack{
                                Text("\(myod.Menu.productname)")
                                .font(.title)
                                Text("(一份|\(myod.Menu.prise)元)")
                            }
                            Text("\(myod.numbers)")
                                .font(.title2)
                                .frame(width: 56, height: 40)
                                .background(Color("healthybuttom3"))
                                .cornerRadius(20)
                        }.frame(width: 370, height: 120)
                        .background(Color("WhiteTwo"))
                        .cornerRadius(15)
                    }
                }
            }
        }
    }
}

struct PurchaseHistory_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseHistory().environmentObject(ShopMenu())
    }
}
