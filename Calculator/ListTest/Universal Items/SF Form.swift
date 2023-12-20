//
//  SF Form.swift
//  ListTest
//
//  Created by Kane Davidson on 10/21/20.
//

import SwiftUI
import Combine


class SquareFeet : ObservableObject {
    @Published var squareF : Float = 50.0
    
   
}
struct SF_Form: View {
    
    
    @EnvironmentObject var sf : SquareFeet
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCColor : stats

    
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
    }
    func CheckAllQuant() { // used to calculate quantity values
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.PCoatSelection) && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) { // Base and Prime same
        upcChoice.BCoatPtB = upcChoice.PCoatPtB + upcChoice.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.PCoatSelection == upcChoice.TCoatSelection) && (upcChoice.BCoatSelection != upcChoice.TCoatSelection) {  // Prime coat and top coat are the same
        upcChoice.TCoatPtB += upcChoice.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) && (upcChoice.BCoatSelection != upcChoice.PCoatSelection) {  // Base and top same
        upcChoice.TCoatPtB += upcChoice.BCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.PCoatSelection) && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) { //all same
        upcChoice.BCoatPtB = upcChoice.PCoatPtB + upcChoice.BCoatPtB + upcChoice.TCoatPtB
        }
        if upc.isPrimeCoat == true && upc.isTopCoat == false && upcChoice.BCoatSelection == upcChoice.PCoatSelection {
            upcChoice.BCoatPtB = upcChoice.PCoatPtB + upcChoice.BCoatPtB
        }
        if upc.isPrimeCoat == false && upc.isTopCoat == true && (upcChoice.BCoatSelection == upcChoice.TCoatSelection) {
            upcChoice.TCoatPtB += upcChoice.BCoatPtB
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading){
                Text("Total Square Feet")
                            .font(.title)
                            .fontWeight(.heavy)
            TextField("",value: $sf.squareF, formatter: NumberFormatter())
                        .padding(.all)
                        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                        .cornerRadius(5.0)
                .onChange(of: sf.squareF) { _ in
                    BCoatQuantValues()
                    PCoatQuantValues()
                    TCoatQuantValues()
                    CheckAllQuant()
                }
                }
        .padding(.horizontal, 15)
        .padding(.horizontal, 15)
        
}
struct SF_Form_Previews: PreviewProvider {
    static let whatever = SquareFeet()
    
    static var previews: some View {
        SF_Form().environmentObject(whatever)
    }
}
}

