//
//  SplashFloorTSSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 5/11/22.
//

import SwiftUI

struct SplashFloorTSSysSummary: View {
    
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
    
    let PATypes = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    
    let PUTypes = ["Polyurethane HS", "Polyurethane HP Clear Gloss", "Polyurethane HP Clear Satin"]
    
    let UPCTypes = ["RC", "SL", "MF"]
    
    let UPCHardeners = ["AP", "EZ", "FC"]
    
    let typesB = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    let TextureOptions = ["No Texture", "Anti-Slip Aluminum Oxide 120 grit", "Anti-Slip Aluminum Oxide 220 grit",  "Anti-Slip Bead 100", "Anti-Slip Bead 50", "Anti-Slip Tex 50"]
    
    let textureCodes = ["", "EX-KASAO120-01", "EX-KASAOX220-EA", "EX-KASB100-EA", "EX-KASB50-EA", "EX-KAST50-EA"]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA", "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA", "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA", "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01",]
    
    let UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    let UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    @EnvironmentObject var SplashTSFloor : ColorSplashValuesFloorTS //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @State var PCoatPtACode = "EX-KPLY72AZ-01"
    @State var PCoatHardenerCode = "EX-KPLY72B-01"
    @State var PUPtACode = "EX-KPLY72AZ-01"
    @State var PUHardenerCode = "EX-KPLY72B-01"
    @State var UPCACode = "EX-KUPCARC-EA"
    @State var UPCBCode = "EX-KUPCRCA6-EA"
    @State var UPCCode = "EX-KUPCRFC-EA"
    @State var UPCSelection = "RC/TT"


    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    func quantTexture(product : stats) -> Int {
        if SplashTSFloor.Coat3Texture > 2 && SplashTSFloor.Coat3Texture != 5
        {
            let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
            let result = Int(ceil(Float(quantity / 32)))
            
            return result
        }
        
        else if SplashTSFloor.Coat3Texture <= 2
        {
            let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
            let result = Int(ceil(Float(quantity / 10)))
            
            return result
        }
        
        else
        {
            let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
            let result = Int(ceil(Float(quantity / 44)))
            
            return result
        }
        
        
    }
    
