//
//  SandPCoatDBTSSum.swift
//  Calculator
//
//  Created by Kane Davidson on 11/3/22.
//

import SwiftUI

struct SandPCoatDBTSSum: View {
    
    @EnvironmentObject var SandDBTS : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Ench. Green", "A Resin - Handic. Blue", "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red", "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["","Beige", "Black", "Dark Gray", "Ench. Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = [ "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    
    var body: some View {
        Text("Prime Coat")
            .bold()
        VStack
        {
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
            
            HStack{
                Text("\(typesACodes[SandDBTS.PCoatPtA])")
                    .font(.caption)
                Spacer()
                Text("TSE Part A: \(typesA[SandDBTS.PCoatPtA]), 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSA_QuartzTS) + SandDBTS.PCoatWaste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[SandDBTS.PCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[SandDBTS.PCoatPtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSB_QuartzTS) + SandDBTS.PCoatWaste)")
                    .font(.caption)
            }
            
            if SandDBTS.PCoatSC
            {
                HStack{ // Solvent Cleaner
                    Text("EX-KSLVCLN-EA")
                        .font(.caption)
                    Spacer()
                    Text("Solvent Cleaner, 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSA_SandDBTS))")
                        .font(.caption)
                }
            }
            
            if SandDBTS.PCoatTSColorant != 0
            {
                HStack {
                    Text("\(TSColorantCodes[SandDBTS.BCoatTSColorant])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SandDBTS.BCoatTSColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSColorantBC_QuartzTS))")
                        .font(.caption)
                }
            }
            
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
    }
}

struct SandPCoatDBTSSum_Previews: PreviewProvider {
    static var previews: some View {
        SandPCoatDBTSSum()
    }
}
