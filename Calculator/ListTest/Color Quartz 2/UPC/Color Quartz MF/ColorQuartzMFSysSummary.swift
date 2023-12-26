//
//  EpoxyCoveColorSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 7/4/22.
//

import SwiftUI

struct ColorQuartzMFSysSummary: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ChipTS : ColorChipValuesTS //Used for coat selections
    @EnvironmentObject var QuartzMF : ColorQuartzRCValues //Used for coat selections
    @EnvironmentObject var QuartzRC : ColorQuartzRCValues //Used for coat selections

    @EnvironmentObject var SandRC : ColorQuartzTSValues //Used for coat selections

    @EnvironmentObject var CoveColorQuartz : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatCoveQuartzMFA : stats2
    @EnvironmentObject var bCoatCoveQuartzMFB : stats2
    @EnvironmentObject var bCoatCoveQuartzMFColorant : stats2
    @EnvironmentObject var bCoatCoveQuartzTexture : stats2
    
    @EnvironmentObject var UPC_QuartzMF : stats //Used for system stats (mixRat,CovRate, etc)

    
    var BroadcastQuartzMF = statsBroadcast(product: "Color Quartz", covRate: 1, MixRat: 50)
    var TSMvr = stats(product: "Epoxy MVR", covRate: 150, MixRat: 1)

    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Ench. Green", "A Resin - Handic. Blue", "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red", "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA",  "EX-KTSETHB-EA"]
    
    let upcBCodes = ["EX-KUPCSLB8-EA", "EX-KUPCSLZ8-EA", "EX-KUPCSLF8-EA"]
    
    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    let TSColorantChoices = ["","Beige", "Black", "Dark Gray", "Ench. Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = [ "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    var QuartzSizes = ["1/4\"", "1/8\""]
    
    var QuartzChoices = ["Anaheim Gray", "Antler", "Avery", "Bow Tie", "Charcoal", "Coyote", "Domino", "Fog Gray", "Granite", "Gravel", "Keaton", "Lasorda Blue", "Lighthouse", "Monterey Spice", "Onyx Pearl", "Orbit", "Outback", "Pintail", "Saddle Tan", "Shorline", "Sienna", "Smoke", "Swan", "Terrier" , "Thistle", "Twilight"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose"]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA", "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA", "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA", "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01",]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PATypes = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    
    let PUTypes = ["Polyurethane HS"]
    let PUTypesTC = ["Polyurethane HS", "Polyurethane HP Clear Gloss", "Polyurethane HP Clear Satin"]

    
    let hardeners = ["EZ - Clear", "Fast - Clear"]

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
        
        if Chip.isPrimeCoat
        {
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
                Text("EX-KUPCASL8-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - SL/MF, 8#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPC_QuartzMF) + QuartzMF.PCoatWaste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(upcBCodes[QuartzMF.PCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("UPC Part B - SL/MF \(typesB[QuartzMF.PCoatPtB]), 8#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPC_QuartzMF) + QuartzMF.PCoatWaste)")
                    .font(.caption)
            }
            HStack{
                Text("EX-KUPCMFC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - MF, 40#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPC_QuartzMF) + QuartzMF.PCoatWaste)")
                    .font(.caption)
            }
            
            if QuartzMF.PCoatTSColorant != 0
            {
                HStack {
                    Text("\(TSColorantCodes[QuartzMF.BCoatTSColorant])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant:  \(TSColorantChoices[QuartzMF.BCoatTSColorant]), 4 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPC_QuartzMF))")
                        .font(.caption)
                }
            }

        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        }
        
        if Chip.isMVR
        {
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
                    Text("EX-KUPCARC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - RC/TT, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr) + SandRC.MVRWaste)")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-BRCUVAP6-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC UV AP, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr) + SandRC.MVRWaste)")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr) + SandRC.MVRWaste)")
                        .font(.caption)
                }
                
                if SandRC.MVRPtA != 0
                {
                    HStack{
                        Text("\(UPCColorantCodes[SandRC.MVRPtA])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant - \(UPCColorantChoices[SandRC.MVRPtA]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSMvr) + SandRC.MVRWaste)")
                            .font(.caption)
                    }
                }
            }
            
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
        Text("Base Coat")
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
                Text("EX-KUPCASL8-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part A - SL/MF, 8#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPC_QuartzMF) + QuartzMF.BCoatWaste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(upcBCodes[QuartzMF.BCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("UPC Part B - SL/MF \(typesB[QuartzMF.BCoatPtB]), 8#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPC_QuartzMF) + QuartzMF.BCoatWaste)")
                    .font(.caption)
            }
            
            HStack{
                Text("EX-KUPCMFC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - MF, 40#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: UPC_QuartzMF) + QuartzMF.BCoatWaste)")
                    .font(.caption)
            }
            
            if QuartzMF.BCoatTSColorant != 0
            {
                HStack {
                    Text("\(TSColorantCodes[QuartzMF.BCoatTSColorant])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant:  \(TSColorantChoices[QuartzMF.BCoatTSColorant]), 4 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: UPC_QuartzMF) + QuartzMF.BCoatWaste)")
                        .font(.caption)
                }
            }

        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Broadcast")
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
            HStack {
                Text("Contact Distributor")
                    .font(.caption)
                Spacer()
                Text("Color Chip \(ChipSizes[QuartzMF.BroadcastSizeSelection]) - see Kretus color chart, 50#")
                    .font(.caption)
                Spacer()
                Text("\(quantBroadcast(product: BroadcastQuartzMF) + QuartzMF.BroadcastWaste)")
                    .font(.caption)
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Cap Coat")
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
            if QuartzRC.Coat3ProductType == 0
            {
                if QuartzRC.Coat3PtA == 4 {
                    HStack{
                        Text("\(typesACodes[QuartzRC.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC3) + QuartzRC.Coat3Waste)")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[QuartzRC.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[QuartzRC.Coat3PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC3) + QuartzRC.Coat3Waste)")
                            .font(.caption)
                    }
                }
                HStack{
                    Text("\(typesBCodes[QuartzRC.Coat3PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[QuartzRC.Coat3PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSBC3) + QuartzRC.Coat3Waste)")
                        .font(.caption)
                }
                if QuartzRC.Coat3TSColorant != 0 {
                    
                    HStack {
                        Text("\(TSColorantCodes[QuartzRC.Coat3TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[QuartzRC.Coat3TSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSColorantC3) + QuartzRC.Coat3Waste)")
                            .font(.caption)
                    }
                    
                }
            }
            
            else if QuartzRC.Coat3ProductType == 1
            {
                HStack
                {
                    Text("\(QuartzRC.Coat3PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[QuartzRC.Coat3PtA]) - \(hardeners[QuartzRC.Coat3PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzRC.Coat3Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(QuartzRC.Coat3PtBCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[QuartzRC.Coat3PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzRC.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else
            {
                HStack
                {
                    Text("\(QuartzRC.Coat3PtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if QuartzRC.Coat3PtA == 0
                    {
                        Text("\(PUTypes[QuartzRC.Coat3PtA]) - \(hardeners[QuartzRC.Coat3PtB]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // Poly HP Gloss
                    else if QuartzRC.Coat3PtA == 1
                    {
                        Text("\(PUTypes[QuartzRC.Coat3PtA]) Part A, 1/4 gal ")
                            .font(.caption)
                    }
                    // Poly HP Satin
                    else
                    {
                        Text("\(PUTypes[QuartzRC.Coat3PtA]) Part A, 1/2 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzRC.Coat3Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(QuartzRC.Coat3PtBCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if QuartzRC.Coat3PtA == 0
                    {
                        Text("\(PUTypes[QuartzRC.Coat3PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[QuartzRC.Coat3PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzRC.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            // poly colorant
            if QuartzRC.Coat3PColorant != 0 && QuartzRC.Coat3ProductType != 0
            {
                HStack
                {
                    Text("\(PolyColorantCodes[QuartzRC.Coat3PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[QuartzRC.Coat3PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSColorantC3) + QuartzRC.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            
            if QuartzRC.Coat3MatAdd == true
            {
                HStack
                {
                    Text("EX-KMATADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("Matting Additive, 1# ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzRC.Coat3Waste)")
                        .font(.caption)
                }
            }
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
            if QuartzRC.Coat4ProductType == 0
            {
                if QuartzRC.Coat4PtA == 4 {
                    HStack{
                        Text("\(typesACodes[QuartzRC.Coat4PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: QuartzRC_TSAC4) + QuartzRC.Coat4Waste)")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[QuartzRC.Coat4PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[QuartzRC.Coat4PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: QuartzRC_TSAC4) + QuartzRC.Coat4Waste)")
                            .font(.caption)
                    }
                }
                HStack
                {
                    Text("\(typesBCodes[QuartzRC.Coat4PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[QuartzRC.Coat4PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzRC_TSBC4) + QuartzRC.Coat4Waste)")
                        .font(.caption)
                }
                if QuartzRC.Coat4TSColorant != 0
                {
                    
                    HStack {
                        Text("\(TSColorantCodes[QuartzRC.Coat4TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[QuartzRC.Coat4TSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: QuartzRC_TSColorantC4) + QuartzRC.Coat4Waste)")
                            .font(.caption)
                    }
                    
                }
            }
            else if QuartzRC.Coat4ProductType == 1
            {
                HStack
                {
                    Text("\(QuartzRC.Coat4PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[QuartzRC.Coat4PtA]) - \(hardeners[QuartzRC.Coat4PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzRC_TSAC4) + QuartzRC.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(QuartzRC.Coat4PtBCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[QuartzRC.Coat4PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzRC_TSAC4) + QuartzRC.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else if QuartzRC.Coat4ProductType == 2
            {
                
                HStack
                {
                    Text("\(QuartzRC.Coat4PtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if QuartzRC.Coat4PtA == 0
                    {
                        Text("\(PUTypesTC[QuartzRC.Coat4PtA]) - \(hardeners[QuartzRC.Coat4PtB]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // Poly HP Gloss
                    else if QuartzRC.Coat4PtA == 1
                    {
                        Text("\(PUTypesTC[QuartzRC.Coat4PtA]) Part A, 1/4 gal ")
                            .font(.caption)
                    }
                    // Poly HP Satin
                    else
                    {
                        Text("\(PUTypesTC[QuartzRC.Coat4PtA]) Part A, 1/2 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: QuartzRC_TSAC4) + QuartzRC.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(QuartzRC.Coat4PtBCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if QuartzRC.Coat4PtA == 0
                    {
                        Text("\(PUTypesTC[QuartzRC.Coat4PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypesTC[QuartzRC.Coat4PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: QuartzRC_TSAC4) + QuartzRC.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            // poly colorant
            if QuartzRC.Coat4PColorant != 0 && QuartzRC.Coat4ProductType != 0
            {
                HStack
                {
                    Text("\(PolyColorantCodes[QuartzRC.Coat4PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[QuartzRC.Coat4PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzRC_TSColorantC4) + QuartzRC.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            
            if QuartzRC.Coat4Texture != 0 {
                if QuartzRC.Coat4Texture < 5 {
                    HStack {
                        Text("Contact Distributor")
                            .font(.caption)
                        Spacer()
                        Text("\(TextureOptions[QuartzRC.Coat4Texture]), 10#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureAO))")
                            .font(.caption)
                    }
                }
                if QuartzRC.Coat4Texture >= 5 {
                    HStack {
                        Text("Contact Distributor")
                            .font(.caption)
                        Spacer()
                        Text("\(TextureOptions[QuartzRC.Coat4Texture]), 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureBead))")
                            .font(.caption)
                    }
                }
            }
            
            if QuartzRC.Coat4MatAdd == true
            {
                HStack
                {
                    Text("EX-KMATADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("Matting Additive, 1# ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzRC_TSAC4) + QuartzRC.Coat4Waste)")
                        .font(.caption)
                }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
    }


struct ColorQuartzMFSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        EpoxyCoveColorSysSummary()
    }
}
}
