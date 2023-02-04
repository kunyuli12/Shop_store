//
//  Health_Model.swift
//  Shop_store
//
//  Created by 暨大附中03 on 2023/2/3.
//

import Foundation

struct AgeModel_B:Identifiable,Hashable,Codable {//男生的Model
    var id = UUID().uuidString
    var Age:String//男生年齡範圍
    var population:Float//人口數量
    var Need_of_VG:Float//需要的蔬菜量
    var Need_of_Fur:Float//需要的水果量
}
struct AgeModel_G:Identifiable,Hashable,Codable {//女生的Model
    var id = UUID().uuidString
    var Age:String//女生年齡範圍
    var population:Float//人口數量
    var Need_of_VG:Float//需要的蔬菜量
    var Need_of_Fur:Float//需要的水果量
}

class VGinform:ObservableObject {
    @Published var AGEbox_B:[AgeModel_B] = [AgeModel_B]()
    @Published var AGEbox_G:[AgeModel_G] = [AgeModel_G]()
    @Published var onoffs:Bool =  false
    
    init(){
        SexboxB()
        SexboxG()
    }

func SexboxB() {//男生人數資料
    AGEbox_B = [
        AgeModel_B(Age: "2~6", population: 0,Need_of_VG: 3,Need_of_Fur: 2),
        AgeModel_B(Age: "7~12", population: 0,Need_of_VG: 4,Need_of_Fur: 3),
        AgeModel_B(Age: "13~18", population: 0,Need_of_VG: 5,Need_of_Fur: 4),
        AgeModel_B(Age: "19~30", population: 0,Need_of_VG: 5,Need_of_Fur: 4),
        AgeModel_B(Age: "31~50", population: 0,Need_of_VG: 5,Need_of_Fur: 4),
        AgeModel_B(Age: "51~70", population: 0,Need_of_VG: 4,Need_of_Fur: 3.5),
        AgeModel_B(Age: "71以上", population: 0,Need_of_VG: 3,Need_of_Fur: 2)
    ]
}
func SexboxG() {//女生人數資料
    AGEbox_G = [
        AgeModel_G(Age: "2~6", population: 0,Need_of_VG: 3,Need_of_Fur: 2),
        AgeModel_G(Age: "7~12", population: 0,Need_of_VG: 4,Need_of_Fur: 3),
        AgeModel_G(Age: "13~18", population: 0,Need_of_VG: 4,Need_of_Fur: 3),
        AgeModel_G(Age: "19~30", population: 0,Need_of_VG: 4,Need_of_Fur: 3),
        AgeModel_G(Age: "31~50", population: 0,Need_of_VG: 4,Need_of_Fur: 3),
        AgeModel_G(Age: "51~70", population: 0,Need_of_VG: 3,Need_of_Fur: 2),
        AgeModel_G(Age: "71以上", population: 0,Need_of_VG: 3,Need_of_Fur: 2)
    ]
}
    func AddBoy (value:AgeModel_B,quanty:Float ){
        let Index = AGEbox_B.firstIndex(where: { ad in
            ad.Age == value.Age
        })
        if (Index != nil) {
            AGEbox_B[Index!].population += quanty
        }
    }//增加男生人數
    func LowBoy (value:AgeModel_B,quanty:Float ){
        let Index = AGEbox_B.firstIndex(where: { ad in
            ad.Age == value.Age
        })
        if (Index != nil) {
            if  AGEbox_B[Index!].population > 0 {
            AGEbox_B[Index!].population -= quanty
            }
        }
    }//減少男生人數
    func AddGirl (value:AgeModel_G,quanty:Float ){
        let Index = AGEbox_G.firstIndex(where: { ad in
            ad.Age == value.Age
        })
        if (Index != nil) {
            AGEbox_G[Index!].population += quanty
        }
    }//增加女生人數
    func LowGirl (value:AgeModel_G,quanty:Float ){
        let Index = AGEbox_G.firstIndex(where: { ad in
            ad.Age == value.Age
        })
        if (Index != nil) {
            if  AGEbox_G[Index!].population > 0 {
            AGEbox_G[Index!].population -= quanty
            }
        }
    }//減少女生人數

    func FinallyQuanty(quanty:Float ,need:Float ) -> Float {
        let anser = quanty * need
        return anser
    }//總計男生女生全部的蔬果建議量
    func VGDemandB(tempBoy:[AgeModel_B]) -> Float {
        
        var sum:Float = 0.0
        
        for de in tempBoy {
                sum += FinallyQuanty(quanty: de.population, need: de.Need_of_VG)
            
        }
        return sum
    }//計算總共需要的蔬菜量
    func VGDemandG(tempGirl:[AgeModel_G]) -> Float {
        
        var sum:Float = 0.0
        
        for des in tempGirl {
                sum += FinallyQuanty(quanty: des.population, need: des.Need_of_VG)
            
        }
        return sum
    }//計算總共需要的蔬菜量
    func FriutDemandB(tempBoy:[AgeModel_B]) -> Float {
      
      var sum:Float = 0.0
      
      for de in tempBoy {
              sum += FinallyQuanty(quanty: de.population, need: de.Need_of_Fur)
      }
      return sum
  }//計算總共需要的水果量
    func FriutDemandG(tempGirl:[AgeModel_G]) -> Float {
        
        var sum:Float = 0.0
        
            for des in tempGirl{
                sum += FinallyQuanty(quanty: des.population, need: des.Need_of_Fur)
            }
        return sum
    }//計算總共需要的水果量
}
