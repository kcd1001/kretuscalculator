//
//  SysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 1/22/21.
//

import SwiftUI

struct SysSummaryTT: View {
    
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    @EnvironmentObject var upc : options //Used for coat checkboxes
    @EnvironmentObject var UPCA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var UPCC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var colorant : Colorant //colorant selection
    let thickness = ["1/4\"", "3/8\"", "3/4\""]

   
    
    
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
                Text("\(upcChoice.BCoatPtA + upcChoice.PCoatPtA + upcChoice.TCoatPtA)")
                    .font(.caption)
            }
            SysSummaryConc() // UPC Part B
            HStack{ // upc part C
                Text("EX-KUPCTTC4-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - TT, 42 lbs")
                    .font(.caption)
                Spacer()
                Text("\(upcChoice.BCoatPtC + upcChoice.PCoatPtC + upcChoice.TCoatPtC)")
                    .font(.caption)
            }
            
            if upcChoice.texture1 != upcChoice.texture2 { // used to ensure there is no gap between products if colorant is not selected 
                Texture1Switch()
                Texture2Switch()
                ColorantFinalSwitch()
            }
            else if upcChoice.texture1 == upcChoice.texture2 {
                Texture1Switch()
                ColorantFinalSwitch()
            }
            Text("Total System Nominal Thickness: \(thickness[upc.ThicknessSelection])")
                .font(.caption)
                .fontWeight(.bold)

        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
    }
}

struct SysSummaryTT_Previews: PreviewProvider {
    static var previews: some View {
        SysSummary()
    }
}
