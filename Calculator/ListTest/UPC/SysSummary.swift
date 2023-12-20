//
//  SysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 1/22/21.
//



import SwiftUI

struct SysSummary: View {
    
    @EnvironmentObject var upcChoiceRC : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var colorant : Colorant //colorant selection
   
    
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
   
    var body: some View {
        VStack {
            HStack {
                Text("PRODUCT CODE")
                    .underline()
                    .font(.caption)
                Spacer()
                Text("PRODUCT")
                    .underline()
                    .font(.caption)
                Spacer()
                Text("QUANTITY")
                    .underline()
                    .font(.caption)
            }
            HStack{ // UPC Part A
                Text("EX-KUPCARC-E")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - RC/TT, 6 lbs")
                    .font(.caption)
                Spacer()
                Text("\(upcChoiceRC.BCoatPtA + upcChoiceRC.PCoatPtA + upcChoiceRC.TCoatPtA)")
                    .font(.caption)
            }
            SysSummaryConc() // UPC Part B
            HStack{ // upc part C
                Text("EX-KUPCRFC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - RC, 6 lbs")
                    .font(.caption)
                Spacer()
                Text("\(upcChoiceRC.BCoatPtC + upcChoiceRC.PCoatPtC + upcChoiceRC.TCoatPtC)")
                    .font(.caption)
            }
            if upcChoiceRC.TCoatSelection == 3{
                HStack{
                    Text("EX-KPACEL-08")
                        .font(.caption)
                    Spacer()
                    Text("Poly Accelerant, 8 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(upcChoiceRC.TCoatPtC)")
                        .font(.caption)
                }
            }
            if upcChoiceRC.texture1 != upcChoiceRC.texture2 { // used to ensure there is no gap between products if colorant is not selected
                Texture1Switch()
                Texture2Switch()
                ColorantFinalSwitch()
            }
            else if upcChoiceRC.texture1 == upcChoiceRC.texture2 {
                Texture1Switch()
                ColorantFinalSwitch()
            }
            Text("Total System Nominal Thickness: \(upc.totalThickness) mils")
                .font(.caption)
                .fontWeight(.bold)
            
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
    }
}

struct SysSummary_Previews: PreviewProvider {
    static var previews: some View {
        SysSummary()
    }
}
