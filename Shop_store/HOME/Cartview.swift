//
//  Cartview.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/25.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Cartview: View {
    
    @EnvironmentObject var mydata:ShopMenu
    @ObservedObject var Mydata = ShopMenu()
    @State var anser:Int = 0
    @State var showView:Bool = false
    @State var showNote:Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("購物車")
                    .font(.title)
                Rectangle()
                    .frame(maxWidth:.infinity)
                    .frame(height:1.5)
                ScrollView(showsIndicators:false) {
                    foodmenu()
                }
                Spacer()
                PriseView()
                Spacer()
                    .frame(height: 20)
            }.blur(radius: showView ? 9 : 0)
            CheckView().offset(x: showView ? 0:1000)
        }
    }
    @ViewBuilder func foodmenu() -> some View{
        VStack{
            ForEach(mydata.ShowOrder){od in
                HStack {
                    Image("\(od.Menu.ItemView)")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .padding(.leading,20)
                    VStack {
                        Text("\(od.Menu.productname)")
                            .font(.title)
                        Text("(\(od.Menu.foodwight)/一份|\(od.Menu.prise)元)")
                    }
                    Spacer()
                    HStack {
                        Text("\(od.numbers)")
                            .font(.title2)
                            .frame(width: 56, height: 40)
                            .cornerRadius(5)
                            .background(Color("healthybuttom3"))
                        Image(systemName: "minus.square.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .cornerRadius(5)
                            .onTapGesture {
                                mydata.lowerOrder(value: od.Menu,quanty: 1)
                                anser = mydata.sumPrise(temp_orders: mydata.ShowOrder)
                            }
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                            .cornerRadius(5)
                            .onTapGesture {
                                mydata.addOrder(value: od.Menu, quanty: 1)
                                anser = mydata.sumPrise(temp_orders: mydata.ShowOrder)
                            }
                    }.padding(.leading,15)
                    Spacer()
                    
                }
            }
        }
    }
    @ViewBuilder func PriseView() -> some View{
        HStack {
            VStack{
                Text("總共：")
                    .font(.title2)
                Text("\(anser)")
                    .font(.title2)
            }.padding(.leading,10)
            Spacer()
            Text("筆記")
                .font(.title)
                .frame(width: 75, height: 75)
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color("DarkGary")]), startPoint:.topLeading, endPoint:.bottomTrailing))
                .foregroundColor(.white)
                .cornerRadius(10)
                .onTapGesture {
                    showNote.toggle()
                }
                .blur(radius: showNote ? 9 : 0)
            
                .sheet(isPresented: $showNote){
                        NoteView()
                }
            Text("金額")
                .font(.title)
                .frame(width: 75, height: 75)
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color("DarkGary")]), startPoint:.topLeading, endPoint:.bottomTrailing))
                .foregroundColor(.white)
                .cornerRadius(10)
                .onTapGesture {
                    anser = mydata.sumPrise(temp_orders: mydata.ShowOrder)
                }
            Text("購買")
                .font(.title)
                .frame(width: 75, height: 75)
                .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color("DarkGary")]), startPoint:.topLeading, endPoint:.bottomTrailing))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.trailing,10)
                .onTapGesture {
                    showView.toggle()
                }
        }
}
    @ViewBuilder func CheckView() -> some View{
        VStack{
            Spacer()
            Text("確定結帳？")
                .font(.system(size: 35, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
            Spacer()
            HStack {
                Text("取消")
                    .font(.system(size: 35, weight: .heavy, design: .rounded))
                    .frame(width: 90, height: 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Darked"), Color.red]), startPoint:.topLeading, endPoint:.bottomTrailing))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .onTapGesture {
                        showView.toggle()
                    }
                Text("確定")
                    .font(.system(size: 35, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .onTapGesture {
                        mydata.orders.append(ONOrder(onOrder: mydata.ShowOrder))
                        mydata.ShowOrder.removeAll()
                        showView.toggle()
                        anser = 0
                    }
                    .frame(width: 90, height: 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Darked"), Color.red]), startPoint:.topLeading, endPoint:.bottomTrailing))
                    .cornerRadius(10)
               
            }
            Spacer()
        }.frame(width: 340, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color("DarkGary")]), startPoint:.topLeading, endPoint:.bottomTrailing))
            .cornerRadius(20)
    }
}

struct Cartview_Previews: PreviewProvider {
    static var previews: some View {
        Cartview().environmentObject(ShopMenu())
    }
}
