//
//  EpoxyCoveColorSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 7/4/22.
//

import SwiftUI

struct ColorQuartzDBSysSummary: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ChipTS : ColorChipValuesTS //Used for coat selections
    @EnvironmentObject var QuartzDB : ColorQuartzDBValues //Used for coat selections
    @EnvironmentObject var QuartzTS : ColorQuartzTSValues
    @EnvironmentObject var CoveColorQuartz : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatCoveQuartzTSA : stats2
    @EnvironmentObject var bCoatCoveQuartzTSB : stats2
    @EnvironmentObject var bCoatCoveQuartzTSColorant : stats2
    @EnvironmentObject var bCoatCoveQuartzTexture : stats2
    
    @EnvironmentObject var QuartzTS_TSAC4 : stats2
    @EnvironmentObject var QuartzTS_TSBC4 : stats2
    @EnvironmentObject var QuartzTS_TSColorantC4 : stats2
    
    var BroadcastQuartzTS = statsBroadcast(product: "Color Quartz", covRate: 0.15, MixRat: 55)
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
    
    let typesB = ["AP", "EZ", "Fast", "TH"]
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA",  "EX-KTSETHB-EA"]
    
    let typesBMVR = ["MVR - EZ", "MVR - FC"]
    let typesBMVRCodes = ["EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["","Beige", "Black", "Dark Gray", "Ench. Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = [ "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    var QuartzSizes = ["1/4\"", "1/8\""]
    
    var QuartzChoices = ["Anaheim Gray", "Antler", "Avery", "Bow Tie", "Charcoal", "Coyote", "Domino", "Fog Gray", "Granite", "Gravel", "Keaton", "Lasorda Blue", "Lighthouse", "Monterey Spice", "Onyx Pearl", "Orbit", "Outback", "Pintail", "Saddle Tan", "Shorline", "Sienna", "Smoke", "Swan", "Terrier" , "Thistle", "Twilight"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
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
        
        
        if Chip.isPrimeCoat {
        
        QuartzDBPCoatSum()
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
                    Text("\(typesACodes[QuartzDB.MVRPtA])")
                        .font(.caption)
                    Spacer()
                    Text("TSE Part A: \(typesA[QuartzDB.MVRPtA]), 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr) + QuartzDB.MVRWaste)")
                        .font(.caption)
                }
                
                HStack{
                    Text("\(typesBMVRCodes[QuartzDB.MVRPtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesBMVR[QuartzDB.MVRPtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr) + QuartzDB.MVRWaste)")
                        .font(.caption)
                }
                if QuartzDB.MVRTSColorant != 0 {
                    HStack {
                        Text("\(TSColorantCodes[QuartzDB.MVRTSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[QuartzDB.MVRTSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSMvr) + QuartzDB.MVRWaste)")
                            .font(.caption)
                    }
                    
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
        
        QuartzDBBCoat1Sum()
        
        QuartzDBBroadcast1Sum()
        
        QuartzDBBCoat2Sum()
        
        QuartzDBBroadcast2Sum()

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
            if QuartzTS.Coat3ProductType == 0
            {
                if QuartzTS.Coat3PtA == 4 {
                    HStack{
                        Text("\(typesACodes[QuartzTS.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC3) + QuartzTS.Coat3Waste)")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[QuartzTS.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[QuartzTS.Coat3PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC3) + QuartzTS.Coat3Waste)")
                            .font(.caption)
                    }
                }
                HStack{
                    Text("\(typesBCodes[QuartzTS.Coat3PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[QuartzTS.Coat3PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSBC3) + QuartzTS.Coat3Waste)")
                        .font(.caption)
                }
                if QuartzTS.Coat3TSColorant != 0 {
                    
                    HStack {
                        Text("\(TSColorantCodes[QuartzTS.Coat3TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[QuartzTS.Coat3TSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSColorantC3) + QuartzTS.Coat3Waste)")
                            .font(.caption)
                    }
                    
                }
            }
            
            else if QuartzTS.Coat3ProductType == 1
            {
                HStack
                {
                    Text("\(QuartzTS.Coat3PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[QuartzTS.Coat3PtA]) - \(hardeners[QuartzTS.Coat3PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzTS.Coat3Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(QuartzTS.Coat3PtBCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[QuartzTS.Coat3PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzTS.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else
            {
                HStack
                {
                    Text("\(QuartzTS.Coat3PtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if QuartzTS.Coat3PtA == 0
                    {
                        Text("\(PUTypes[QuartzTS.Coat3PtA]) - \(hardeners[QuartzTS.Coat3PtB]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // Poly HP Gloss
                    else if QuartzTS.Coat3PtA == 1
                    {
                        Text("\(PUTypes[QuartzTS.Coat3PtA]) Part A, 1/4 gal ")
                            .font(.caption)
                    }
                    // Poly HP Satin
                    else
                    {
                        Text("\(PUTypes[QuartzTS.Coat3PtA]) Part A, 1/2 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzTS.Coat3Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(QuartzTS.Coat3PtBCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if QuartzTS.Coat3PtA == 0
                    {
                        Text("\(PUTypes[QuartzTS.Coat3PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[QuartzTS.Coat3PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzTS.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            // poly colorant
            if QuartzTS.Coat3PColorant != 0 && QuartzTS.Coat3ProductType != 0
            {
                HStack
                {
                    Text("\(PolyColorantCodes[QuartzTS.Coat3PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[QuartzTS.Coat3PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSColorantC3) + QuartzTS.Coat3Waste)")
                        .font(.caption)
                    
                }
            }
            
            if QuartzTS.Coat3MatAdd == true
            {
                HStack
                {
                    Text("EX-KMATADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("Matting Additive, 1# ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSAC3) + QuartzTS.Coat3Waste)")
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
            if QuartzTS.Coat4ProductType == 0
            {
                if QuartzTS.Coat4PtA == 4 {
                    HStack{
                        Text("\(typesACodes[QuartzTS.Coat4PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: QuartzTS_TSAC4) + QuartzTS.Coat4Waste)")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[QuartzTS.Coat4PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[QuartzTS.Coat4PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: QuartzTS_TSAC4) + QuartzTS.Coat4Waste)")
                            .font(.caption)
                    }
                }
                HStack
                {
                    Text("\(typesBCodes[QuartzTS.Coat4PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[QuartzTS.Coat4PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzTS_TSBC4) + QuartzTS.Coat4Waste)")
                        .font(.caption)
                }
                if QuartzTS.Coat4TSColorant != 0
                {
                    
                    HStack {
                        Text("\(TSColorantCodes[QuartzTS.Coat4TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[QuartzTS.Coat4TSColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: QuartzTS_TSColorantC4) + QuartzTS.Coat4Waste)")
                            .font(.caption)
                    }
                    
                }
            }
            else if QuartzTS.Coat4ProductType == 1
            {
                HStack
                {
                    Text("\(QuartzTS.Coat4PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[QuartzTS.Coat4PtA]) - \(hardeners[QuartzTS.Coat4PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzTS_TSAC4) + QuartzTS.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(QuartzTS.Coat4PtBCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[QuartzTS.Coat4PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzTS_TSAC4) + QuartzTS.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else if QuartzTS.Coat4ProductType == 2
            {
                
                HStack
                {
                    Text("\(QuartzTS.Coat4PtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if QuartzTS.Coat4PtA == 0
                    {
                        Text("\(PUTypesTC[QuartzTS.Coat4PtA]) - \(hardeners[QuartzTS.Coat4PtB]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // Poly HP Gloss
                    else if QuartzTS.Coat4PtA == 1
                    {
                        Text("\(PUTypesTC[QuartzTS.Coat4PtA]) Part A, 1/4 gal ")
                            .font(.caption)
                    }
                    // Poly HP Satin
                    else
                    {
                        Text("\(PUTypesTC[QuartzTS.Coat4PtA]) Part A, 1/2 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: QuartzTS_TSAC4) + QuartzTS.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(QuartzTS.Coat4PtBCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if QuartzTS.Coat4PtA == 0
                    {
                        Text("\(PUTypesTC[QuartzTS.Coat4PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypesTC[QuartzTS.Coat4PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: QuartzTS_TSAC4) + QuartzTS.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            // poly colorant
            if QuartzTS.Coat4PColorant != 0 && QuartzTS.Coat4ProductType != 0
            {
                HStack
                {
                    Text("\(PolyColorantCodes[QuartzTS.Coat4PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[QuartzTS.Coat4PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzTS_TSColorantC4) + QuartzTS.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            
            if QuartzTS.Coat4Texture != 0 {
                if QuartzTS.Coat4Texture < 5 {
                    HStack {
                        Text("Contact Distributor")
                            .font(.caption)
                        Spacer()
                        Text("\(TextureOptions[QuartzTS.Coat4Texture]), 10#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureAO))")
                            .font(.caption)
                    }
                }
                if QuartzTS.Coat4Texture >= 5 {
                    HStack {
                        Text("Contact Distributor")
                            .font(.caption)
                        Spacer()
                        Text("\(TextureOptions[QuartzTS.Coat4Texture]), 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: ChipTextureBead))")
                            .font(.caption)
                    }
                }
            }
            
            if QuartzTS.Coat4MatAdd == true
            {
                HStack
                {
                    Text("EX-KMATADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("Matting Additive, 1# ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: QuartzTS_TSAC4) + QuartzTS.Coat4Waste)")
                        .font(.caption)
                }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        
    }


struct ColorQuartzDBSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        EpoxyCoveColorSysSummary()
    }
}
}
