//
//  DatabaseModel.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/2/4.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift


class Integrate:ObservableObject{
    
    let path:String = "Product_Information"
    
    private let store = Firestore.firestore()
    
    @Published var shops = [Menu]()
    
    init(){
        listenData()
    }
    
    func get(){ //取得資料
        store.collection(path).getDocuments { (querySnapshot, error) in
           if let querySnapshot = querySnapshot {
              self.shops = querySnapshot.documents.compactMap { document in
                try? document.data(as: Menu.self)
              }
           }else{
               self.shops = [
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
               ]
           }
        }
  }
    
    func addAll(shops:[Menu]) {//新增整批資料
        shops.forEach { item in
          do {
            _ = try store.collection(path).addDocument(from: item)
          } catch {
            fatalError("Unable to add card: \(error.localizedDescription).")
          }
        }
    }
    
    func addAlls(produce:[Menu]) {//新增整批資料
        produce.forEach { item in
          do {
            _ = try store.collection(path).addDocument(from: item)
          } catch {
            fatalError("Unable to add card: \(error.localizedDescription).")
          }
        }
    }
    
    func add(shop: Menu) {//新增資料
        do {
          _ = try store.collection(path).addDocument(from: shop)
        } catch {
          fatalError("Unable to add card: \(error.localizedDescription).")
        }
    }
    
    func listenData(){ //監聽資料變化
        
        store.collection(path).order(by: "date").addSnapshotListener { (querySnapshot, error) in
            guard let querySnapshot = querySnapshot else {
                return
            }
                    
            self.shops = querySnapshot.documents.compactMap { document in
                try? document.data(as: Menu.self)
            }
        }
        
        
    }

}
