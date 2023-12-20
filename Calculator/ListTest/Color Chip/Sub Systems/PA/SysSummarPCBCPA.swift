//
//  SysSummarPCTC.swift
//  Calculator
//
//  Created by Kane Davidson on 9/1/21.
//

import SwiftUI

struct SysSummaryPCBCPA: View {
    @EnvironmentObject var ChipPA : ColorChipValuesPA //Used for coat selections
    @EnvironmentObject var Chip : ChipOptions //Used for checkbox options
    @EnvironmentObject var TSA_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PAPtABC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PAPtBBC : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PAPolyColorantBC : stats //Used for system stats (mixRat,CovRate, etc)

    @State var showingAlert = false
    @State var TCoat1PtACode = "EX-KPLY92AF-01"
    @State var TCoat1PtBCode = "EX-KPLY92B-01"
    @State var TCoat2PtACode = ""
    @State var TCoat2PtBCode = ""
    @State var PCoatPtACode = "EX-KPLY72AZ-01"
    @State var PCoatHardenerCode = "EX-KPLY72B-01"
    @State var BCoatPtACode = "EX-KPLY72AZ-01"
    @State var BCoatHardenerCode = "EX-KPLY72B-01"

    @EnvironmentObject var sf : SquareFeet //Square feet
    var ChipTextureAO = stats(product: "Aluminum Oxide", covRate: 750, MixRat: 1 )
    var ChipTextureBead = stats(product: "Anti-Slip Bead", covRate: 750, MixRat: 16 )
    var TSMvr = stats(product: "Epoxy MVR", covRate: 150, MixRat: 1)

    
    
    let typesAPA = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    var PartAHardeners = ["EZ - Clear", "Fast - Clear"]
    
    var PtBCodes = ["EX-KPLY72B-01","EX-KPLY85B-01", "EX-KPLY92B-01", "EX-KPLYHSB-EA"]
    
