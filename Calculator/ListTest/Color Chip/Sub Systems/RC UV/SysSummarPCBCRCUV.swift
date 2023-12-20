//
//  SysSummarPCTC.swift
//  Calculator
//
//  Created by Kane Davidson on 9/1/21.
//

import SwiftUI

struct SysSummaryPCBCRCUV: View {
    @EnvironmentObject var ChipRCUV : ColorChipValuesRCUV //Used for coat selections
    @EnvironmentObject var Chip : ChipOptions //Used for checkbox options
    @EnvironmentObject var BCoatUPCA : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCB : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCC : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCColorant : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BCoatUPCD : stats2 //Used for system stats (mixRat,CovRate, etc)

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
    
    var UPCA = stats(product: "Urethane Polymer Concrete Part A:", covRate: 330, MixRat: 6)
    var UPCB = stats(product: "Urethane Polymer Concrete Part B:", covRate: 330, MixRat: 6)
    var UPCC = stats(product: "Urethane Polymer Concrete Part C:", covRate: 330, MixRat: 6)
    var UPCColorant = stats(product: "Urethane Polymer Concrete Colorant", covRate: 330, MixRat: 4)
    var UPCD = stats(product: "Poly Accelerant", covRate: 190, MixRat: 6)
    
    
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
    
    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
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

