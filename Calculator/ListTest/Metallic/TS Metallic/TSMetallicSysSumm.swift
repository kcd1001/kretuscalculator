//
//  TSMetallicSysSumm.swift
//  Calculator
//
//  Created by Kane Davidson on 1/30/23.
//

import SwiftUI

struct TSMetallicSysSumm: View {
    
    let typesA = [ "EZ - Clear", "FC - Clear" ]
    
    let typesACodes = ["EX-KPLYHSAZ-01", "EX-KPLYHSAF-01"]
    
    let typesB = ["AP", "EZ", "Fast", "MVR-EZ", "MVR-FC", "TH"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let puhpHardeners = ["HP Gloss", "HP Satin"]
    
    let PATypes = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    
    let PUTypes = ["Polyurethane HS", "Polyurethane HP", ""]
    
    
    let pigmentChoices = ["Antique Silver", "Black", "Cabernet", "California Gold", "Carbon", "Cherrywood", "Dark Blue", "Dark Gray", "Forest Green", "Gold Glitter", "Ivory", "Jade Green", "New Copper", "Olive", "Sedona", "Silver Glitter", "Sky Blue", "Sterling", "Sunset Gold", "Violet"]
    
    let pigmentCodes = [ "EX-KMETASL-EA", "EX-KMETABL-EA", "EX-KMETACB-EA", "EX-KMETACG-EA", "EX-KMETACN-EA", "EX-KMETACW-EA", "EX-KMETADB-EA", "EX-KMETADG-EA", "EX-KMETAFG-EA", "EX-KMETGG-EA", "EX-KMETAIV-EA", "EX-KMETAJG-EA", "EX-KMETANC-EA", "EX-KMETAOL-EA", "EX-KMETASD-EA", "EX-KMETASG-EA", "EX-KMETASB-EA", "EX-KMETAST-EA", "EX-KMETASN-EA", "EX-KMETAVL-EA" ]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green",
                               "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red",
                               "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA",
                             "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA",
                             "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA",
                             "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01",]
    
    let TextureOptions = ["No Texture", "Anti-Slip Tex 50", "Anti-Slip Glass 70", "Anti-Slip Aluminum Oxide 120 grit", "Anti-Slip Aluminum Oxide 220 grit",
                          "Anti-Slip Bead 100", "Anti-Slip Bead 50" ]
    
    let textureCodes = ["", "EX-KAST50-EA", "EX-KASG70-EA", "EX-KASAO120-01", "EX-KASAOX220-EA", "EX-KASB100-EA", "EX-KASB50-EA"]
    
    @State var PCoatPtACode = "EX-KPLY72AZ-01"
    @State var PCoatHardenerCode = "EX-KPLY72B-01"
    @State var PUPtACode = "EX-KPLY72AZ-01"
    @State var PUHardenerCode = "EX-KPLY72B-01"
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    func quantTexture(product : stats) -> Int {
        
        
        if tsMetallic.Coat4Texture > 2 && tsMetallic.Coat4Texture != 5
        {
            let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
            let result = Int(ceil(Float(quantity / 32)))
            
            return result
        }
        
        else if tsMetallic.Coat4Texture <= 2
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
        
        
    } // returns number of kits required

    
    @EnvironmentObject var tsMetallic : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatMetallicTSA : stats2
    @EnvironmentObject var bCoatMetallicTSB : stats2
    @EnvironmentObject var bCoatMetallicPigment : stats2

    
    var body: some View {
        
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
                Text("EX-KTSECVRC-01")
                    .font(.caption)
                Spacer()
                Text("TSE Part A - Clear, 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: metallicTSA))")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[tsMetallic.Coat1PtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[tsMetallic.Coat1PtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: metallicTSB))")
                    .font(.caption)
            }
            
            if tsMetallic.Coat1TSColorant != 0
            {
                HStack {
                    Text("\(pigmentCodes[tsMetallic.Coat1TSColorant])")
                        .font(.caption)
                    Spacer()
                    Text("Metallic Pigment:  see Kretus Color Chart, 8 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: metallicPigment))")
                        .font(.caption)
                }
            }
            
            if tsMetallic.Coat1SolventCleaner == true
            {
                HStack
                {
                    Text("EX-KSLVCLN-EA")
                        .font(.caption)
                    Spacer()
                    Text("Solvent Cleaner, 32 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: metallicTSA))")
                        .font(.caption)
                }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        Text("Body Coat")
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
                Text("EX-KTSECVRC-01")
                    .font(.caption)
                Spacer()
                Text("TSE Part A - Clear, 1 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatMetallicTSA))")
                    .font(.caption)
            }
            
