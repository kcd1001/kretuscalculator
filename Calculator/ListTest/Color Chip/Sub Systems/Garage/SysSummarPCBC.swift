//
//  SysSummarPCTC.swift
//  Calculator
//
//  Created by Kane Davidson on 9/1/21.
//

import SwiftUI

struct SysSummaryPCBC: View {
    @EnvironmentObject var ChipGarage : ColorChipValues //Used for coat selections
    @EnvironmentObject var Chip : ChipOptions //Used for checkbox options
    @EnvironmentObject var TSA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)

    @EnvironmentObject var sf : SquareFeet //Square feet
    
    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Ench. Green", "A Resin - H. Blue",           "A Resin - Latte", "A Resin - Light Gray", "A Resin - Med. Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",           "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["MVR - EZ", "MVR - FC", "AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "H. Blue", "Latte", "Light Gray", "Med. Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    

    var body: some View {
        if Chip.isPrimeCoat == true {
            if (ChipGarage.PCoatPtA != ChipGarage.BCoatPtA) && (ChipGarage.MVRPtA != ChipGarage.PCoatPtA) && (ChipGarage.MVRPtA != ChipGarage.BCoatPtA) {
            if ChipGarage.PCoatPtA == 4 { //START OF PRIME COAT
                HStack {
                    Text("\(typesACodes[ChipGarage.PCoatPtA])")
                        .font(.caption)
                    Spacer()
                    Text("TSE Part A: Ench. Green, 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSA) + ChipGarage.PCoatWaste)")
                        .font(.caption)
                }
            }
            else {
                HStack{
                    Text("\(typesACodes[ChipGarage.PCoatPtA])")
                        .font(.caption)
                    Spacer()
                    Text("TSE Part A: \(typesA[ChipGarage.PCoatPtA]), 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSA) + ChipGarage.PCoatWaste)")
                        .font(.caption)
                }
        }
            } // END OF PC PART A
            if ChipGarage.PCoatPtB != ChipGarage.BCoatPtB && (ChipGarage.MVRPtB != ChipGarage.PCoatPtB) && (ChipGarage.MVRPtB != ChipGarage.BCoatPtB) {
            HStack{
                Text("\(typesBCodes[ChipGarage.PCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[ChipGarage.PCoatPtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSB) + ChipGarage.PCoatWaste)")
                    .font(.caption)
            }
        } //END OF PCOAT PART B
            
            if ChipGarage.PCoatTSColorant != ChipGarage.BCoatTSColorant {
                if ChipGarage.PCoatTSColorant != 0 {
                        HStack {
                            Text("\(TSColorantCodes[ChipGarage.PCoatTSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  \(TSColorantChoices[ChipGarage.PCoatTSColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorant) + ChipGarage.PCoatWaste)")
                                .font(.caption)
                        }
            } // END OF PC COLORANT
            } //END OF PRIME COAT
            } //END OF PC IF STATEMENT
        //START OF BASE COAT
            HStack{
                Text("\(typesACodes[ChipGarage.BCoatPtA])")
                    .font(.caption)
                Spacer()
                Text("TSE Part A: \(typesA[ChipGarage.BCoatPtA]), 1 gal")
                    .font(.caption)
                Spacer()
                if ChipGarage.BCoatPtA == ChipGarage.PCoatPtA && Chip.isPrimeCoat == true && Chip.isMVR == false {
                Text("\(quant(product: TSA) + ChipGarage.QuantPCoatPtA + ChipGarage.BCoatWaste + ChipGarage.PCoatWaste)")
                    .font(.caption)
                }
                else if ChipGarage.BCoatPtA == ChipGarage.MVRPtA && Chip.isMVR == true && Chip.isPrimeCoat == false  {
                    Text("\(quant(product: TSA) + ChipGarage.QuantMVRPtA + ChipGarage.MVRWaste + ChipGarage.BCoatWaste)")
                    .font(.caption)
                }
                else if (ChipGarage.BCoatPtA == ChipGarage.MVRPtA) && (ChipGarage.BCoatPtA == ChipGarage.PCoatPtA) && (Chip.isMVR == true) && (Chip.isPrimeCoat) == true {
                    Text("\(quant(product: TSA) + ChipGarage.QuantMVRPtA + ChipGarage.MVRWaste + ChipGarage.BCoatWaste + ChipGarage.QuantPCoatPtA + ChipGarage.PCoatWaste)")
                    .font(.caption)
                }
                else {
                    Text("\(quant(product: TSA) + ChipGarage.BCoatWaste)")
                        .font(.caption)
                }
            }
        
        
        HStack{
            Text("\(typesBCodes[ChipGarage.BCoatPtB])")
                .font(.caption)
            Spacer()
            Text("Top Shelf® Epoxy Part B: \(typesB[ChipGarage.BCoatPtB]), 1/2 gal")
                .font(.caption)
            Spacer()
            if Chip.isPrimeCoat == true && Chip.isMVR == false {
                if ChipGarage.BCoatPtB == ChipGarage.PCoatPtB {
                    Text("\(quant(product: TSB) + ChipGarage.QuantPCoatPtB + ChipGarage.BCoatWaste + ChipGarage.PCoatWaste)")
                        .font(.caption)
                }
            }
            else if  Chip.isMVR == true && Chip.isPrimeCoat == false  {
                if ChipGarage.BCoatPtB == ChipGarage.MVRPtB {
                    Text("\(quant(product: TSB) + ChipGarage.QuantMVRPtB + ChipGarage.MVRWaste + ChipGarage.BCoatWaste)")
                    .font(.caption)
            }
            }
            else if (Chip.isMVR == true) && (Chip.isPrimeCoat) == true {
                if (ChipGarage.BCoatPtB == ChipGarage.MVRPtB) && (ChipGarage.BCoatPtB == ChipGarage.PCoatPtB) {
                Text("\(quant(product: TSB) + ChipGarage.QuantMVRPtB + ChipGarage.MVRWaste + ChipGarage.BCoatWaste + ChipGarage.QuantPCoatPtB + ChipGarage.PCoatWaste)")
                .font(.caption)
                }
                else if (ChipGarage.BCoatPtB != ChipGarage.MVRPtB) && (ChipGarage.BCoatPtB == ChipGarage.PCoatPtB) {
                    Text("\(quant(product: TSB) + ChipGarage.BCoatWaste + ChipGarage.QuantPCoatPtB + ChipGarage.PCoatWaste)")
                    .font(.caption)
                }
            }
            else {
                Text("\(quant(product: TSB) + ChipGarage.BCoatWaste)")
                    .font(.caption)
            }
        }
        if ChipGarage.BCoatTSColorant != 0 {
                HStack {
                    Text("\(TSColorantCodes[ChipGarage.BCoatTSColorant])")
                        .font(.caption)
                    Spacer()
                    Text("TSE Colorant:  \(TSColorantChoices[ChipGarage.BCoatTSColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    if Chip.isPrimeCoat == true && Chip.isMVR == false {
                        if ChipGarage.BCoatTSColorant == ChipGarage.PCoatTSColorant {
                            Text("\(quant(product: TSColorant) + ChipGarage.QuantPCoatColorant + ChipGarage.BCoatWaste + ChipGarage.PCoatWaste)")
                                .font(.caption)
                        }
                        else {
                            Text("\(quant(product: TSColorant) + ChipGarage.BCoatWaste)")
                                .font(.caption)
                        }
                    }
                    else if  Chip.isMVR == true && Chip.isPrimeCoat == false  {
                        if ChipGarage.BCoatTSColorant == ChipGarage.MVRTSColorant {
                            Text("\(quant(product: TSColorant) + ChipGarage.QuantMVRColorant + ChipGarage.MVRWaste + ChipGarage.BCoatWaste)")
                            .font(.caption)
                    }
                        else {
                            Text("\(quant(product: TSColorant) + ChipGarage.BCoatWaste)")
                                .font(.caption)
                        }
                    }
                    else if (Chip.isMVR == true) && (Chip.isPrimeCoat) == true {
                        if (ChipGarage.BCoatTSColorant == ChipGarage.MVRTSColorant) && (ChipGarage.BCoatTSColorant == ChipGarage.PCoatTSColorant) {
                        Text("\(quant(product: TSColorant) + ChipGarage.QuantMVRColorant + ChipGarage.MVRWaste + ChipGarage.BCoatWaste + ChipGarage.QuantPCoatColorant + ChipGarage.PCoatWaste)")
                        .font(.caption)
                        }
                        else if (ChipGarage.BCoatPtB != ChipGarage.MVRPtB) && (ChipGarage.BCoatPtB == ChipGarage.PCoatPtB) {
                            Text("\(quant(product: TSColorant) + ChipGarage.BCoatWaste + ChipGarage.QuantPCoatColorant + ChipGarage.PCoatWaste)")
                            .font(.caption)
                        }
                        else {
                            Text("\(quant(product: TSColorant) + ChipGarage.BCoatWaste)")
                                .font(.caption)
                        }
                    }
                    else {
                        Text("\(quant(product: TSColorant) + ChipGarage.BCoatWaste)")
                            .font(.caption)
                    }
                }
    } //END OF BASE COAT PRODUCTS
        
    }
}

struct SysSummaryPCBC_Previews: PreviewProvider {
    static var previews: some View {
        SysSummaryPCBC()
    }
}
