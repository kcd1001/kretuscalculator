//
//  EpoxyCoveColorSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 7/4/22.
//

import SwiftUI

struct IndustrialSandRCSysSummary: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ChipTS : ColorChipValuesTS //Used for coat selections
    @EnvironmentObject var SandRC : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var CoveColorQuartz : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatCoveSandRCA : stats2
    @EnvironmentObject var bCoatCoveSandRCB : stats2
    @EnvironmentObject var bCoatCoveSandRCColorant : stats2
    @EnvironmentObject var bCoatCoveQuartzTexture : stats2
    
    var BroadcastSandRC = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
    var TSMvr = stats(product: "Epoxy MVR", covRate: 190, MixRat: 1)

    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Ench. Green", "A Resin - Handic. Blue", "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red", "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA",  "EX-KTSETHB-EA"]
    
    let UPCTypes = [ "UPC RC UV", "UPC RC" ]

    let upcTypesB = ["AP", "EZ", "FC"]
    let upcTypesBCodes = ["EX-KUPCRCA6-EA", "EX-KUPCRZ6-EA", "EX-KUPCRCF6-EA"]
    
    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
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
        
        if Chip.isPrimeCoat
        {
            Text("Prime Coat")
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
                    Text("UPC Part A - RC/TT, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSA_SandRC) + SandRC.PCoatWaste)")
                        .font(.caption)
                }
                
                HStack{
                    Text("\(upcTypesBCodes[SandRC.PCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC/TT \(upcTypesB[SandRC.PCoatPtB]), 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSB_SandRC) + SandRC.PCoatWaste)")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSB_SandRC) + SandRC.PCoatWaste)")
                        .font(.caption)
                }
                if SandRC.PCoatSC
                {
                    HStack{ // Solvent Cleaner
                        Text("EX-KSLVCLN-EA")
                            .font(.caption)
                        Spacer()
                        Text("Solvent Cleaner, 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSA_SandRC) + SandRC.PCoatWaste)")
                            .font(.caption)
                    }
                }
                
                
                if SandRC.PCoatTSColorant != 0
                {
                    HStack {
                        Text("\(UPCColorantCodes[SandRC.PCoatTSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant:  \(UPCColorantChoices[SandRC.PCoatTSColorant]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSColorant_SandRC) + SandRC.PCoatWaste)")
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
                Text("UPC Part A - RC/TT, 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSA_SandRC) + SandRC.BCoatWaste)")
                    .font(.caption)
            }
            
            HStack{
                Text("\(upcTypesBCodes[SandRC.BCoatPtB])")
                    .font(.caption)
                Spacer()
                Text("UPC Part B - RC/TT \(upcTypesB[SandRC.BCoatPtB]), 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSB_SandRC) + SandRC.BCoatWaste)")
                    .font(.caption)
            }
            
            HStack{
                Text("EX-KUPCRFC-EA")
                    .font(.caption)
                Spacer()
                Text("UPC Part C - RC, 6#")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: TSB_SandRC) + SandRC.BCoatWaste)")
                    .font(.caption)
            }

            if SandRC.BCoatTSColorant != 0
            {
                HStack {
                    Text("\(UPCColorantCodes[SandRC.BCoatTSColorant])")
                        .font(.caption)
                    Spacer()
                    Text("UPC Colorant:  \(UPCColorantChoices[SandRC.BCoatTSColorant]), 4 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSColorant_SandRC) + SandRC.BCoatWaste)")
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
                Text("Kretus® Approved Industrial Sand")
                    .font(.caption)
                Spacer()
                Text("\(quantBroadcast(product: BroadcastSandRC) + SandRC.BroadcastWaste)")
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
            if SandRC.Coat3ProductType == 0
            {
                
                if SandRC.Coat3PtA == 4 {
                    HStack{
                        Text("\(typesACodes[SandRC.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[SandRC.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[SandRC.Coat3PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                }
                HStack{
                    Text("\(typesBCodes[SandRC.Coat3PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[SandRC.Coat3PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                        .font(.caption)
                }
                if SandRC.Coat3TSColorant != 0 {
                    
                    HStack {
                        Text("\(TSColorantCodes[SandRC.Coat3TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SandRC.Coat3TSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSColorantC3) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                    
                }
            }
            else if SandRC.Coat3ProductType == 1
            {
                HStack
                {
                    Text("\(SandRC.Coat3PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandRC.Coat3PtA]) - \(hardeners[SandRC.Coat3PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(SandRC.Coat3PtBCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandRC.Coat3PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else if SandRC.Coat3ProductType == 2
            {
                
                HStack
                {
                    Text("\(SandRC.Coat3PtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if SandRC.Coat3PtA == 0
                    {
                        Text("\(PUTypes[SandRC.Coat3PtA]) - \(hardeners[SandRC.Coat3PtB]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // Poly HP Gloss
                    else if SandRC.Coat3PtA == 1
                    {
                        Text("\(PUTypes[SandRC.Coat3PtA]) Part A, 1/4 gal ")
                            .font(.caption)
                    }
                    // Poly HP Satin
                    else
                    {
                        Text("\(PUTypes[SandRC.Coat3PtA]) Part A, 1/2 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(SandRC.Coat3PtBCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if SandRC.Coat3PtA == 0
                    {
                        Text("\(PUTypes[SandRC.Coat3PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[SandRC.Coat3PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            // UPC is chosen
            else
            {
                // upc uv is chosen
                if SandRC.Coat3PtA == 0
                {
                    HStack
                    {
                        Text("EX-KUPCARC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part A - RC/TT, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                    
                    HStack
                    {
                        Text("EX-BRCUVAP6-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part B - RC UV AP, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC3 ) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                    HStack { // Part C
                        Text("EX-KUPCRFC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - RC, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                }
                
                // regular upc is chosen
                else
                {
                    HStack
                    {
                        Text("EX-KUPCARC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part A - RC/TT, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                    
                    HStack
                    {
                        Text("\(SandRC.Coat3PtBCode)")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part B - \(Text("\(typesB[SandRC.Coat3PtB])") ), 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC3 ) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                    HStack { // Part C
                        Text("EX-KUPCRFC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - RC, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                }
                // upc colorant
                if SandRC.Coat3TSColorant != 0
                {
                    HStack
                    {
                        Text("\(UPCColorantCodes[SandRC.Coat3TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant - \(UPCColorantChoices[SandRC.Coat3TSColorant]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCColorant) + SandRC.Coat3Waste)")
                            .font(.caption)
                    }
                }
                // TODO - poly accelerant
                
            }
            // poly colorant
            if SandRC.Coat3PColorant != 0 && (SandRC.Coat3ProductType != 0 || SandRC.Coat3ProductType != 3)
            {
                HStack
                {
                    Text("\(PolyColorantCodes[SandRC.Coat3PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[SandRC.Coat3PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSColorantC3) + SandRC.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            
            if SandRC.Coat3MatAdd == true
            {
                HStack
                {
                    Text("EX-KMATADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("Matting Additive, 1# ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC3) + SandRC.Coat3Waste)")
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
            
            if SandRC.Coat4ProductType == 0
            {
                HStack
                {
                    Text("\(SandRC.Coat4PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandRC.Coat4PtA]) - \(hardeners[SandRC.Coat4PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(SandRC.Coat4PtBCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandRC.Coat4PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else if SandRC.Coat4ProductType == 1
            {
                
                HStack
                {
                    Text("\(SandRC.Coat4PtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if SandRC.Coat4PtA == 0
                    {
                        Text("\(PUTypes[SandRC.Coat4PtA]) - \(hardeners[SandRC.Coat4PtB]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // Poly HP
                    else
                    {
                        if SandRC.Coat4PtB == 0
                        {
                            Text("\(PUTypes[SandRC.Coat4PtA]) Part A - \(puhpHardeners[SandRC.Coat4PtB]), 1/4 gal ")
                                .font(.caption)
                        }
                        else
                        {
                            Text("\(PUTypes[SandRC.Coat4PtA]) Part A - \(puhpHardeners[SandRC.Coat4PtB]), 1/2 gal ")
                                .font(.caption)
                        }
                    }
                    
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(SandRC.Coat4PtBCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if SandRC.Coat4PtA == 0
                    {
                        Text("\(PUTypes[SandRC.Coat4PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[SandRC.Coat4PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            // UPC is chosen
            else
            {
                // upc uv is chosen
                if SandRC.Coat4PtA == 0
                {
                    HStack
                    {
                        Text("EX-KUPCARC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part A - RC/TT, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                            .font(.caption)
                    }
                    
                    HStack
                    {
                        Text("EX-BRCUVAP6-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part B - RC UV AP, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC4 ) + SandRC.Coat4Waste)")
                            .font(.caption)
                    }
                    HStack { // Part C
                        Text("EX-KUPCRFC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - RC, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                            .font(.caption)
                    }
                }
                
                // regular upc is chosen
                else
                {
                    HStack
                    {
                        Text("EX-KUPCARC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part A - RC/TT, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                            .font(.caption)
                    }
                    
                    HStack
                    {
                        Text("\(SandRC.Coat4PtBCode)")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part B - \(Text("\(typesB[SandRC.Coat4PtB])") ), 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC4 ) + SandRC.Coat4Waste)")
                            .font(.caption)
                    }
                    HStack { // Part C
                        Text("EX-KUPCRFC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - RC, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                            .font(.caption)
                    }
                }
                // upc colorant
                if SandRC.Coat4TSColorant != 0
                {
                    HStack
                    {
                        Text("\(UPCColorantCodes[SandRC.Coat4TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant - \(UPCColorantChoices[SandRC.Coat4TSColorant]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCColorant) + SandRC.Coat4Waste)")
                            .font(.caption)
                    }
                }
                // TODO - poly accelerant
                
            }
            // poly colorant
            if SandRC.Coat4PColorant != 0 && (SandRC.Coat4ProductType != 0 || SandRC.Coat4ProductType != 3)
            {
                HStack
                {
                    Text("\(PolyColorantCodes[SandRC.Coat4PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[SandRC.Coat4PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSColorantC4) + SandRC.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            
            if SandRC.Coat4MatAdd == true
            {
                HStack
                {
                    Text("EX-KMATADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("Matting Additive, 1# ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                        .font(.caption)
                }
            }
            
            if SandRC.Coat4ProductType != 3
            {
                HStack
                {
                    Text("EX-KASB100-EA")
                        .font(.caption)
                    Spacer()
                    Text("Anti-Slip Bead 100")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                        .font(.caption)
                }
            }
            else
            {
                HStack
                {
                    Text("EX-KASB50-EA")
                        .font(.caption)
                    Spacer()
                    Text("Anti-Slip Bead 50")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandRC_TSAC4) + SandRC.Coat4Waste)")
                        .font(.caption)
                }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
    }


struct IndustrialSandRCSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        EpoxyCoveColorSysSummary()
    }
}
}
