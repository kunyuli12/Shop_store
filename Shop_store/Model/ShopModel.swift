//
//  ShopModel.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/2/1.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Menu:Identifiable,Hashable,Codable{
    var id = UUID().uuidString
    var ItemView:String//商品圖示
    var productname:String//商品名稱
    var prise:Int//價格
    var supply:String//生產者
    var foodwight:String//商品重量
    var number:Int//商品數量
}
struct Order:Identifiable,Hashable,Codable{
    var id = UUID().uuidString
    var Menu:Menu//連接menu
    var numbers:Int//商品數量
}
struct ONOrder:Identifiable,Hashable,Codable{
    var id = UUID().uuidString
    var onOrder:[Order]
}

class ShopMenu:ObservableObject{
    @Published var Buying:[Menu] = [Menu]()
    @Published var ShowOrder = [Order]()
    @Published var orders = [ONOrder]()
    
    init(){
        shoping()
        orders = [
            ONOrder(onOrder: ShowOrder)
            ]
    }
    func shoping(){
        Buying = [Menu(ItemView:"images-2", productname: "白花芥藍", prise: 30, supply: "賴寬宏", foodwight: "?", number: 0),
                  Menu(ItemView:"images-3", productname: "白花椰", prise: 50, supply: "賴寬宏", foodwight: "?", number: 0),
                  Menu(ItemView:"images-4", productname: "牛奶白菜", prise: 40, supply: "賴寬宏", foodwight: "?", number: 0),
                  Menu(ItemView:"images-9", productname: "甜羅美", prise: 25, supply: "黃詩瑜", foodwight: "?", number: 0),
                  Menu(ItemView:"images-10", productname: "大陸妹", prise: 30, supply: "黃詩瑜", foodwight: "?", number: 0),
                  Menu(ItemView:"images-11", productname: "咸豐菜", prise: 25, supply: "謝唯琪", foodwight: "?", number: 0),
                  Menu(ItemView:"images-12", productname: "人參菜", prise: 25, supply: "謝唯琪", foodwight: "?", number: 0),
                  Menu(ItemView:"images-13", productname: "山葵葉", prise: 55, supply: "陳守安", foodwight: "?", number: 0),
                  Menu(ItemView:"images-14", productname: "豆瓣菜", prise: 35, supply: "黃金山", foodwight: "?", number: 0),
                  Menu(ItemView:"images-15", productname: "黑葉白菜", prise: 35, supply: "黃金山", foodwight: "?", number: 0),
                  Menu(ItemView:"images-16", productname: "龍葵", prise: 35, supply: "黃金山", foodwight: "?", number: 0),]
    }
    func addOrder(value:Menu,quanty:Int){//增加商品數量
        let Index = ShowOrder.firstIndex(where: {od in
            od.Menu.productname == value.productname
        })
        if(Index != nil){
            ShowOrder[Index!].numbers += 1
        }else{
            ShowOrder.append(Order(Menu: value, numbers: quanty))
        }
    }
    func lowerOrder(value:Menu){//減少商品數量
        let Index = ShowOrder.firstIndex(where: {od in
            od.Menu.productname == value.productname
        })
        if(Index != nil){
            if ShowOrder[Index!].numbers > 1{
                ShowOrder[Index!].numbers -= 1
            }else{
                ShowOrder.removeAll()
            }
        }else{
            ShowOrder.append(Order(Menu: value, numbers: 1))
        }
    }
    func toltolprise(priese:Int,number:Int) -> Int {//計算單一筆的價錢
        let anser =  priese*number
        return anser
    }
    func sumPrise(temp_orders:[Order]) -> Int {//計算單一筆的價錢
        var sum = 0
        for od in temp_orders {
            sum += toltolprise(priese: od.Menu.prise, number: od.numbers)
        }
        return sum
    }
    
}

class Cacus:ObservableObject{
    func cacu_money(foodname:Float,qauntity:Float) -> Float{
        let anser = foodname * qauntity
        return anser
    }
    func cacu_health(height:Float) -> Float{
        let anser = height/2
        return anser
    }
}