            HStack{
                Text("\(typesBCodes[tsMetallic.Coat2PtB])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf® Epoxy Part B: \(typesB[tsMetallic.Coat2PtB]), 1/2 gal")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatMetallicTSB))")
                    .font(.caption)
            }
            
            HStack {
/*
                Text("\(pigmentCodes[tsMetallic.Coat2TSColorant])")
                    .font(.caption)
*/
                Spacer()
                Text("Metallic Pigment: see Kretus Color Chart, 8 oz")
                    .font(.caption)
                Spacer()
                Text("\(quant(product: bCoatMetallicPigment))")
                    .font(.caption)
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
            if tsMetallic.Coat4ProductType == 0
            {
                HStack{
                    Text("EX-KTSARCL-01")
                        .font(.caption)
                    Spacer()
                    Text("TSE Part A: Clear 1 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: cCoatmetallicTSA) + tsMetallic.Coat4Waste)")
                        .font(.caption)
                }
                
                HStack{
                    Text("\(typesBCodes[tsMetallic.Coat4PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[tsMetallic.Coat4PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: cCoatmetallicTSB) + tsMetallic.Coat4Waste)")
                        .font(.caption)
                }
                
            }
            else if tsMetallic.Coat4ProductType == 1
            {
                HStack
                {
                    Text("\(tsMetallic.Coat4PtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[tsMetallic.Coat4PtA]) - \(hardeners[tsMetallic.Coat4PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product:cCoatmetallicTSA) + tsMetallic.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(tsMetallic.Coat4PtBCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[tsMetallic.Coat4PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: cCoatmetallicTSB) + tsMetallic.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else if tsMetallic.Coat4ProductType == 2
            {
                
                HStack
                {
                    Text("\(tsMetallic.Coat4PtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if tsMetallic.Coat4PtA == 0
                    {
                        Text("\(PUTypes[tsMetallic.Coat4PtA]) - \(hardeners[tsMetallic.Coat4PtB]) Part A, 1 gal ")
                            .font(.caption)
                    }
                    // poly hp
                    else
                    {
                        if tsMetallic.Coat4PtB == 0
                        {
                            Text("\(PUTypes[tsMetallic.Coat4PtA]) Part A - \(puhpHardeners[tsMetallic.Coat4PtB]), 1/4 gal ")
                                .font(.caption)
                        }
                        else
                        {
                            Text("\(PUTypes[tsMetallic.Coat4PtA]) Part A - \(puhpHardeners[tsMetallic.Coat4PtB]), 1/2 gal ")
                                .font(.caption)
                        }
                    }
                    Spacer()
                    Text("\(quant(product: cCoatmetallicTSA) + tsMetallic.Coat4Waste)")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(tsMetallic.Coat4PtBCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if tsMetallic.Coat4PtA == 0
                    {
                        Text("\(PUTypes[tsMetallic.Coat4PtA]) Part B, 1/2 gal ")
                            .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[tsMetallic.Coat4PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: cCoatmetallicTSB) + tsMetallic.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            
            // poly colorant
            if tsMetallic.Coat4PColorant != 0 && (tsMetallic.Coat4ProductType != 0 || tsMetallic.Coat4ProductType != 3)
            {
                HStack
                {
                    Text("\(PolyColorantCodes[tsMetallic.Coat4PColorant])")
                        .font(.caption)
                    Spacer()
                    
                    Text("Poly Colorant - \(PolyColorantChoices[tsMetallic.Coat4PColorant]), 16 oz")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: cCoatmetallicPigment) + tsMetallic.Coat4Waste)")
                        .font(.caption)
                    
                }
            }
            
            if tsMetallic.Coat4MatAdd == true
            {
                HStack
                {
                    Text("EX-KMATADD-EA")
                        .font(.caption)
                    Spacer()
                    Text("Matting Additive, 1# ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: cCoatmetallicTSA) + tsMetallic.Coat4Waste)")
                        .font(.caption)
                }
            }
            if tsMetallic.Coat4Texture != 0
            {
                // bead is chosen
                if tsMetallic.Coat4Texture > 2 && tsMetallic.Coat4Texture != 5
                {
                    HStack
                    {
                        Text("\(textureCodes[tsMetallic.Coat4Texture])")
                            .font(.caption)
                        Spacer()
                        // texture
                        Text("\(TextureOptions[tsMetallic.Coat4Texture]), 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quantTexture(product: TSTextureC3) + tsMetallic.Coat4Waste)")
                            .font(.caption)
                        
                    }
                }
                // aluminum oxide
                else if tsMetallic.Coat4Texture <= 2
                {
                    HStack
                    {
                        Text("\(textureCodes[tsMetallic.Coat4Texture])")
                            .font(.caption)
                        Spacer()
                        // texture
                        Text("\(TextureOptions[tsMetallic.Coat4Texture]), 10#")
                            .font(.caption)
                        Spacer()
                        Text("\(quantTexture(product: TSTextureC3) + tsMetallic.Coat4Waste)")
                            .font(.caption)
                        
                    }
                }
                else
                {
                    HStack
                    {
                        Text("\(textureCodes[tsMetallic.Coat4Texture])")
                            .font(.caption)
                        Spacer()
                        // texture
                        Text("\(TextureOptions[tsMetallic.Coat4Texture]), 2.75#")
                            .font(.caption)
                        Spacer()
                        Text("\(quantTexture(product: TSTextureC3) + tsMetallic.Coat4Waste)")
                            .font(.caption)
                        
                    }
                }
            }
        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()

    }
}

struct TSMetallicSysSumm_Previews: PreviewProvider {
    static var previews: some View {
        TSMetallicSysSumm()
    }
}
