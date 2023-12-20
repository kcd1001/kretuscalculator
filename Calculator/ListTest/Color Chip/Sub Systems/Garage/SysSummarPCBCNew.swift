//
//  SysSummarPCTC.swift
//  Calculator
//
//  Created by Kane Davidson on 9/1/21.
//

import SwiftUI

struct SysSummaryPCBCNew: View {
    @EnvironmentObject var ChipGarage : ColorChipValues //Used for coat selections
    @EnvironmentObject var Chip : ChipOptions //Used for checkbox options
    @EnvironmentObject var TSA : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @State var showingAlert = false
    @State var TCoat1PtACode = "EX-KPLY92AF-01"
    @State var TCoat1PtBCode = "EX-KPLY92B-01"
    @State var TCoat2PtACode = ""
    @State var TCoat2PtBCode = ""
    
    var TSMvr = stats(product: "Epoxy MVR", covRate: 150, MixRat: 1)


    @EnvironmentObject var sf : SquareFeet //Square feet
    var ChipTextureAO = stats(product: "Aluminum Oxide", covRate: 750, MixRat: 1 )
    var ChipTextureBead = stats(product: "Anti-Slip Bead", covRate: 750, MixRat: 16 )
    
    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Ench. Green", "A Resin - H. Blue",           "A Resin - Latte", "A Resin - Light Gray", "A Resin - Med. Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",           "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["MVR - EZ", "MVR - FC", "AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "H. Blue", "Latte", "Light Gray", "Med. Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    var TopCoat1Options = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor", "Polyurethane HS"]
    var TCoat1HardenerOptions = ["EZ - Clear", "Fast - Clear"]
    
    var TCoat1PtBCodes = ["EX-KPLY72B-01","EX-KPLY85B-01", "EX-KPLY92B-01", "EX-KPLYHSB-EA"]
    
    var TopCoat2Options = [ "Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor", "Polyurethane HS" , "Polyurethane HP Clear Gloss", "Polyurethane HP Clear Satin",  "No Top Coat 2"]
    var TCoat2HardenerOptions = ["EZ - Clear", "Fast - Clear"]
    
    var TextureOptions = ["No Texture", "Anti-Slip Aluminum Oxide 120 grit", "Anti-Slip Aluminum Oxide 220 grit", "Anti-Slip Aluminum Oxide 60 grit", "Anti-Slip Aluminum Oxide 80 grit", "Anti-Slip Bead 100", "Anti-Slip Bead 50"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    func checkTCoatCodes() -> Void {
    
    if ChipGarage.TCoat1Choice == 0 && ChipGarage.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY72AZ-01"
        TCoat1PtBCode = "EX-KPLY72B-01"
    }
    else if ChipGarage.TCoat1Choice == 0 && ChipGarage.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY72AF-01"
        TCoat1PtBCode = "EX-KPLY72B-01"

    }
    else if ChipGarage.TCoat1Choice == 1 && ChipGarage.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY85AZ-01"
        TCoat1PtBCode = "EX-KPLY85B-01"
    }
    else if ChipGarage.TCoat1Choice == 1 && ChipGarage.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY85AF-01"
        TCoat1PtBCode = "EX-KPLY85B-01"

    }
    else if ChipGarage.TCoat1Choice == 2 && ChipGarage.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY92AZ-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipGarage.TCoat1Choice == 2 && ChipGarage.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY92AF-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipGarage.TCoat1Choice == 3 && ChipGarage.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLYHSAZ-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210
    }
    else if ChipGarage.TCoat1Choice == 3 && ChipGarage.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLYHSAF-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210
    } //END OF TCOAT1
    if ChipGarage.TCoat2Choice == 0 && ChipGarage.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY72AZ-01"
            TCoat2PtBCode = "EX-KPLY72B-01"
        }
    else if ChipGarage.TCoat2Choice == 0 && ChipGarage.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY72AF-01"
            TCoat2PtBCode = "EX-KPLY72B-01"

        }
    else if ChipGarage.TCoat2Choice == 1 && ChipGarage.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY85AZ-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
        }
    else if ChipGarage.TCoat2Choice == 1 && ChipGarage.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY85AF-01"
            TCoat2PtBCode = "EX-KPLY85B-01"

        }
    else if ChipGarage.TCoat2Choice == 2 && ChipGarage.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY92AZ-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipGarage.TCoat2Choice == 2 && ChipGarage.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY92AF-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipGarage.TCoat2Choice == 3 && ChipGarage.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLYHSAZ-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"
        }
    else if ChipGarage.TCoat2Choice == 3 && ChipGarage.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLYHSAF-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"

        }
}
    

    var body: some View {
        if Chip.isPrimeCoat == true {
        VStack {
            Text("Prime Coat")
                .bold()
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
            Text("\(typesACodes[ChipGarage.PCoatPtA])")
                .font(.caption)
            Spacer()
            Text("TSE Part A: \(typesA[ChipGarage.PCoatPtA]), 1 gal")
                .font(.caption)
            Spacer()
            Text("\(quant(product: TSA) + ChipGarage.PCoatWaste)")
                .font(.caption)
            }
            HStack{ // Part B
            Text("\(typesBCodes[ChipGarage.PCoatPtB])")
                .font(.caption)
            Spacer()
            Text("TSE Part B: \(typesB[ChipGarage.PCoatPtB]), 1 gal")
                .font(.caption)
            Spacer()
            Text("\(quant(product: TSB) + ChipGarage.PCoatWaste)")
                .font(.caption)
            }
            HStack{ // Solvent Cleaner
                Text("EX-KSLVCLN-EA")
                    .font(.caption)
                Spacer()
                Text("Solvent Cleaner, 1 Quart")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSA))")
                    .font(.caption)
            }
            if ChipGarage.PCoatTSColorant != 0 {
            HStack{ // Colorant
            Text("\(TSColorantCodes[ChipGarage.PCoatTSColorant])")
                .font(.caption)
            Spacer()
            Text("TSE Colorant:  \(TSColorantChoices[ChipGarage.PCoatTSColorant]), 16 oz")
                .font(.caption)
            Spacer()
            Text("\(quant(product: TSColorant) + ChipGarage.PCoatWaste)")
                .font(.caption)
            }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        }
        if Chip.isMVR == true {
            VStack {
                Text("MVR Coat")
                    .bold()
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
                Text("\(typesACodes[ChipGarage.MVRPtA])")
                    .font(.caption)
                Spacer()
                Text("TSE Part A: \(typesA[ChipGarage.MVRPtA]), 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSMvr) + ChipGarage.MVRWaste)")
                    .font(.caption)
                }
                HStack{ // Part B
                Text("\(typesBCodes[ChipGarage.MVRPtB])")
                    .font(.caption)
                Spacer()
                Text("TSE Part B: \(typesB[ChipGarage.MVRPtB]), 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSMvr) + ChipGarage.MVRWaste)")
                    .font(.caption)
                }
                if ChipGarage.BCoatTSColorant != 0 {
                HStack{ // Colorant
                Text("\(TSColorantCodes[ChipGarage.MVRTSColorant])")
                    .font(.caption)
                Spacer()
                Text("TSE Colorant:  \(TSColorantChoices[ChipGarage.MVRTSColorant]), 16 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSMvr) + ChipGarage.MVRWaste)")
                    .font(.caption)
                }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
        VStack {
            Text("Base Coat")
                .bold()
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
            Text("\(typesACodes[ChipGarage.BCoatPtA])")
                .font(.caption)
            Spacer()
            Text("TSE Part A: \(typesA[ChipGarage.BCoatPtA]), 1 gal")
                .font(.caption)
            Spacer()
            Text("\(quant(product: TSA) + ChipGarage.BCoatWaste)")
                .font(.caption)
            }
            HStack{ // Part B
            Text("\(typesBCodes[ChipGarage.BCoatPtB])")
                .font(.caption)
            Spacer()
            Text("TSE Part B: \(typesB[ChipGarage.BCoatPtB]), 1 gal")
                .font(.caption)
            Spacer()
            Text("\(quant(product: TSB) + ChipGarage.BCoatWaste)")
                .font(.caption)
            }
            if ChipGarage.BCoatTSColorant != 0 {
            HStack{ // Colorant
            Text("\(TSColorantCodes[ChipGarage.BCoatTSColorant])")
                .font(.caption)
            Spacer()
            Text("TSE Colorant:  \(TSColorantChoices[ChipGarage.BCoatTSColorant]), 16 oz")
                .font(.caption)
            Spacer()
            Text("\(quant(product: TSColorant) + ChipGarage.BCoatWaste)")
                .font(.caption)
            }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        VStack { // Top Coat
            Text("Top Coat")
                .bold()
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
        
            if (ChipGarage.TCoat1Choice != ChipGarage.TCoat2Choice) {

                HStack {
                Text("\(TCoat1PtACode)")
                    .font(.caption)
                Spacer()
                Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipGarage.TCoat1Hardener]), 1 gl")
                    .font(.caption)
                Spacer()
                    Text("\(quant(product: PAPUTC1) + ChipGarage.TCoatWaste)")
                    .font(.caption)
            }

            HStack {
                Text("\(TCoat1PtBCode)")
                    .font(.caption)
                Spacer()
                if ChipGarage.TCoat1Choice != 3 {
                Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1 gl")
                    .font(.caption)
                }
                else {
                    Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1/2 gl")
                        .font(.caption)
                }
                Spacer()
                Text("\(quant(product: PAPUTC1) + ChipGarage.TCoatWaste)")
                    .font(.caption)
            }

            if ChipGarage.TCoat2Choice != 6 { //Displays TC2 products if a second tc is chosen
            HStack {
                Text("\(TCoat2PtACode)")
                    .font(.caption)
                Spacer()
                Text("\(TopCoat2Options[ChipGarage.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipGarage.TCoat2Hardener]), 1 gl")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPUTC2) + ChipGarage.TCoatWaste)")
                    .font(.caption)
            }
            HStack {
                Text("\(TCoat2PtBCode)")
                    .font(.caption)
                Spacer()
                if ChipGarage.TCoat2Choice != 3 {
                Text("\(TopCoat2Options[ChipGarage.TCoat2Choice]) Part B, 1 gl")
                    .font(.caption)
                }
                else {
                    Text("\(TopCoat2Options[ChipGarage.TCoat2Choice]) Part B, 1/2 gl")
                        .font(.caption)
                }
                Spacer()
                Text("\(quant(product: PAPUTC2) + ChipGarage.TCoatWaste)")
                    .font(.caption)
            }
            }
            }
            if (ChipGarage.TCoat1Choice == ChipGarage.TCoat2Choice) && (ChipGarage.TCoat1Hardener == ChipGarage.TCoat2Hardener) {
                HStack {
                    Text("\(TCoat1PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipGarage.TCoat1Hardener]), 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipGarage.TCoatWaste)")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat1PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipGarage.TCoat1Choice != 3 {
                    Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1 gl")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1/2 gl")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipGarage.TCoatWaste)")
                        .font(.caption)
                }
            }
            if (ChipGarage.TCoat1Choice == ChipGarage.TCoat2Choice) && (ChipGarage.TCoat1Hardener != ChipGarage.TCoat2Hardener) {
                HStack {
                    Text("\(TCoat1PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipGarage.TCoat1Hardener]), 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + ChipGarage.TCoatWaste)")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat2PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat2Options[ChipGarage.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipGarage.TCoat2Hardener]), 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC2) + ChipGarage.TCoatWaste)")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat1PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipGarage.TCoat1Choice != 3 {
                    Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1 gl")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat1Options[ChipGarage.TCoat1Choice]) Part B, 1/2 gl")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipGarage.TCoatWaste)")
                        .font(.caption)
                }
            }
            if ChipGarage.texture1 != 0 {
                if ChipGarage.texture1 < 5 {
                HStack {
                    Text("Contact Distributor")
                        .font(.caption)
                    Spacer()
                    Text("\(TextureOptions[ChipGarage.texture1]), 10#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ChipTextureAO) + ChipGarage.TCoatWaste)")
                        .font(.caption)
                }
            }
                if ChipGarage.texture1 >= 5 {
                    HStack {
                        Text("Contact Distributor")
                            .font(.caption)
                        Spacer()
                        Text("\(TextureOptions[ChipGarage.texture1]), 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureBead) + ChipGarage.TCoatWaste)")
                            .font(.caption)
                    }
                }
        }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        .onChange(of: ChipGarage.TCoat2Choice) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipGarage.TCoat2Hardener) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipGarage.TCoat1Hardener) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipGarage.TCoat1Choice) { _ in
          checkTCoatCodes()
        }
        
        
}
}

struct SysSummaryPCBCNew_Previews: PreviewProvider {
    static var previews: some View {
        SysSummaryPCBCNew()
    }
}

