//
//  PCoatSummarySL.swift
//  Calculator
//
//  Created by Kane Davidson on 12/22/21.
//

import SwiftUI

struct PCoatSummarySL: View {
    var ChipSLUPCA = stats(product: "Urethane Polymer Concrete Part A:", covRate: 330, MixRat: 6)
    var ChipSLUPCB = stats(product: "Urethane Polymer Concrete Part B:", covRate: 330, MixRat: 6)
    var ChipSLUPCC = stats(product: "Urethane Polymer Concrete Part C:", covRate: 330, MixRat: 6)
    var ChipSLUPCColorant = stats(product: "Urethane Polymer Concrete Colorant", covRate: 330, MixRat: 4)
    @EnvironmentObject var ChipSL : ColorChipValuesSL //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet



    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]

    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
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
                Text("EX-KUPCASL8-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - SL/MF, 8#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: ChipSLUPCA))")
                    .font(.caption)
            }
            HStack{ // Part B
                Text("\(TypesBCodes[ChipSL.PCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("UPC Part B SL/MF - \(TypesB[ChipSL.PCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: ChipSLUPCB))")
                    .font(.caption)
            }
            HStack{ // Part C
                Text("EX-KUPCSLC2-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - SL, 25#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: ChipSLUPCC))")
                    .font(.caption)
            }
            if ChipSL.PCoatColor != 0 {
            HStack{ // Color
                Text("\(UPCColorantCodes[ChipSL.PCoatColor])")
                    .font(.caption)
                Spacer()
                Text("UPC Colorant - \(UPCColorantChoices[ChipSL.PCoatColor]), 4 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: ChipSLUPCColorant))")
                    .font(.caption)
            }
        }
        }
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                    .padding()
    }
}

struct PCoatSummarySL_Previews: PreviewProvider {
    static var previews: some View {
        PCoatSummarySL()
    }
}
