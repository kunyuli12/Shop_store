//
//  Health_Guidelines_View.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/2/3.
//

import SwiftUI

struct Health_Guidelines_View: View {
    @EnvironmentObject var AgeViews:VGinform
    @State var quanty_B:Int = 0
    @State var quanty_G:Int = 0
    @State var isAddTitle = " "
    @State var isLowTitle = " "
    @State var anserVGB:Float = 0.0
    @State var anserFUB:Float = 0.0
    @State var anserVGG:Float = 0.0
    @State var anserFUG:Float = 0.0
    @State var anserVG:Float = 0.0
    @State var anserFU:Float = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            Text("家庭人數計算")
                .font(.largeTitle)
                .padding(.vertical,20)
            Rectangle()
                .frame(maxWidth:.infinity)
                .frame(height:1.5)
            TabView{
                boyview()
                girlview()
            }.tabViewStyle(PageTabViewStyle())
                Text("蔬菜需要\(String(format: "%.0f",anserVG))份")
                    .font(.title)
                Text("水果需要\(String(format: "%.0f",anserFU))份")
                    .font(.title)
            Spacer()
        }
    }
    @ViewBuilder func boyview() -> some View{
        HStack {
            VStack(alignment: .leading,spacing: 20){
                Text("男生")//標題
                    .font(.system(size: 30, weight: .heavy, design: .rounded))
                ForEach(AgeViews.AGEbox_B){ ags in //迴圈帶入每個年齡層的資訊
                    VStack(alignment: .leading,spacing: 15){
                        HStack {
                            AgeView(Agelimits: ags.Age)//要回圈的文字
                            Text("\(String(format: "%.0f", ags.population))人")
                                .font(.title2)
                            Spacer()
                            Image(systemName: "minus.circle.fill")//減少的按鍵
                                .resizable()
                                .frame(width: 25, height: 25 )
                                .foregroundColor(isLowTitle == ags.Age ? Color.red : Color.blue)
                                .onTapGesture {
                                    AgeViews.LowBoy(value: ags, quanty: 1)//漸少
                                    anserVGB = AgeViews.VGDemandB(tempBoy: AgeViews.AGEbox_B)
                                    anserFUB = AgeViews.FriutDemandB(tempBoy: AgeViews.AGEbox_B)
                                    anserVG = anserVGB + anserVGG//計算男生的蔬果量結果
                                    anserFU = anserFUB + anserFUG//計算女生蔬果量結果
                                    withAnimation(.easeInOut) {
                                        isLowTitle = ags.Age
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            isLowTitle = ""
                                        }
                                    }
                                }
                            Image(systemName: "plus.circle.fill")//增加的按鍵
                                .resizable()
                                .frame(width: 25, height: 25 )
                                .foregroundColor(isAddTitle == ags.Age ? Color.red : Color.blue)
                                .onTapGesture {
                                    AgeViews.AddBoy(value: ags,quanty: 1)//漸少
                                    anserVGB = AgeViews.VGDemandB(tempBoy: AgeViews.AGEbox_B)
                                    anserFUB = AgeViews.FriutDemandB(tempBoy: AgeViews.AGEbox_B)
                                    anserVG = anserVGB + anserVGG//計算男生的蔬果量結果
                                    anserFU = anserFUB + anserFUG//計算女生蔬果量結果
                                    withAnimation(.easeInOut) {
                                        isAddTitle = ags.Age
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            isAddTitle = ""
                                        }
                                    }

                                }
                        }
                    }
                }
               Spacer().frame(width:200)
            }
            //Spacer()
        }
        .frame(width: 300, height: 450)
        .padding()
        .background(Color("確定Color"))
        .cornerRadius(15)
    }
    @ViewBuilder func girlview() -> some View{
        HStack {
            VStack(alignment: .leading,spacing: 20){
                Text("女生")
                    .font(.system(size: 30, weight: .heavy, design: .rounded))
                ForEach(AgeViews.AGEbox_G){ ags in
                    VStack(alignment: .leading,spacing: 15){
                        HStack {
                            AgeView(Agelimits: ags.Age)
                            Text("\(String(format: "%.0f", ags.population))人")
                                .font(.title2)
                            Spacer()
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25 )
                                .foregroundColor(isLowTitle == ags.Age ? Color.red : Color.blue)
                                .onTapGesture {
                                    AgeViews.LowGirl(value: ags, quanty: 1)
                                    anserVGG = AgeViews.VGDemandG(tempGirl: AgeViews.AGEbox_G)
                                    anserFUG = AgeViews.FriutDemandG(tempGirl: AgeViews.AGEbox_G)
                                    anserVG = anserVGB + anserVGG
                                    anserFU = anserFUB + anserFUG
                                    withAnimation(.easeInOut) {
                                        isLowTitle = ags.Age
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            isLowTitle = ""
                                        }
                                    }

                                }
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25 )
                                .foregroundColor(isAddTitle == ags.Age ? Color.red : Color.blue)
                                .onTapGesture {
                                    AgeViews.AddGirl(value: ags, quanty: 1)
                                    anserVGG = AgeViews.VGDemandG(tempGirl: AgeViews.AGEbox_G)
                                    anserFUG = AgeViews.FriutDemandG(tempGirl: AgeViews.AGEbox_G)
                                    anserVG = anserVGB + anserVGG
                                    anserFU = anserFUB + anserFUG
                                    withAnimation(.easeInOut) {
                                        isAddTitle = ags.Age
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            isAddTitle = ""
                                        }
                                    }

                                }
                        }
                    }
                }
                Spacer().frame(width:200)
            }
            Spacer()
        }
        .frame(width: 300, height: 450)
        .padding()
        .background(Color("確定Color"))
        .cornerRadius(15)
    }
}

struct Health_Guidelines_View_Previews: PreviewProvider {
    static var previews: some View {
        Health_Guidelines_View().environmentObject(VGinform())
    }
}
