//
//  SysSummarPCTC.swift
//  Calculator
//
//  Created by Kane Davidson on 9/1/21.
//

import SwiftUI

struct SysSumPCBCSelectEDissipative: View {
    @EnvironmentObject var ChipEDissipative : ColorChipValuesSelectEDissipative //Used for coat selections
    @EnvironmentObject var Chip : ChipOptions //Used for checkbox options
    @EnvironmentObject var TSA_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_TS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var Broadcast : statsBroadcast
    @State var showingAlert = false
    @State var TCoat1PtACode = "EX-KPLY85AZ-01"
    @State var TCoat1PtBCode = "EX-KPLY85B-01"
    @State var TCoat2PtACode = ""
    @State var TCoat2PtBCode = ""
    var TSMvr = stats(product: "Epoxy MVR", covRate: 150, MixRat: 1)


    @EnvironmentObject var sf : SquareFeet //Square feet
    var ChipTextureAO = stats(product: "Aluminum Oxide", covRate: 750, MixRat: 1 )
    var ChipTextureBead = stats(product: "Anti-Slip Bead", covRate: 750, MixRat: 16 )
    
    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray",
                  "A Resin - Ench. Green", "A Resin - Handic. Blue", "A Resin - Latte", "A Resin - Light Gray",
                  "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",
                  "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red",
                  "A Resin - White", "CR Resin - Clear", "LG Resin - Clear", "Commercial Resin - Clear"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01",
                       "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",
                       "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01",
                       "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01",
                       "EX-KTSARSG-01", "EX-KTSARTN-01", "EX-KTSARTR-01",
                       "EX-KTSARWH-01", "EX-KTSECRRC-01","Contact Distributor",
                       "FG-TSECMRCLR-01G"]
    
    let typesB = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "H. Blue", "Latte", "Light Gray", "Med. Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    var TopCoat1Options = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor", "Polyurethane HS"]
    var TCoat1HardenerOptions = ["EZ - Clear", "Fast - Clear"]
    
    var TCoat1PtBCodes = ["EX-KPLY72B-01","EX-KPLY85B-01", "EX-KPLY92B-01", "EX-KPLYHSB-EA"]
    
    var TopCoat2Options = ["No Top Coat 2", "Polyaspartic 85 FC Clear"]
    var TCoat2HardenerOptions = ["EZ - Clear", "Fast - Clear"]

    
    var TextureOptions = ["No Texture", "Anti-Slip Tex 50"]

    
    let kitTypes = ["Stone", "Slate", "Greige", "Baja", "Ocean", "Maroon"]
    
    let kitCodes = ["KIT-10302EZS", "KIT-10303EZS", "KIT-10304EZS", "KIT-10305EZS", "KIT-10306EZS", "KIT-10307EZS"]

    var ChipSizes = ["1/4\"", "1/8\""]

    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required
    
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required for broadcast
    
    func checkTCoatCodes() -> Void {
        
        if ChipEDissipative.TCoat1Hardener == 0 {
            TCoat1PtACode = "EX-KPLY85AZ-01"
            TCoat1PtBCode = "EX-KPLY85B-01"
        }
        else if ChipEDissipative.TCoat1Hardener == 1 {
            TCoat1PtACode = "EX-KPLY85AF-01"
            TCoat1PtBCode = "EX-KPLY85B-01"
            
        }

        
        //END OF TCOAT1
        
        if ChipEDissipative.TCoat2Hardener == 0 {
            TCoat2PtACode = "EX-KPLY85AZ-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
        }
        else if ChipEDissipative.TCoat2Hardener == 1 {
            TCoat2PtACode = "EX-KPLY85AF-01"
            TCoat2PtBCode = "EX-KPLY85B-01"
            
        }
        
    }

    var body: some View {
        if Chip.isPrimeCoat == true
        {
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
                
                HStack {
                    Text("\(kitCodes[ChipEDissipative.PCoatPtA])")
                        .font(.caption)
                    Spacer()
                    Text("Kretus Select Epoxy Dissipative Kit - \(kitTypes[ChipEDissipative.PCoatPtA])")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: selectTSA_TS) + ChipEDissipative.PCoatWaste)")
                        .font(.caption)
                }
                
                