    if ChipRCUV.TCoat1Choice == 0 && ChipRCUV.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY72AZ-01"
        TCoat1PtBCode = "EX-KPLY72B-01"
    }
    else if ChipRCUV.TCoat1Choice == 0 && ChipRCUV.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY72AF-01"
        TCoat1PtBCode = "EX-KPLY72B-01"

    }
    else if ChipRCUV.TCoat1Choice == 1 && ChipRCUV.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY85AZ-01"
        TCoat1PtBCode = "EX-KPLY85B-01"
    }
    else if ChipRCUV.TCoat1Choice == 1 && ChipRCUV.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY85AF-01"
        TCoat1PtBCode = "EX-KPLY85B-01"

    }
    else if ChipRCUV.TCoat1Choice == 2 && ChipRCUV.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLY92AZ-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipRCUV.TCoat1Choice == 2 && ChipRCUV.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLY92AF-01"
        TCoat1PtBCode = "EX-KPLY92B-01"

    }
    else if ChipRCUV.TCoat1Choice == 3 && ChipRCUV.TCoat1Hardener == 0 {
        TCoat1PtACode = "EX-KPLYHSAZ-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210
    }
    else if ChipRCUV.TCoat1Choice == 3 && ChipRCUV.TCoat1Hardener == 1 {
        TCoat1PtACode = "EX-KPLYHSAF-01"
        TCoat1PtBCode = "EX-KPLYHSB-EA"
        PAPUTC1.covRate = 210
    } //END OF TCOAT1
    if ChipRCUV.TCoat2Choice == 0 && ChipRCUV.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY72AZ-01"
            TCoat2PtBCode = "EX-KPLY72B-01"
        }
    else if ChipRCUV.TCoat2Choice == 0 && ChipRCUV.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY72AF-01"
            TCoat2PtBCode = "EX-KPLY72B-01"

        }
    else if ChipRCUV.TCoat2Choice == 1 && ChipRCUV.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY85AZ-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
        }
    else if ChipRCUV.TCoat2Choice == 1 && ChipRCUV.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY85AF-01"
            TCoat2PtBCode = "EX-KPLY85B-01"

        }
    else if ChipRCUV.TCoat2Choice == 2 && ChipRCUV.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY92AZ-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipRCUV.TCoat2Choice == 2 && ChipRCUV.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY92AF-01"
            TCoat2PtBCode = "EX-KPLY92B-01"

        }
    else if ChipRCUV.TCoat2Choice == 3 && ChipRCUV.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLYHSAZ-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"
        }
    else if ChipRCUV.TCoat2Choice == 3 && ChipRCUV.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLYHSAF-01"
            TCoat2PtBCode = "EX-KPLYHSB-EA"

        }
}
    

    var body: some View {
        if Chip.isPrimeCoat == true {
        VStack { // Start of coat summary
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
                Text("EX-KUPCARC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - RC/TT, 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPCA) + ChipRCUV.PCoatWaste)")
                    .font(.caption)
            }
            HStack{ // Part B
                Text("EX-BRCUVAP6-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part B - RC UV PA, 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPCB) + ChipRCUV.PCoatWaste)")
                    .font(.caption)
            }
            HStack{ // Part C
                Text("EX-KUPCRFC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - RC, 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPCC) + ChipRCUV.PCoatWaste)")
                    .font(.caption)
            }
            if ChipRCUV.PCoatColor != 0 {
            HStack{ // Color
                Text("\(UPCColorantCodes[ChipRCUV.PCoatColor])")
                    .font(.caption)
                Spacer()
                Text("UPC Colorant - \(UPCColorantChoices[ChipRCUV.PCoatColor]), 4 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPCColorant) + ChipRCUV.PCoatWaste)")
                    .font(.caption)
            }
        }
            HStack{ // Poly Accelerant
                Text("EX-KPLACEL32-EA")
                    .font(.caption)
                Spacer()
                Text("Poly Accelerant, 32 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPCD) + ChipRCUV.PCoatWaste)")
                    .font(.caption)
            }
        }
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                    .padding()
            }
        if Chip.isMVR == true {
            VStack { // Start of coat summary
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
                    Text("EX-KUPCARC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - RC/TT, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCA))")
                        .font(.caption)
                }
                HStack{ // Part B
                    Text("EX-BRCUVAP6-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC UV PA, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCB))")
                        .font(.caption)
                }
                HStack{ // Part C
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCC))")
                        .font(.caption)
                }
                if ChipRCUV.MVRCoatColor != 0 {
                HStack{ // Color
                    Text("\(UPCColorantCodes[ChipRCUV.MVRCoatColor])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant - \(UPCColorantChoices[ChipRCUV.MVRCoatColor]), 4 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCColorant))")
                        .font(.caption)
                }
            }
                HStack{ // Poly Accelerant
                    Text("EX-KPLACEL32-EA")
                        .font(.caption)
                    Spacer()
                    Text("Poly Accelerant, 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPCD))")
                        .font(.caption)
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
                    Text("EX-KUPCARC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - RC/TT, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: BCoatUPCA) + ChipRCUV.BCoatWaste)")
                        .font(.caption)
                }
                HStack{ // Part B
                    Text("EX-BRCUVAP6-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC UV PA, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: BCoatUPCB) + ChipRCUV.BCoatWaste)")
                        .font(.caption)
                }
                HStack{ // Part C
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: BCoatUPCC) + ChipRCUV.BCoatWaste)")
                        .font(.caption)
                }
                if ChipRCUV.BCoatColor != 0 {
                HStack{ // Color
                    Text("\(UPCColorantCodes[ChipRCUV.BCoatColor])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant - \(UPCColorantChoices[ChipRCUV.BCoatColor]), 4 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: BCoatUPCColorant) + ChipRCUV.BCoatWaste)")
                        .font(.caption)
                }
            }
                HStack{ // Poly Accelerant
                    Text("EX-KPLACEL32-EA")
                        .font(.caption)
                    Spacer()
                    Text("Poly Accelerant, 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: BCoatUPCD) + ChipRCUV.BCoatWaste)")
                        .font(.caption)
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
         
        
            if (ChipRCUV.TCoat1Choice != ChipRCUV.TCoat2Choice) {

                HStack {
                Text("\(TCoat1PtACode)")
                    .font(.caption)
                Spacer()
                Text("\(TopCoat1Options[ChipRCUV.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipRCUV.TCoat1Hardener]), 1 gl")
                    .font(.caption)
                Spacer()
                    Text("\(quant(product: PAPUTC1) + ChipRCUV.TCoatWaste)")
                    .font(.caption)
            }

            HStack {
                Text("\(TCoat1PtBCode)")
                    .font(.caption)
                Spacer()
                if ChipRCUV.TCoat1Choice != 3 {
                Text("\(TopCoat1Options[ChipRCUV.TCoat1Choice]) Part B, 1 gl")
                    .font(.caption)
                }
                else {
                    Text("\(TopCoat1Options[ChipRCUV.TCoat1Choice]) Part B, 1/2 gl")
                        .font(.caption)
                }
                Spacer()
                Text("\(quant(product: PAPUTC1) + ChipRCUV.TCoatWaste)")
                    .font(.caption)
            }

            if ChipRCUV.TCoat2Choice != 6 { //Displays TC2 products if a second tc is chosen
            HStack {
                Text("\(TCoat2PtACode)")
                    .font(.caption)
                Spacer()
                Text("\(TopCoat2Options[ChipRCUV.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipRCUV.TCoat2Hardener]), 1 gl")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPUTC2) + ChipRCUV.TCoatWaste)")
                    .font(.caption)
            }
            HStack {
                Text("\(TCoat2PtBCode)")
                    .font(.caption)
                Spacer()
                if ChipRCUV.TCoat2Choice != 3 {
                Text("\(TopCoat2Options[ChipRCUV.TCoat2Choice]) Part B, 1 gl")
                    .font(.caption)
                }
                else {
                    Text("\(TopCoat2Options[ChipRCUV.TCoat2Choice]) Part B, 1/2 gl")
                        .font(.caption)
                }
                Spacer()
                Text("\(quant(product: PAPUTC2) + ChipRCUV.TCoatWaste)")
                    .font(.caption)
            }
            }
            }
            if (ChipRCUV.TCoat1Choice == ChipRCUV.TCoat2Choice) && (ChipRCUV.TCoat1Hardener == ChipRCUV.TCoat2Hardener) {
                HStack {
                    Text("\(TCoat1PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat1Options[ChipRCUV.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipRCUV.TCoat1Hardener]), 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipRCUV.TCoatWaste)")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat1PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipRCUV.TCoat1Choice != 3 {
                    Text("\(TopCoat1Options[ChipRCUV.TCoat1Choice]) Part B, 1 gl")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat1Options[ChipRCUV.TCoat1Choice]) Part B, 1/2 gl")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipRCUV.TCoatWaste)")
                        .font(.caption)
                }
            }
            if (ChipRCUV.TCoat1Choice == ChipRCUV.TCoat2Choice) && (ChipRCUV.TCoat1Hardener != ChipRCUV.TCoat2Hardener) {
                HStack {
                    Text("\(TCoat1PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat1Options[ChipRCUV.TCoat1Choice]) - \(TCoat1HardenerOptions[ChipRCUV.TCoat1Hardener]), 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + ChipRCUV.TCoatWaste)")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat2PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(TopCoat2Options[ChipRCUV.TCoat2Choice]) - \(TCoat2HardenerOptions[ChipRCUV.TCoat2Hardener]), 1 gl")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC2) + ChipRCUV.TCoatWaste)")
                        .font(.caption)
                }
                HStack {
                    Text("\(TCoat1PtBCode)")
                        .font(.caption)
                    Spacer()
                    if ChipRCUV.TCoat1Choice != 3 {
                    Text("\(TopCoat1Options[ChipRCUV.TCoat1Choice]) Part B, 1 gl")
                        .font(.caption)
                    }
                    else {
                        Text("\(TopCoat1Options[ChipRCUV.TCoat1Choice]) Part B, 1/2 gl")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: PAPUTC1) + quant(product: PAPUTC2) + ChipRCUV.TCoatWaste)")
                        .font(.caption)
                }
            }
            if ChipRCUV.texture1 != 0 {
                if ChipRCUV.texture1 < 5 {
                HStack {
                    Text("Contact Distributor")
                        .font(.caption)
                    Spacer()
                    Text("\(TextureOptions[ChipRCUV.texture1]), 10#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ChipTextureAO) + ChipRCUV.TCoatWaste)")
                        .font(.caption)
                }
            }
                if ChipRCUV.texture1 >= 5 {
                    HStack {
                        Text("Contact Distributor")
                            .font(.caption)
                        Spacer()
                        Text("\(TextureOptions[ChipRCUV.texture1]), 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureBead) + ChipRCUV.TCoatWaste)")
                            .font(.caption)
                    }
                }
        }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        .onChange(of: ChipRCUV.TCoat2Choice) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipRCUV.TCoat2Hardener) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipRCUV.TCoat1Hardener) { _ in
          checkTCoatCodes()
        }
        .onChange(of: ChipRCUV.TCoat1Choice) { _ in
          checkTCoatCodes()
        }
        
}
}

struct SysSummaryPCBCRCUV_Previews: PreviewProvider {
    static var previews: some View {
        SysSummaryPCBCNew()
    }
}