    var body: some View {
        
        Text("Coat 1")
            .bold()
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
            if SplashTSFloor.Coat1ProductType == 0 
            {
                if SplashTSFloor.Coat1PtA == 4 {
                    HStack{
                        Text("\(typesACodes[SplashTSFloor.Coat1PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste)")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[SplashTSFloor.Coat1PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[SplashTSFloor.Coat1PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste)")
                            .font(.caption)
                    }
                }
                HStack{
                    Text("\(typesBCodes[SplashTSFloor.Coat1PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[SplashTSFloor.Coat1PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSBC1) + SplashTSFloor.Coat1Waste)")
                        .font(.caption)
                }
                if SplashTSFloor.Coat1TSColorant != 0 {
                    if SplashTSFloor.Coat1TSColorant == 1 || SplashTSFloor.Coat1TSColorant == 5 || SplashTSFloor.Coat1TSColorant == 6 || SplashTSFloor.Coat1TSColorant == 10 || SplashTSFloor.Coat1TSColorant == 11 || SplashTSFloor.Coat1TSColorant == 12 || SplashTSFloor.Coat1TSColorant == 13 || SplashTSFloor.Coat1TSColorant == 16 {
                        HStack {
                            Text("\(TSColorantCodes[SplashTSFloor.Coat1TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SplashTSFloor.Coat1TSColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantC1) + SplashTSFloor.Coat1Waste)")
                                .font(.caption)
                        }
                    }
                    else if SplashTSFloor.Coat1TSColorant == 4 {
                        HStack {
                            Text("\(TSColorantCodes[SplashTSFloor.Coat1TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  Ench. Green, 8 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantC1) + SplashTSFloor.Coat1Waste)")
                                .font(.caption)
                        }
                    }
                    else {
                        HStack {
                            Text("\(TSColorantCodes[SplashTSFloor.Coat1TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SplashTSFloor.Coat1TSColorant]), 8 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantC1) + SplashTSFloor.Coat1Waste)")
                                .font(.caption)
                        }
                    }
                }
            }
            // PA is chosen
            else if SplashTSFloor.Coat1ProductType == 1
            {
                HStack
                {
                    Text("\(PCoatPtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SplashTSFloor.Coat1PtA]) - \(hardeners[SplashTSFloor.Coat1Hardener]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(PCoatHardenerCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SplashTSFloor.Coat1PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else if SplashTSFloor.Coat1ProductType == 2
            {
                
                HStack
                {
                    Text("\(PUPtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if SplashTSFloor.Coat1PtA == 0
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat1PtA]) - \(hardeners[SplashTSFloor.Coat1Hardener]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // Poly HP Gloss
                    else if SplashTSFloor.Coat1PtA == 1
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat1PtA]) Part A, 1/4 gal ")
                            .font(.caption)
                    }
                    // Poly HP Satin
                    else
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat1PtA]) Part A, 1/2 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(PUHardenerCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if SplashTSFloor.Coat1PtA == 0
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat1PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat1PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste)")
                        .font(.caption)
                    
                }
            }
            // else, UPC is chosen 
            else
            {
                HStack
                {
                    Text("\(UPCACode)")
                        .font(.caption)
                    Spacer()
                    
                    // check if RC is chosen
                    if SplashTSFloor.Coat1PtA == 0
                    {
                        Text("UPC Part A - \(SplashTSFloor.UPCSelection), 6 #")
                            .font(.caption)
                    }
                    
                    else
                    {
                        Text("UPC Part A - \(SplashTSFloor.UPCSelection), 8 #")
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste)")
                        .font(.caption)
                }
                
                HStack
                {
                    Text("\(UPCBCode)")
                        .font(.caption)
                    Spacer()
                    
                    // check if RC is chosen
                    if SplashTSFloor.Coat1PtA == 0
                    {
                        Text("UPC Part B - \(SplashTSFloor.UPCSelection) - \(UPCHardeners[SplashTSFloor.Coat1Hardener]), 6 #")
                            .font(.caption)
                    }
                    
                    else
                    {
                        Text("UPC Part B - \(SplashTSFloor.UPCSelection) - \(UPCHardeners[SplashTSFloor.Coat1Hardener]), 8 #")
                            .font(.caption)
                    }
                    Spacer()
                    
                    Text("\(quant(product: TSBC1) + SplashTSFloor.Coat1Waste)")
                        .font(.caption)
                }
                
                HStack
                {
                    Text("\(UPCCode)")
                        .font(.caption)
                    Spacer()
                    // check if RC is chosen
                    if SplashTSFloor.Coat1PtA == 0
                    {
                        Text("UPC Part C - \(UPCTypes[SplashTSFloor.Coat1PtA]), 6 #")
                            .font(.caption)
                    }
                    
                    else if SplashTSFloor.Coat1PtA == 1
                    {
                        Text("UPC Part C - \(UPCTypes[SplashTSFloor.Coat1PtA]), 25 #")
                            .font(.caption)
                    }
                    else
                    {
                        Text("UPC Part C - \(UPCTypes[SplashTSFloor.Coat1PtA]), 40 #")
                            .font(.caption)
                    }
                    Spacer()
                    
                    Text("\(quant(product: TSBC1) + SplashTSFloor.Coat1Waste)")
                        .font(.caption)
                }
                
                // check for UPC colorant
                if SplashTSFloor.Coat1TSColorant != 0
                {
                    HStack
                    {
                        Text("\(UPCColorantCodes[SplashTSFloor.Coat1TSColorant])")
                            .font(.caption)
                        Spacer()
                        
                        Text("UPC Colorant - \(UPCColorantChoices[SplashTSFloor.Coat1TSColorant]), 4 oz")
                            .font(.caption)
                        Spacer()
                        
                        Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste)")
                            .font(.caption)
                    }
                }
            }
            
            if SplashTSFloor.Coat1SolventCleaner == true
            {
                HStack
                {
                    Text("EX-KSLVCLN-EA")
                        .font(.caption)
                    Spacer()
                    Text("Solvent Cleaner, 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste)")
                        .font(.caption)
                }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Coat 2")
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
            if SplashTSFloor.Coat2ProductType == 0
            {
                if SplashTSFloor.Coat2PtA == 4 {
                    HStack{
                        Text("\(typesACodes[SplashTSFloor.Coat2PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC2) + SplashTSFloor.Coat2Waste)")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[SplashTSFloor.Coat2PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[SplashTSFloor.Coat2PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC2) + SplashTSFloor.Coat2Waste)")
                            .font(.caption)
                    }
                }
                HStack{
                    Text("\(typesBCodes[SplashTSFloor.Coat2PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[SplashTSFloor.Coat2PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSBC2) + SplashTSFloor.Coat2Waste)")
                        .font(.caption)
                }
                if SplashTSFloor.Coat2TSColorant != 0 {
                    if SplashTSFloor.Coat2TSColorant == 1 || SplashTSFloor.Coat2TSColorant == 5 || SplashTSFloor.Coat2TSColorant == 6 || SplashTSFloor.Coat2TSColorant == 10 || SplashTSFloor.Coat2TSColorant == 11 || SplashTSFloor.Coat2TSColorant == 12 || SplashTSFloor.Coat2TSColorant == 13 || SplashTSFloor.Coat2TSColorant == 16 {
                        HStack {
                            Text("\(TSColorantCodes[SplashTSFloor.Coat2TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SplashTSFloor.Coat2TSColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantC2) + SplashTSFloor.Coat2Waste)")
                                .font(.caption)
                        }
                    }
                    else if SplashTSFloor.Coat2TSColorant == 4 {
                        HStack {
                            Text("\(TSColorantCodes[SplashTSFloor.Coat2TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  Ench. Green, 8 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantC2) + SplashTSFloor.Coat2Waste)")
                                .font(.caption)
                        }
                    }
                    else {
                        HStack {
                            Text("\(TSColorantCodes[SplashTSFloor.Coat2TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SplashTSFloor.Coat2TSColorant]), 8 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantC2) + SplashTSFloor.Coat2Waste)")
                                .font(.caption)
                        }
                    }
                }
            }
            else if SplashTSFloor.Coat2ProductType == 1
            {
                HStack
                {
                    Text("\(SplashTSFloor.Coat2PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SplashTSFloor.Coat2PtA]) - \(hardeners[SplashTSFloor.Coat2PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC2) + SplashTSFloor.Coat2Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(SplashTSFloor.Coat2PtBCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SplashTSFloor.Coat2PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC2) + SplashTSFloor.Coat2Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else
            {
                
                HStack
                {
                    Text("\(SplashTSFloor.Coat2PtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if SplashTSFloor.Coat2PtA == 0
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat2PtA]) - \(hardeners[SplashTSFloor.Coat2PtB]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // Poly HP Gloss
                    else if SplashTSFloor.Coat2PtA == 1
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat2PtA]) Part A, 1/4 gal ")
                            .font(.caption)
                    }
                    // Poly HP Satin
                    else
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat2PtA]) Part A, 1/2 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC2) + SplashTSFloor.Coat2Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(SplashTSFloor.Coat2PtBCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if SplashTSFloor.Coat2PtA == 0
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat2PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat2PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC2) + SplashTSFloor.Coat2Waste)")
                        .font(.caption)
                    
                }
            }
            
            // poly colorant
            if SplashTSFloor.Coat2PColorant != 0 && SplashTSFloor.Coat2ProductType != 0
            {
                HStack
                {
                    Text("\(PolyColorantCodes[SplashTSFloor.Coat2PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[SplashTSFloor.Coat2PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSColorantC2) + SplashTSFloor.Coat2Waste)")
                        .font(.caption)
                    
                }
            }
            
            if SplashTSFloor.Coat2Texture != 0
            {
                // bead is chosen
                if SplashTSFloor.Coat2Texture > 2 && SplashTSFloor.Coat2Texture != 5
                {
                    HStack
                    {
                        Text("\(textureCodes[SplashTSFloor.Coat2Texture])")
                            .font(.caption)
                        Spacer()
                        // texture
                        Text("\(TextureOptions[SplashTSFloor.Coat2Texture]), 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quantTexture(product: TSTextureC2) + SplashTSFloor.Coat2Waste)")
                            .font(.caption)
                        
                    }
                }
                // aluminum oxide
                else if SplashTSFloor.Coat2Texture <= 2
                {
                    HStack
                    {
                        Text("\(textureCodes[SplashTSFloor.Coat2Texture])")
                            .font(.caption)
                        Spacer()
                        // texture
                        Text("\(TextureOptions[SplashTSFloor.Coat2Texture]), 10#")
                            .font(.caption)
                        Spacer()
                        Text("\(quantTexture(product: TSTextureC2) + SplashTSFloor.Coat2Waste)")
                            .font(.caption)
                        
                    }
                }
                else
                {
                    HStack
                    {
                        Text("\(textureCodes[SplashTSFloor.Coat2Texture])")
                            .font(.caption)
                        Spacer()
                        // texture
                        Text("\(TextureOptions[SplashTSFloor.Coat2Texture]), 2.75#")
                            .font(.caption)
                        Spacer()
                        Text("\(quantTexture(product: TSTextureC2) + SplashTSFloor.Coat2Waste)")
                            .font(.caption)
                        
                    }
                }
            }
            // check for matting additive
            if SplashTSFloor.Coat2MatAdd == true
            {
                HStack
                {
                    Text("EX-KMATADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("Matting Additive, 1# ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC2) + SplashTSFloor.Coat2Waste)")
                        .font(.caption)
                }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Coat 3")
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
            if SplashTSFloor.Coat3ProductType == 0
            {
                if SplashTSFloor.Coat3PtA == 4 {
                    HStack{
                        Text("\(typesACodes[SplashTSFloor.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC3) + SplashTSFloor.Coat3Waste)")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[SplashTSFloor.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[SplashTSFloor.Coat3PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC3) + SplashTSFloor.Coat3Waste)")
                            .font(.caption)
                    }
                }
                HStack{
                    Text("\(typesBCodes[SplashTSFloor.Coat3PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[SplashTSFloor.Coat3PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSBC3) + SplashTSFloor.Coat3Waste)")
                        .font(.caption)
                }
                if SplashTSFloor.Coat3TSColorant != 0 {
                    if SplashTSFloor.Coat3TSColorant == 1 || SplashTSFloor.Coat3TSColorant == 5 || SplashTSFloor.Coat3TSColorant == 6 || SplashTSFloor.Coat3TSColorant == 10 || SplashTSFloor.Coat3TSColorant == 11 || SplashTSFloor.Coat3TSColorant == 12 || SplashTSFloor.Coat3TSColorant == 13 || SplashTSFloor.Coat3TSColorant == 16 {
                        HStack {
                            Text("\(TSColorantCodes[SplashTSFloor.Coat3TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SplashTSFloor.Coat3TSColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantC3) + SplashTSFloor.Coat3Waste)")
                                .font(.caption)
                        }
                    }
                    else if SplashTSFloor.Coat3TSColorant == 4 {
                        HStack {
                            Text("\(TSColorantCodes[SplashTSFloor.Coat3TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Colorant:  Ench. Green, 8 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantC3) + SplashTSFloor.Coat3Waste)")
                                .font(.caption)
                        }
                    }
                    else {
                        HStack {
                            Text("\(TSColorantCodes[SplashTSFloor.Coat3TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SplashTSFloor.Coat3TSColorant]), 8 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSColorantC3) + SplashTSFloor.Coat3Waste)")
                                .font(.caption)
                        }
                    }
                }
            }
            else if SplashTSFloor.Coat3ProductType == 1
            {
                HStack
                {
                    Text("\(SplashTSFloor.Coat3PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SplashTSFloor.Coat3PtA]) - \(hardeners[SplashTSFloor.Coat3PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC3) + SplashTSFloor.Coat3Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(SplashTSFloor.Coat3PtBCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SplashTSFloor.Coat3PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC3) + SplashTSFloor.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else
            {
                
                HStack
                {
                    Text("\(SplashTSFloor.Coat3PtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if SplashTSFloor.Coat3PtA == 0
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat3PtA]) - \(hardeners[SplashTSFloor.Coat3PtB]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // Poly HP Gloss
                    else if SplashTSFloor.Coat3PtA == 1
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat3PtA]) Part A, 1/4 gal ")
                            .font(.caption)
                    }
                    // Poly HP Satin
                    else
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat3PtA]) Part A, 1/2 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC3) + SplashTSFloor.Coat3Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(SplashTSFloor.Coat3PtBCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if SplashTSFloor.Coat3PtA == 0
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat3PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[SplashTSFloor.Coat3PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC3) + SplashTSFloor.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            // poly colorant
            if SplashTSFloor.Coat3PColorant != 0 && SplashTSFloor.Coat3ProductType != 0
            {
                HStack
                {
                    Text("\(PolyColorantCodes[SplashTSFloor.Coat3PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[SplashTSFloor.Coat3PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSColorantC3) + SplashTSFloor.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            if SplashTSFloor.Coat3Texture != 0
            {
                // bead is chosen
                if SplashTSFloor.Coat3Texture > 2 && SplashTSFloor.Coat3Texture != 5
                {
                    HStack
                    {
                        Text("\(textureCodes[SplashTSFloor.Coat3Texture])")
                            .font(.caption)
                        Spacer()
                        // texture
                        Text("\(TextureOptions[SplashTSFloor.Coat3Texture]), 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quantTexture(product: TSTextureC3) + SplashTSFloor.Coat3Waste)")
                            .font(.caption)
                        
                    }
                }
                // aluminum oxide
                else if SplashTSFloor.Coat3Texture <= 2
                {
                    HStack
                    {
                        Text("\(textureCodes[SplashTSFloor.Coat3Texture])")
                            .font(.caption)
                        Spacer()
                        // texture
                        Text("\(TextureOptions[SplashTSFloor.Coat3Texture]), 10#")
                            .font(.caption)
                        Spacer()
                        Text("\(quantTexture(product: TSTextureC3) + SplashTSFloor.Coat3Waste)")
                            .font(.caption)
                        
                    }
                }
                else
                {
                    HStack
                    {
                        Text("\(textureCodes[SplashTSFloor.Coat3Texture])")
                            .font(.caption)
                        Spacer()
                        // texture
                        Text("\(TextureOptions[SplashTSFloor.Coat3Texture]), 2.75#")
                            .font(.caption)
                        Spacer()
                        Text("\(quantTexture(product: TSTextureC3) + SplashTSFloor.Coat3Waste)")
                            .font(.caption)
                        
                    }
                }
            }
            // check for matting additive
            if SplashTSFloor.Coat3MatAdd == true
            {
                HStack
                {
                    Text("EX-KMATADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("Matting Additive, 1# ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC3) + SplashTSFloor.Coat3Waste)")
                        .font(.caption)
                }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
    } // view ending
}

struct SplashFloorTSSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSSysSummary()
    }
}