//                HStack { // Solvent Cleaner
//                    Text("EX-KSLVCLN-EA")
//                        .font(.caption)
//                    Spacer()
//                    Text("Solvent Cleaner, 32 oz")
//                        .font(.caption)
//                    Spacer()
//                    Text("\(quant(product: selectTSA_TS) + ChipEDissipative.PCoatWaste)")
//                        .font(.caption)
//                }

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
                Text("\(typesACodes[ChipEDissipative.MVRPtA])")
                    .font(.caption)
                Spacer()
                Text("TSE Part A: \(typesA[ChipEDissipative.MVRPtA]), 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSMvr) + ChipEDissipative.MVRWaste)")
                    .font(.caption)
                }
                HStack{ // Part B
                Text("\(typesBCodes[ChipEDissipative.MVRPtB])")
                    .font(.caption)
                Spacer()
                Text("TSE Part B: \(typesB[ChipEDissipative.MVRPtB]), 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSMvr) + ChipEDissipative.MVRWaste)")
                    .font(.caption)
                }
                if ChipEDissipative.MVRTSColorant != 0 {
                HStack{ // Colorant
                Text("\(TSColorantCodes[ChipEDissipative.MVRTSColorant])")
                    .font(.caption)
                Spacer()
                Text("TSE Colorant:  \(TSColorantChoices[ChipEDissipative.MVRTSColorant]), 16 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSMvr) + ChipEDissipative.MVRWaste)")
                    .font(.caption)
                }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
        VStack { // Start of coat summary
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
            
            HStack {
                Text("\(kitCodes[ChipEDissipative.BCoatPtA])")
                    .font(.caption)
                Spacer()
                Text("Kretus Select Epoxy Dissipative Kit - \(kitTypes[ChipEDissipative.BCoatPtA])")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: selectTSA_TS))")
                    .font(.caption)
            }
            
//            HStack { // Solvent Cleaner
//                Text("EX-KSLVCLN-EA")
//                    .font(.caption)
//                Spacer()
//                Text("Solvent Cleaner, 32 oz")
//                    .font(.caption)
//                Spacer()
//                Text("\(quant(product: selectTSABC_TS) + ChipPoly.BCoatWaste)")
//                    .font(.caption)
//            }

        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
//        VStack {
//            Text("Broadcast")
//                .bold()
//            HStack {
//                Text("PRODUCT CODE")
//                    .underline()
//                    .font(.caption)
//                Spacer()
//                Text("PRODUCT")
//                    .underline()
//                    .font(.caption)
//                Spacer()
//                Text("QUANTITY")
//                    .underline()
//                    .font(.caption)
//            }
//            HStack { // Broadcast
//                Text("Contact Distributor")
//                    .font(.caption)
//                Spacer()
//                Text("\(ChipSizes[ChipPoly.BroadcastSizeSelection]) Approved Chips, 55#")
//                    .font(.caption)
//                Spacer()
//                Text("\(quantBroadcast(product: Broadcast))")
//                    .font(.caption)
//            }
//        }
//        .padding()
//        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//        .cornerRadius(5.0)

        VStack { // Start of coat summary
            Text("Top Coat 1")
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
            
            HStack {
                Text("EX-285FCPU-KIT")
                    .font(.caption)
                Spacer()
                Text("Polyaspartic 85 - FC Clear Select Kit, 2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PAPUTC1))")
                    .font(.caption)
            }
            
            //                HStack {
            //                    Text("\(TCoat1PtBCode)")
            //                        .font(.caption)
            //                    Spacer()
            //                        Text("Polyaspartic 85 Part B, 1 gal")
            //                            .font(.caption)
            //
            ////                    else {
            ////                        Text("\(TopCoat1Options[ChipPoly.TCoat1Choice]) Part B, 1/2 gal")
            ////                            .font(.caption)
            ////                    }
            //                    Spacer()
            //                    Text("\(quant(product: PAPUTC1))")
            //                        .font(.caption)
            //                }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        if ChipEDissipative.TCoat2Choice == 1 { //Displays TC2 products if a second tc is chosen
            VStack {
                Text("Top Coat 2")
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
                
                HStack {
                    Text("EX-285FCPU-KIT")
                        .font(.caption)
                    Spacer()
                    Text("Polyaspartic 85 - FC Clear Select Kit, 2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: PAPUTC1))")
                        .font(.caption)
                }
                
                if ChipEDissipative.texture1 != 0 {
                    HStack {
                        Text("EX-KAST50-EA")
                            .font(.caption)
                        Spacer()
                        Text("Anti-Slip Tex 50, 2.75#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureAO))")
                            .font(.caption)
                    }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
        }
}


struct SysSumPCBCSelectEDissipative_Previews: PreviewProvider {
    static var previews: some View {
        SysSummaryPCBCNew()
    }
}

