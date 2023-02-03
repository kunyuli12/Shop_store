//
//  Product_List.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/1/30.
//

import SwiftUI

struct Product_List: View {
    //蔬果清單
    @EnvironmentObject var MyData:ShopMenu//Shop的Ｍodel
    @State var textview:String = ""
    @State var numbernew:Int = 0
    @State var shownumber = ""//價錢計算
    @State var chock = false//按鈕開關
    @State var chock_again = false//按鈕開關
    @State var onoff = false//按鈕開關
    var body: some View {
        NavigationView{
        VStack{
            HStack {
                TextField("搜尋...",text: $textview)
                    .padding(8)
                    .textFieldStyle(.roundedBorder)
                Button{
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .center)
                        .padding(9)
                        .background(Color(.green))
                        .cornerRadius(15)
                        .padding(.trailing,5)
                }
            }
            ScrollView(showsIndicators:false) {
                ForEach(MyData.Buying){ mu in //mu 是每次回圈時所帶的值
                    NavigationLink{
                        ZStack{
                        VStack{
                            ProductView(image: mu.ItemView, Itemname: mu.productname, money: mu.prise, weight: mu.foodwight, supply: mu.supply)
                            ZStack{
                                HStack {
                                    Spacer()
                                    Text("購買數量")
                                        .font(.title2)
                                    TextField("",text: $shownumber)
                                        .frame(maxWidth:.infinity )
                                        .frame( height: 40, alignment: .center)
                                        .padding(.horizontal,10)
                                        .background(Color("Colorone"))
                                        .cornerRadius(20)
                                        .padding(.leading,2)
                                        .padding(.trailing,2)
                                    
                                    ButtonImage(Imagename:"minus.square.fill" )
                                        .onTapGesture {
                                            if  numbernew > 0 {
                                                numbernew -= 1
                                            }
                                        }
                                    ButtonImage(Imagename:"plus.square.fill")
                                        .onTapGesture {
                                            numbernew += 1
                                        };
                                    Spacer()
                                }
                                HStack {
                                    Text("\(numbernew)")
                                }
                            }.padding(.top,15)
                            Text("購買")
                                .font(.title2)
                                .frame(width: 100, height: 50)
                                .cornerRadius(10)
                                .background(Color(.gray))
                                .cornerRadius(5)
                                .onTapGesture {
                                    if numbernew > 0 {
                                        chock.toggle() }
                                    else{
                                        chock_again.toggle()
                                }  }
                        }.blur(radius: chock ? 9 : 0)
                         .blur(radius: chock_again ? 9 : 0)
                            VStack{
                                Spacer()
                                Text("確定購買？")
                                    .font(.system(size: 35, weight: .heavy, design: .rounded))
                                    .foregroundColor(.white)
                                Spacer()
                                HStack {
                                    Text("取消")
                                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 50)
                                        .background(Color(.red))
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            chock.toggle()
                                    }

                                    Text("確定")
                                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 50)
                                        .background(Color(.red))
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            MyData.addOrder(value: mu, quanty: numbernew)
                                            numbernew = 0
                                            chock.toggle()
                                    }
                                }
                                Spacer()
                            }.frame(width: 340, height: 200)
                                .background(Color(.gray))
                                .cornerRadius(20)
                                .offset(x:chock ? 0:1000)
                            VStack{
                                Spacer()
                                Text("請填入購買的數量")
                                    .font(.system(size: 35, weight: .heavy, design: .rounded))
                                    .foregroundColor(.white)
                                Spacer()

                                    Text("ＯＫ ")
                                        .font(.system(size: 35, weight: .heavy, design: .rounded))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 50)
                                        .background(Color(.red))
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            chock_again.toggle()
                                }
                                Spacer()
                            }.frame(width: 340, height: 200)
                                .background(Color(.gray))
                                .cornerRadius(20)
                                .offset(x:chock_again ? 0:1000)
                        }
                    } label: {
                        HStack{
                            Image("\(mu.ItemView)")//商品圖示
                                .resizable()
                                .frame(width: 110, height: 110)
                                .cornerRadius(20)
                            VStack{
                                Text("\(mu.productname)")//商品名稱
                                    .font(.title)
                                    .padding(.vertical,10)
                                    .foregroundColor(.black)
                                Text("＄\(mu.prise)元(NT)")//價錢
                                    .font(.title)
                                    .padding(.bottom,10)
                                    .foregroundColor(.black)
                            }.padding(.vertical,10)
                            Spacer()
                        }.frame(maxWidth:.infinity)//寬度最寬
                            .padding(.leading,15)
                    }
                }
                            }
            Spacer()
        }.navigationBarTitle(Text("商品清單"),displayMode: .inline)
        }
    }
}

struct Product_List_Previews: PreviewProvider {
    static var previews: some View {
        Product_List().environmentObject(ShopMenu())
    }
}

struct ButtonImage: View {
    @State var Imagename = ""
    var body: some View {
        Image(systemName: Imagename)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.gray)
            .cornerRadius(5)
            
    }
}
