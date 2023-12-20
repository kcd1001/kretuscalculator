//
//  SysOptions.swift
//  ListTest
//
//  Created by Kane Davidson on 12/2/20.
//

import SwiftUI
import Combine



// COAT OPTION CHECKBOXES
class options: ObservableObject {
    
    @Published var isTopCoat : Bool = false
    @Published var isPrimeCoat = false
    @Published var isUVRes : Bool = false
    @Published var isTexture : Bool = false
    @Published var showingPicker : Bool = false
    @Published var ThicknessSelection : Int = 0 
    @Published var totalThickness : Int = 0 

}

struct SysOptions: View {
    
@EnvironmentObject var upc : options
@EnvironmentObject var upcChoice : sysChoices
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
        
        upcChoice.BCoatPtA = quant(product: UPCA) + upcChoice.BCoatWaste //The amount of part A in base coat
        upcChoice.BCoatPtB = quant(product: UPCB) + upcChoice.BCoatWaste //The amount of part B in base coat
        upcChoice.BCoatPtC = quant(product: UPCC) + upcChoice.BCoatWaste //The amount of part C in base coat
        upcChoice.BCoatColorant = quant(product: UPCColor ) + upcChoice.BCoatWaste // The amount of colorant in base coat
       
    }
    func PCoatQuantValues() {
        if upc.isPrimeCoat == true {
        upcChoice.PCoatPtA = quantPT(product: UPCA) + upcChoice.PCoatWaste //The amount of part A in prime coat
        upcChoice.PCoatPtB = quantPT(product: UPCB) + upcChoice.PCoatWaste //The amount of part B in prime coat
        upcChoice.PCoatPtC = quantPT(product: UPCC) + upcChoice.PCoatWaste //The amount of part C in prime coat
        upcChoice.PCoatColorant = quantPT(product: UPCColor ) + upcChoice.PCoatWaste // The amount of colorant in prime coat
            
        }
        else {
            upcChoice.PCoatPtA = 0
            upcChoice.PCoatPtB = 0
            upcChoice.PCoatPtC = 0
            upcChoice.BCoatColorant = 0
        }
    }
    
    func TCoatQuantValues() {
        if upc.isTopCoat == true {
        upcChoice.TCoatPtA = quantPT(product: UPCA) + upcChoice.TCoatWaste //The amount of part A in top coat
        upcChoice.TCoatPtB = quantPT(product: UPCB) + upcChoice.TCoatWaste //The amount of part B in top coat
        upcChoice.TCoatPtC = quantPT(product: UPCC) + upcChoice.TCoatWaste //The amount of part C in top coat
        upcChoice.TCoatColorant = quantPT(product: UPCColor ) + upcChoice.TCoatWaste // The amount of colorant in top coat
//        upcChoice.texture1Quant = quant(product: UPCA) + upcChoice.TCoatWaste // The amount of texture 1
//        upcChoice.texture2Quant = quant(product: UPCA) + upcChoice.TCoatWaste // The amount of texture 2

        }
        else {
            upcChoice.TCoatPtA = 0
            upcChoice.TCoatPtB = 0
            upcChoice.TCoatPtC = 0
            upcChoice.TCoatColorant = 0
            upcChoice.texture1Quant = 0
            upcChoice.texture2Quant = 0
        }
        if upc.isUVRes == true {
            upcChoice.TCoatSelection = 3
        }
        if upc.isUVRes == false {
            upcChoice.TCoatSelection = 0
        }
    }
    func CheckAllQuant() { // used to calculate quantity values
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.PCoatSelection == upcChoice.TCoatSelection) {  // Prime coat and top coat are the same
        upcChoice.TCoatPtB += upcChoice.PCoatPtB
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


struct SysOptions_Previews: PreviewProvider {
    static let upc = options()
    
    static var previews: some View {
        SysOptions().environmentObject(upc)
    }
}