    let Hardeners = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Ench. Green", "A Resin - H. Blue",           "A Resin - Latte", "A Resin - Light Gray", "A Resin - Med. Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",           "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["MVR - EZ", "MVR - FC", "AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSETHB-EA"]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA", "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA", "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA", "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "H. Blue", "Latte", "Light Gray", "Med. Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White"]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01"]
    
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
    
    if ChipPA.TCoat1Choice == 0 && ChipPA.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY72AZ-01"
        TCoat1PtBCode = "EX-KPLY72B-01"
    }
    else if ChipPA.TCoat1Choice == 0 && ChipPA.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY72AF-01"
        TCoat1PtBCode = "EX-KPLY72B-01"

    }
    else if ChipPA.TCoat1Choice == 1 && ChipPA.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY85AZ-01"
        TCoat1PtBCode = "EX-KPLY85B-01"
    }
    else if ChipPA.TCoat1Choice == 1 && ChipPA.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY85AF-01"
        TCoat1PtBCode = "EX-KPLY85B-01"

    }
    else if ChipPA.TCoat1Choice == 2 && ChipPA.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY92AZ-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipPA.TCoat1Choice == 2 && ChipPA.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY92AF-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipPA.TCoat1Choice == 3 && ChipPA.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLYHSAZ-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210
    }
    else if ChipPA.TCoat1Choice == 3 && ChipPA.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLYHSAF-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210
    } //END OF TCOAT1
    if ChipPA.TCoat2Choice == 0 && ChipPA.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY72AZ-01"
            TCoat2PtBCode = "EX-KPLY72B-01"
        }
    else if ChipPA.TCoat2Choice == 0 && ChipPA.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY72AF-01"
            TCoat2PtBCode = "EX-KPLY72B-01"

        }
    else if ChipPA.TCoat2Choice == 1 && ChipPA.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY85AZ-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
        }
    else if ChipPA.TCoat2Choice == 1 && ChipPA.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY85AF-01"
            TCoat2PtBCode = "EX-KPLY85B-01"

        }
    else if ChipPA.TCoat2Choice == 2 && ChipPA.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY92AZ-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipPA.TCoat2Choice == 2 && ChipPA.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY92AF-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipPA.TCoat2Choice == 3 && ChipPA.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLYHSAZ-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"
        }
    else if ChipPA.TCoat2Choice == 3 && ChipPA.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLYHSAF-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"

        }
        if ChipPA.PCoatPtA == 0 && ChipPA.PCoatHardener == 0 {
            PCoatPtACode = "EX-KPLY72AZ-01"
            PCoatHardenerCode = "EX-KPLY72B-01"
        }
        else if ChipPA.PCoatPtA == 0 && ChipPA.PCoatHardener == 1 {
            PCoatPtACode = "EX-KPLY72AF-01"
            PCoatHardenerCode = "EX-KPLY72B-01"

        }
        else if ChipPA.PCoatPtA == 1 && ChipPA.PCoatHardener == 0 {
            PCoatPtACode = "EX-KPLY85AZ-01"
            PCoatHardenerCode = "EX-KPLY85B-01"
        }
        else if ChipPA.PCoatPtA == 1 && ChipPA.PCoatHardener == 1 {
            PCoatPtACode = "EX-KPLY85AF-01"
            PCoatHardenerCode = "EX-KPLY85B-01"

        }
        else if ChipPA.PCoatPtA == 2 && ChipPA.PCoatHardener == 0 {
            PCoatPtACode = "EX-KPLY92AZ-01"
            PCoatHardenerCode = "EX-KPLY92B-01"

        }
        else if ChipPA.PCoatPtA == 2 && ChipPA.PCoatHardener == 1 {
            PCoatPtACode = "EX-KPLY92AF-01"
            PCoatHardenerCode = "EX-KPLY92B-01"

        }
        if ChipPA.BCoatPtA == 0 && ChipPA.BCoatHardener == 0 {
            BCoatPtACode = "EX-KPLY72AZ-01"
            BCoatHardenerCode = "EX-KPLY72B-01"
        }
        else if ChipPA.BCoatPtA == 0 && ChipPA.BCoatHardener == 1 {
            BCoatPtACode = "EX-KPLY72AF-01"
            BCoatHardenerCode = "EX-KPLY72B-01"

        }
        else if ChipPA.BCoatPtA == 1 && ChipPA.BCoatHardener == 0 {
            BCoatPtACode = "EX-KPLY85AZ-01"
            BCoatHardenerCode = "EX-KPLY85B-01"
        }
        else if ChipPA.BCoatPtA == 1 && ChipPA.BCoatHardener == 1 {
            BCoatPtACode = "EX-KPLY85AF-01"
            BCoatHardenerCode = "EX-KPLY85B-01"

        }
        else if ChipPA.BCoatPtA == 2 && ChipPA.BCoatHardener == 0 {
            BCoatPtACode = "EX-KPLY92AZ-01"
            BCoatHardenerCode = "EX-KPLY92B-01"

        }
        else if ChipPA.BCoatPtA == 2 && ChipPA.BCoatHardener == 1 {
            BCoatPtACode = "EX-KPLY92AF-01"
            BCoatHardenerCode = "EX-KPLY92B-01"

        }
}
    

    var body: some View {
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
                Text("\(PCoatPtACode)")
                    .font(.caption)
                Spacer()
                Text(" \(typesAPA[ChipPA.PCoatPtA]) - \(PartAHardeners[ChipPA.PCoatHardener]) 1 gl")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPtA) + ChipPA.PCoatWaste)")
                    .font(.caption)
            }
            HStack{ // Hardener
                Text("\(PCoatHardenerCode)")
                    .font(.caption)
                Spacer()
                Text(" \(typesAPA[ChipPA.PCoatPtA]) Part B, 1 gl")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPtA) + ChipPA.PCoatWaste)")
                    .font(.caption)
            }
            HStack{ // Solvent Cleaner
                Text("EX-KSLVCLN-EA")
                    .font(.caption)
                Spacer()
                Text("Solvent Cleaner, 32 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPtA) + ChipPA.PCoatWaste)")
                    .font(.caption)
            }
            if ChipPA.PCoatPolyColorant != 0 {
            HStack{ // Colorant
            Text("\(PolyColorantCodes[ChipPA.PCoatPolyColorant])")
                .font(.caption)
            Spacer()
            Text("Poly Colorant:  \(PolyColorantChoices[ChipPA.PCoatPolyColorant]), 16 oz")
                .font(.caption)
            Spacer()
            Text("\(quant(product: TSColorant) + ChipPA.PCoatWaste)")
                .font(.caption)
            }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
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
                Text("\(typesACodes[ChipPA.MVRPtA])")
                    .font(.caption)
                Spacer()
                Text("TSE Part A: \(typesA[ChipPA.MVRPtA]), 1 gl")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSMvr) + ChipPA.MVRWaste)")
                    .font(.caption)
                }
                HStack{ // Part B
                Text("\(typesBCodes[ChipPA.MVRPtB])")
                    .font(.caption)
                Spacer()
                Text("TSE Part B: \(typesB[ChipPA.MVRPtB]), 1 gl")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSMvr) + ChipPA.MVRWaste)")
                    .font(.caption)
                }
                if ChipPA.MVRTSColorant != 0 {
                HStack{ // Colorant
                Text("\(TSColorantCodes[ChipPA.MVRTSColorant])")
                    .font(.caption)
                Spacer()
                Text("TSE Colorant:  \(TSColorantChoices[ChipPA.MVRTSColorant]), 16 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSMvr) + ChipPA.MVRWaste)")
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
                Text("\(BCoatPtACode)")
                    .font(.caption)
                Spacer()
                Text(" \(typesAPA[ChipPA.BCoatPtA]) - \(PartAHardeners[ChipPA.BCoatHardener]) 1 gl")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPtABC) + ChipPA.BCoatWaste)")
                    .font(.caption)
            }
            HStack{ // Hardener
                Text("\(BCoatHardenerCode)")
                    .font(.caption)
                Spacer()
                Text(" \(typesAPA[ChipPA.BCoatPtA]) Part B, 1 gl")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPtABC))")
                    .font(.caption)
            }
            if ChipPA.BCoatPolyColorant != 0 {
            HStack{ // Colorant
            Text("\(PolyColorantCodes[ChipPA.BCoatPolyColorant])")
                .font(.caption)
            Spacer()
            Text("Poly Colorant:  \(PolyColorantChoices[ChipPA.BCoatPolyColorant]), 16 oz")
                .font(.caption)
            Spacer()
            Text("\(quant(product: PAPolyColorantBC) + ChipPA.BCoatWaste)")
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
         
        
            if (ChipPA.TCoat1Choice != ChipPA.TCoat2Choice) {

                HStack {
                Text("\(TCoat1PtACode)")
                    .font(.caption)
                Spacer()
                Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipPA.TCoat1Hardener]), 1 gl")
                    .font(.caption)
                Spacer()
                    Text("\(quant(product: PAPUTC1) + ChipPA.TCoatWaste)")
                    .font(.caption)
            }

            HStack {
                Text("\(TCoat1PtBCode)")
                    .font(.caption)
                Spacer()
                if ChipPA.TCoat1Choice != 3 {
                Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1 gl")
                    .font(.caption)
                }
                else {
                    Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1/2 gl")
                        .font(.caption)
                }
                Spacer()
                Text("\(quant(product: PAPUTC1) + ChipPA.TCoatWaste)")
                    .font(.caption)
            }

            if ChipPA.TCoat2Choice != 6 { //Displays TC2 products if a second tc is chosen
            HStack {
                Text("\(TCoat2PtACode)")
                    .font(.caption)
                Spacer()
                Text("\(TopCoat2Options[ChipPA.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipPA.TCoat2Hardener]), 1 gl")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPUTC2) + ChipPA.TCoatWaste)")
                    .font(.caption)
            }
            HStack {
                Text("\(TCoat2PtBCode)")
                    .font(.caption)
                Spacer()
                if ChipPA.TCoat2Choice != 3 {
                Text("\(TopCoat2Options[ChipPA.TCoat2Choice]) Part B, 1 gl")
                    .font(.caption)
                }
                else {
                    Text("\(TopCoat2Options[ChipPA.TCoat2Choice]) Part B, 1/2 gl")
                        .font(.caption)
                }
                Spacer()
                Text("\(quant(product: PAPUTC2) + ChipPA.TCoatWaste)")
                    .font(.caption)
            }
            }
            }
            if (ChipPA.TCoat1Choice == ChipPA.TCoat2Choice) && (ChipPA.TCoat1Hardener == ChipPA.TCoat2Hardener) {
                HStack {
                    Text("\(TCoat1PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipPA.TCoat1Hardener]), 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipPA.TCoatWaste)")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat1PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipPA.TCoat1Choice != 3 {
                    Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1 gl")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1/2 gl")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipPA.TCoatWaste)")
                        .font(.caption)
                }
            }
            if (ChipPA.TCoat1Choice == ChipPA.TCoat2Choice) && (ChipPA.TCoat1Hardener != ChipPA.TCoat2Hardener) {
                HStack {
                    Text("\(TCoat1PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipPA.TCoat1Hardener]), 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + ChipPA.TCoatWaste)")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat2PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat2Options[ChipPA.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipPA.TCoat2Hardener]), 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC2) + ChipPA.TCoatWaste)")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat1PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipPA.TCoat1Choice != 3 {
                    Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1 gl")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat1Options[ChipPA.TCoat1Choice]) Part B, 1/2 gl")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipPA.TCoatWaste)")
                        .font(.caption)
                }
            }
            if ChipPA.texture1 != 0 {
                if ChipPA.texture1 < 5 {
                HStack {
                    Text("Contact Distributor")
                        .font(.caption)
                    Spacer()
                    Text("\(TextureOptions[ChipPA.texture1]), 10#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ChipTextureAO) + ChipPA.TCoatWaste)")
                        .font(.caption)
                }
            }
                if ChipPA.texture1 >= 5 {
                    HStack {
                        Text("Contact Distributor")
                            .font(.caption)
                        Spacer()
                        Text("\(TextureOptions[ChipPA.texture1]), 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureBead) + ChipPA.TCoatWaste)")
                            .font(.caption)
                    }
                }
        }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        .onChange(of: ChipPA.TCoat2Choice) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipPA.TCoat2Hardener) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipPA.TCoat1Hardener) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipPA.TCoat1Choice) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipPA.PCoatPtA) { _ in
                    checkTCoatCodes()
                 }
        .onChange(of: ChipPA.PCoatHardener) { _ in
                    checkTCoatCodes()
                 }
        .onChange(of: ChipPA.BCoatPtA) { _ in
                    checkTCoatCodes()
                 }
        .onChange(of: ChipPA.BCoatHardener) { _ in
                    checkTCoatCodes()
                 }
        
        
}
}

struct SysSummaryPCBCPA_Previews: PreviewProvider {
    static var previews: some View {
        SysSummaryPCBCNew()
    }
}

