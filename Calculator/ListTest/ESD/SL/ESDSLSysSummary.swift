//
//  EpoxyCoveColorSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 7/4/22.
//

import SwiftUI

struct ESDSLSysSummary: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ESDSL : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var ESDTS : ColorQuartzTSValues
    @EnvironmentObject var CoveColorQuartz : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastESDSL : statsBroadcast
    
    @EnvironmentObject var bCoatCoveESDTSA : stats2
    @EnvironmentObject var bCoatCoveESDTSB : stats2
    @EnvironmentObject var bCoatCoveESDTSColorant : stats2
    @EnvironmentObject var bCoatCoveQuartzTexture : stats2
    
    var BroadcastESDTS = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
    var TSMvr = stats(product: "Epoxy MVR", covRate: 150, MixRat: 1)

    
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
    
    let typesB = ["AP", "EZ", "FC"]
    let typesBCodes = ["EX-KUPCSLB8-EA", "EX-KUPCSLZ8-EA", "EX-KUPCSLF8-EA"]
    
    let TCtypesB = ["AP", "EZ", "Fast"]
    let TCtypesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA"]

    
    let typesBMVR = ["MVR - EZ", "MVR - FC"]
    let typesBMVRCodes = ["EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["","Beige", "Black", "Dark Gray", "Ench. Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = [ "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    var QuartzSizes = ["1/4\"", "1/8\""]
    
    var QuartzChoices = ["Anaheim Gray", "Antler", "Avery", "Bow Tie", "Charcoal", "Coyote", "Domino", "Fog Gray", "Granite", "Gravel", "Keaton", "Lasorda Blue", "Lighthouse", "Monterey Spice", "Onyx Pearl", "Orbit", "Outback", "Pintail", "Saddle Tan", "Shorline", "Sienna", "Smoke", "Swan", "Terrier" , "Thistle", "Twilight"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose"]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA", "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA", "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA", "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01",]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PATypes = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    let PACodes = ["EX-KPLY92AZ-01", "EX-KPLY92AF-01"]

    
    let PUTypes = ["Polyurethane HS", "Polyurethane HP"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let puhpHardeners = ["HP Gloss", "HP Satin"]


    var ChipSizes = ["#20 / Q-Grade", "#30 / F-Grade", "#60 / XF-Grade"]
    
    let TextureOptions = ["No Texture", "Anti-Slip Aluminum Oxide 120 grit", "Anti-Slip Aluminum Oxide 220 grit",  "Anti-Slip Bead 100", "Anti-Slip Bead 50", "Anti-Slip Tex 50"]
    
    let textureCodes = ["", "EX-KASAO120-01", "EX-KASAOX220-EA", "EX-KASB100-EA", "EX-KASB50-EA", "EX-KAST50-EA"]

    
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
    
    var body: some View {
        
//        if Chip.isPrimeCoat
//        {
//            Text("Prime Coat")
//                .bold()
//        VStack
//        {
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
//
//            HStack{
//                Text("\(typesACodes[ESDTS.PCoatPtA])")
//                    .font(.caption)
//                Spacer()
//                Text("TSE Part A: \(typesA[ESDTS.PCoatPtA]), 1 gal")
//                    .font(.caption)
//                Spacer()
//                Text("\(quant(product: TSA_ESDTS) + ESDTS.PCoatWaste)")
//                    .font(.caption)
//            }
//
//            HStack{
//                Text("\(typesBCodes[ESDTS.PCoatPtB])")
//                    .font(.caption)
//                Spacer()
//                Text("Top Shelf® Epoxy Part B: \(typesB[ESDTS.PCoatPtB]), 1/2 gal")
//                    .font(.caption)
//                Spacer()
//                Text("\(quant(product: TSB_ESDTS) + ESDTS.PCoatWaste)")
//                    .font(.caption)
//            }
//
//            if ESDTS.PCoatSC
//            {
//                HStack{ // Solvent Cleaner
//                    Text("EX-KSLVCLN-EA")
//                        .font(.caption)
//                    Spacer()
//                    Text("Solvent Cleaner, 32 oz")
//                        .font(.caption)
//                    Spacer()
//                    Text("\(quant(product: TSA_ESDTS))")
//                        .font(.caption)
//                }
//            }
//
//            if ESDTS.PCoatTSColorant != 0
//            {
//                HStack {
//                    Text("\(TSColorantCodes[ESDTS.BCoatTSColorant])")
//                        .font(.caption)
//                    Spacer()
//                    Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ESDTS.BCoatTSColorant]), 16 oz")
//                        .font(.caption)
//                    Spacer()
//                    Text("\(quant(product: TSColorantBC_ESDTS))")
//                        .font(.caption)
//                }
//            }
//
//        }
//        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//        .cornerRadius(5.0)
//        .padding()
//        }
//
//        if Chip.isMVR
//        {
//            Text("MVR Coat")
//                .bold()
//            VStack { // Start of coat summary
//                HStack {
//                    Text("PRODUCT CODE")
//                        .underline()
//                        .font(.caption)
//                    Spacer()
//                    Text("PRODUCT")
//                        .underline()
//                        .font(.caption)
//                    Spacer()
//                    Text("QUANTITY")
//                        .underline()
//                        .font(.caption)
//                }
//
//                HStack{
//                    Text("\(typesACodes[ESDTS.MVRPtA])")
//                        .font(.caption)
//                    Spacer()
//                    Text("TSE Part A: \(typesA[ESDTS.MVRPtA]), 1 gal")
//                        .font(.caption)
//                    Spacer()
//                    Text("\(quant(product: TSMvr) + ESDTS.MVRWaste)")
//                        .font(.caption)
//                }
//
//                HStack{
//                    Text("\(typesBMVRCodes[ESDTS.MVRPtB])")
//                        .font(.caption)
//                    Spacer()
//                    Text("Top Shelf® Epoxy Part B: \(typesBMVR[ESDTS.MVRPtB]), 1/2 gal")
//                        .font(.caption)
//                    Spacer()
//                    Text("\(quant(product: TSMvr) + ESDTS.MVRWaste)")
//                        .font(.caption)
//                }
//                if ESDTS.MVRTSColorant != 0 {
//                    HStack {
//                        Text("\(TSColorantCodes[ESDTS.MVRTSColorant])")
//                            .font(.caption)
//                        Spacer()
//                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ESDTS.MVRTSColorant]), 16 oz")
//                            .font(.caption)
//                        Spacer()
//                        Text("\(quant(product: TSMvr) + ESDTS.MVRWaste)")
//                            .font(.caption)
//                    }
//
//                }
//            }
//            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//            .cornerRadius(5.0)
//            .padding()
//        }
        Text("MVR Coat")
            .bold()
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
            
            HStack{
                Text("EX-KUPCASL8-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - SL/MF, 8#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSA_ESDSL) + ESDSL.PCoatWaste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[ESDSL.PCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("UPC Part B - SL/MF \(typesB[ESDSL.PCoatPtB]), 8#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSB_ESDSL) + ESDSL.PCoatWaste)")
                    .font(.caption)
            }
            
            HStack{
                Text("EX-KUPCSLC2-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - SL, 25#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSA_ESDSL) + ESDSL.PCoatWaste)")
                    .font(.caption)
            }
            if ESDSL.PCoatSC
            {
                HStack{ // Solvent Cleaner
                    Text("EX-KSLVCLN-EA")
                        .font(.caption)
                    Spacer()
                    Text("Solvent Cleaner, 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSA_ESDSL) + ESDSL.PCoatWaste)")
                        .font(.caption)
                }
            }
            
            //                if ESDSL.PCoatTSColorant != 0
            //                {
            //                    HStack {
            //                        Text("\(TSColorantCodes[ESDSL.BCoatTSColorant])")
            //                            .font(.caption)
            //                        Spacer()
            //                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ESDSL.PCoatTSColorant]), 16 oz")
            //                            .font(.caption)
            //                        Spacer()
            //                        Text("\(quant(product: TSColorant_ESDSL))")
            //                            .font(.caption)
            //                    }
            //                }
            
            
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
//        Text("Broadcast")
//            .bold()
//        VStack { // Start of coat summary
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
//            HStack {
//                Text("Contact Distributor")
//                    .font(.caption)
//                Spacer()
//                Text("Kretus® Approved \(ChipSizes[ESDTS.BroadcastSizeSelection]) Industrial Sand")
//                    .font(.caption)
//                Spacer()
//                Text("\(quantBroadcast(product: BroadcastESDTS) + ESDTS.BroadcastWaste)")
//                    .font(.caption)
//            }
//        }
//        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//        .cornerRadius(5.0)
//        .padding()
        Text("Broadcast")
            .bold()
        VStack {
            
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
                HStack {
                    Text("Contact Distributor")
                        .font(.caption)
                    Spacer()
                    Text("Kretus® Approved #30/F-Grade Industrial Sand/Quartz")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastESDSL) + ESDSL.BroadcastWaste)")
                        .font(.caption)
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()

        }
        Text("Conductive Primer Coat")
            .bold()
        
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
            
            HStack{
                Text("EX-KWBECPA-01")
                    .font(.caption)
                Spacer()
                Text("WB Conductive Primer Part A, 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PrimerA_RC))")
                    .font(.caption)
            }
            
            HStack{
                Text("EX-KWBEB-EA")
                    .font(.caption)
                Spacer()
                Text("WB Epoxy Part B, 1 qt")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: PrimerB_RC))")
                    .font(.caption)
            }
            
            
            //                if ESDSL.PCoatTSColorant != 0
            //                {
            //                    HStack {
            //                        Text("\(TSColorantCodes[ESDSL.BCoatTSColorant])")
            //                            .font(.caption)
            //                        Spacer()
            //                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ESDSL.PCoatTSColorant]), 16 oz")
            //                            .font(.caption)
            //                        Spacer()
            //                        Text("\(quant(product: TSColorant_ESDSL))")
            //                            .font(.caption)
            //                    }
            //                }
            
            
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Top Coat")
            .bold()
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
            if ESDTS.Coat4ProductType == 0
            {
                
                if ESDTS.Coat4PtA == 4 {
                    HStack{
                        Text("\(typesACodes[ESDTS.Coat4PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[ESDTS.Coat4PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[ESDTS.Coat4PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                            .font(.caption)
                    }
                }
                HStack{
                    Text("\(TCtypesBCodes[ESDTS.Coat4PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(TCtypesB[ESDTS.Coat4PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
                if ESDTS.Coat4TSColorant != 0 {
                    
                    HStack {
                        Text("\(TSColorantCodes[ESDTS.Coat4TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ESDTS.Coat4TSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ESDTS_TSColorantC4) + ESDTS.Coat4Waste)")
                            .font(.caption)
                    }
                    
                }
                HStack {
                    Text("EX-KESDADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("ESD Additive, 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
                
                HStack {
                    Text("N/A")
                        .font(.caption)
                    Spacer()
                    Text("50/50 Bead 50 and Bead 100 Blend, 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
            }
            else if ESDTS.Coat4ProductType == 1
            {
                HStack
                {
                    Text("\(PACodes[ESDTS.Coat4PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Polyaspartic 92 Part A - \(hardeners[ESDTS.Coat4PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("EX-KPLY92B-01")
                        .font(.caption)
                    Spacer()
                    Text("Polyaspartic 92  Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack {
                    Text("EX-KESDADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("ESD Additive, 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
                
                HStack {
                    Text("N/A")
                        .font(.caption)
                    Spacer()
                    Text("50/50 Bead 50 and Bead 100 Blend, 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
            }
            // polyurethane is chosen
            else if ESDTS.Coat4ProductType == 2
            {
                
                HStack
                {
                    Text("EX-KPLYHPGA-EA")
                        .font(.caption)
                    Spacer()
                    
                    Text("Polyurethane HP Gloss Part A, 1 qt")
                        .font(.caption)
                    Spacer()
                    
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
                
                HStack
                {
                    Text("EX-KPLYHPB-01")
                        .font(.caption)
                    Spacer()
                    
                    Text("Polyurethane HP Gloss Part B, 1 gal")
                        .font(.caption)
                    Spacer()
                    
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
                
                HStack
                {
                    Text("EX-KSLVCLN-EA")
                        .font(.caption)
                    Spacer()
                    
                    Text("Solvent Cleaner, 1 qt")
                        .font(.caption)
                    Spacer()
                    
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
                
                HStack {
                    Text("EX-KESDADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("ESD Additive, 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
                
                HStack {
                    Text("N/A")
                        .font(.caption)
                    Spacer()
                    Text("50/50 Bead 50 and Bead 100 Blend, 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                }
                
                
            }
            
            
            // poly colorant
            if ESDTS.Coat4PColorant != 0 && ESDTS.Coat4ProductType != 0
            {
                HStack
                {
                    Text("\(PolyColorantCodes[ESDTS.Coat4PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[ESDTS.Coat4PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: ESDTS_TSColorantC4) + ESDTS.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            
            //                    if ESDTS.Coat4MatAdd == true
            //                    {
            //                        HStack
            //                        {
            //                            Text("EX-KMATADD-EA")
            //                                .font(.caption)
            //                            Spacer()
            //                            Text("Matting Additive, 1# ")
            //                                .font(.caption)
            //                            Spacer()
            //                            Text("\(quant(product: ESDTS_TSAC4))")
            //                                .font(.caption)
            //                        }
            //                    }
            
            
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
    }


struct ESDSLSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        EpoxyCoveColorSysSummary()
    }
}
}
