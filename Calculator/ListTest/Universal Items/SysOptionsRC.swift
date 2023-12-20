//
//  SysOptions.swift
//  ListTest
//
//  Created by Kane Davidson on 12/2/20.
//

import SwiftUI
import Combine



// COAT OPTION CHECKBOXES

struct SysOptionsRC: View {
    
@EnvironmentObject var upc : options
@EnvironmentObject var upcChoiceRC : sysChoices
@EnvironmentObject var sf : SquareFeet
@EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
@EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
@EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
@EnvironmentObject var UPCColor : stats

    
    func getThickness() -> Void {
        if upc.ThicknessSelection == 0 {
            upc.totalThickness = 7
        }
        else if upc.ThicknessSelection == 1 {
            upc.totalThickness = 12
        }
        else if upc.ThicknessSelection == 2 {
            upc.totalThickness = 20
        }
        else if upc.ThicknessSelection == 3 {
            upc.totalThickness = 30
        }
        if upc.isPrimeCoat == true {
                upc.totalThickness += 7
            }
        if upc.isTopCoat == true {
                upc.totalThickness += 7
            }
    }
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func quantPT(product : stats) -> Int {
        let quantity : Float = (sf.squareF / 200) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required

    func BCoatQuantValues() {
        
        upcChoiceRC.BCoatPtA = quant(product: UPCA) + upcChoiceRC.BCoatWaste //The amount of part A in base coat
        upcChoiceRC.BCoatPtB = quant(product: UPCB) + upcChoiceRC.BCoatWaste //The amount of part B in base coat
        upcChoiceRC.BCoatPtC = quant(product: UPCC) + upcChoiceRC.BCoatWaste //The amount of part C in base coat
        upcChoiceRC.BCoatColorant = quant(product: UPCColor ) + upcChoiceRC.BCoatWaste // The amount of colorant in base coat
       
    }
    func PCoatQuantValues() {
        if upc.isPrimeCoat == true {
        upcChoiceRC.PCoatPtA = quantPT(product: UPCA) + upcChoiceRC.PCoatWaste //The amount of part A in prime coat
        upcChoiceRC.PCoatPtB = quantPT(product: UPCB) + upcChoiceRC.PCoatWaste //The amount of part B in prime coat
        upcChoiceRC.PCoatPtC = quantPT(product: UPCC) + upcChoiceRC.PCoatWaste //The amount of part C in prime coat
        upcChoiceRC.PCoatColorant = quantPT(product: UPCColor ) + upcChoiceRC.PCoatWaste // The amount of colorant in prime coat
            
        }
        else {
            upcChoiceRC.PCoatPtA = 0
            upcChoiceRC.PCoatPtB = 0
            upcChoiceRC.PCoatPtC = 0
            upcChoiceRC.BCoatColorant = 0
        }
    }
    
    func TCoatQuantValues() {
        if upc.isTopCoat == true {
        upcChoiceRC.TCoatPtA = quantPT(product: UPCA) + upcChoiceRC.TCoatWaste //The amount of part A in top coat
        upcChoiceRC.TCoatPtB = quantPT(product: UPCB) + upcChoiceRC.TCoatWaste //The amount of part B in top coat
        upcChoiceRC.TCoatPtC = quantPT(product: UPCC) + upcChoiceRC.TCoatWaste //The amount of part C in top coat
        upcChoiceRC.TCoatColorant = quantPT(product: UPCColor ) + upcChoiceRC.TCoatWaste // The amount of colorant in top coat
//        upcChoiceRC.texture1Quant = quant(product: UPCA) + upcChoiceRC.TCoatWaste // The amount of texture 1
//        upcChoiceRC.texture2Quant = quant(product: UPCA) + upcChoiceRC.TCoatWaste // The amount of texture 2

        }
        else {
            upcChoiceRC.TCoatPtA = 0
            upcChoiceRC.TCoatPtB = 0
            upcChoiceRC.TCoatPtC = 0
            upcChoiceRC.TCoatColorant = 0
            upcChoiceRC.texture1Quant = 0
            upcChoiceRC.texture2Quant = 0
        }
        if upc.isUVRes == true {
            upcChoiceRC.TCoatSelection = 3
        }
        if upc.isUVRes == false {
            upcChoiceRC.TCoatSelection = 0
        }
    }
    func CheckAllQuant() { // used to calculate quantity values
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.PCoatSelection) && (upcChoiceRC.BCoatSelection != upcChoiceRC.TCoatSelection) { // Base and Prime same
        upcChoiceRC.BCoatPtB = upcChoiceRC.PCoatPtB + upcChoiceRC.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.PCoatSelection == upcChoiceRC.TCoatSelection) && (upcChoiceRC.BCoatSelection != upcChoiceRC.TCoatSelection) {  // Prime coat and top coat are the same
        upcChoiceRC.TCoatPtB += upcChoiceRC.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.TCoatSelection) && (upcChoiceRC.BCoatSelection != upcChoiceRC.PCoatSelection) {  // Base and top same
        upcChoiceRC.TCoatPtB += upcChoiceRC.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.PCoatSelection) && (upcChoiceRC.BCoatSelection == upcChoiceRC.TCoatSelection) { //all same
        upcChoiceRC.BCoatPtB = upcChoiceRC.PCoatPtB + upcChoiceRC.BCoatPtB + upcChoiceRC.TCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == false && upcChoiceRC.BCoatSelection == upcChoiceRC.PCoatSelection {
            upcChoiceRC.BCoatPtB = upcChoiceRC.PCoatPtB + upcChoiceRC.BCoatPtB
        }
        if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoiceRC.BCoatSelection == upcChoiceRC.TCoatSelection) {
            upcChoiceRC.TCoatPtB += upcChoiceRC.BCoatPtB
        }
    }
    func isOption() {
        if upc.isUVRes == true || upc.isTexture == true {
            upc.isTopCoat = true
            }
        }

    
    var body: some View {
        VStack { // Coat Options
                Text("System Options")
                    .fontWeight(.heavy)
                HStack {
                        Toggle(isOn: $upc.isPrimeCoat, label: {
                            Text("Add Optional Prime Coat")
                            PrimeCoatInfo()
                        })
                        .onChange(of: upc.isPrimeCoat) { _ in
                            getThickness()
                            BCoatQuantValues()
                            PCoatQuantValues()
                            TCoatQuantValues()
                            CheckAllQuant()
                        }
                        .toggleStyle(CheckBoxToggleStyle())
                    }
                    HStack {
                        Toggle(isOn: $upc.isTopCoat, label: {
                            Text("Add Optional Top Coat")
                            TopCoatInfo()
                        })
                        .onChange(of: upc.isTopCoat) { _ in
                            getThickness()
                            BCoatQuantValues()
                            PCoatQuantValues()
                            TCoatQuantValues()
                            CheckAllQuant()
                        }
                        .toggleStyle(CheckBoxToggleStyle())
                        
                    }
                    HStack{
                        Toggle(isOn: $upc.isUVRes, label: {
                            Text("    +UV resistance")
                            UVResInfo()
                        }).toggleStyle(CheckBoxToggleStyle())
                        .onChange(of: upc.isUVRes) { value in
                            self.isOption()
                            BCoatQuantValues()
                            PCoatQuantValues()
                            TCoatQuantValues()
                            CheckAllQuant()
                        }

                    }
                    HStack{
                        Toggle(isOn: $upc.isTexture, label: {
                            Text("    +texture")
                            SlipInfo()
                        }).toggleStyle(CheckBoxToggleStyle())
                        .onChange(of: upc.isTexture) { value in
                            self.isOption()
                            BCoatQuantValues()
                            PCoatQuantValues()
                            TCoatQuantValues()
                            CheckAllQuant()
                        }
                    }
        } .padding()
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(25.0)
        }
}


struct SysOptionsRC_Previews: PreviewProvider {
    static let upc = options()
    
    static var previews: some View {
        SysOptions().environmentObject(upc)
    }
}

