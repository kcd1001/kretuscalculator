//
//  PCoatSummarySL.swift
//  Calculator
//
//  Created by Kane Davidson on 12/22/21.
//

import SwiftUI

struct BCoatSummarySL: View {
  
    @EnvironmentObject var ChipSL : ColorChipValuesSL //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BCoatChipSLUPCA : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatChipSLUPCB : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatChipSLUPCC : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatChipSLUPCColorant : stats2 //Used for system stats (mixRat,CovRate, etc)

    var UPCColorantChoices = ["No Color (Unpigmented)",
                              "Black", "Blue","Bone", "Brown", "Clay",
                              "Gray", "Green", "Mustard", "Red"]

    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA",
                            "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA",
                            "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA",
                            "EX-KUPCCLRD-EA"]
    
    let TypesB = ["AP", "EZ", "FC"]
    
    let TypesBCodes = ["EX-KUPCASLB8-EA", "EX-KUPCASLZ8-EA", "EX-KUPCASLF8-EA"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required

    var body: some View {
        VStack { // Start of coat summary
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
            HStack{ // Part A
                Text("EX-KUPCSL8-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - SL/MF, 8#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: BCoatChipSLUPCA))")
                    .font(.caption)
            }
            HStack{ // Part B
                Text("\(TypesBCodes[ChipSL.BCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("UPC Part B SL/MF - \(TypesB[ChipSL.BCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: BCoatChipSLUPCB))")
                    .font(.caption)
            }
            HStack{ // Part C
                Text("EX-KUPCSLC2-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - SL, 25#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: BCoatChipSLUPCC))")
                    .font(.caption)
            }
            if ChipSL.BCoatColor != 0 {
            HStack{ // Color
                Text("\(UPCColorantCodes[ChipSL.BCoatColor])")
                    .font(.caption)
                Spacer()
                Text("UPC Colorant - \(UPCColorantChoices[ChipSL.BCoatColor]), 4 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: BCoatChipSLUPCColorant))")
                    .font(.caption)
            }
        }
        }
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                    .padding()
    }
}

struct BCoatSummarySL_Previews: PreviewProvider {
    static var previews: some View {
        PCoatSummarySL()
    }
}
