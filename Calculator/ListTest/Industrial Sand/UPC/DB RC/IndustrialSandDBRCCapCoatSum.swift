//
//  SplashFloorTSCoat3.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI


struct IndustrialSandDBRCCapCoatSum: View {
    
  
    let products = ["Top Shelf Epoxy®", "Polyaspartic", "Polyurethane", "UPC"]
    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray",
                  "A Resin - Enchanted Green", "A Resin - Handicap Blue","A Resin - Latte",
                  "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha",
                  "A Resin - Safety Blue", "A Resin - Safety Red", "A Resin - Safety Yellow",
                  "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White",
                  "CR Resin - Clear", "LG Resin - Clear"]
    
    let UPCTypes = [ "UPC RC UV", "UPC RC" ]

    
    let PATypes = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    
    let PUTypes = ["Polyurethane HS"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01",
                       "EX-KTSARHB-01", "EX-KTSARLT-01","EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01",
                       "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01", "EX-KTSARTN-01",
                       "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01", "Contact Distributor"]
    
    let typesB = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green",
                             "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red",
                             "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA",
                           "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA",
                           "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA",
                           "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    let TextureOptions = ["No Texture", "Anti-Slip Aluminum Oxide 120 grit", "Anti-Slip Aluminum Oxide 220 grit",
                          "Anti-Slip Bead 100", "Anti-Slip Bead 50", "Anti-Slip Tex 50"]
    
    let textureCodes = ["", "EX-KASAO120-01", "EX-KASAOX220-EA", "EX-KASB100-EA", "EX-KASB50-EA", "EX-KAST50-EA"]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green",
                               "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red",
                               "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA",
                             "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA",
                             "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA",
                             "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01",]
    
    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA",
                            "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    @EnvironmentObject var SandRC : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var BroadcastQuartzTS : statsBroadcast

    @State var PCoatPtACode = "EX-KPLY72AZ-01"
    @State var PCoatHardenerCode = "EX-KPLY72B-01"
    @State var PUPtACode = "EX-KPLY72AZ-01"
    @State var PUHardenerCode = "EX-KPLY72B-01"

    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required

    
    var body: some View {
        VStack {
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
        }
            }
            

        }
    



struct IndustrialSandDBRCCoat3Sum_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat3()
    }
}
