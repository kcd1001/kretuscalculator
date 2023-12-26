//
//  SplashFloorTSCoat4.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

var quartzTS_TSAC4 = stats2(product: "Top Shelf® Epoxy Part A:", covRate: 210, MixRat: 1)
var quartzTS_TSBC4 = stats2(product: "Top Shelf® Epoxy Part B:", covRate: 210, MixRat: 0.5)
var quartzTS_TSColorantC4 = stats2(product: "Top Shelf® Epoxy Colorant:", covRate: 210, MixRat: 16)

var ChipTextureAO = stats(product: "Aluminum Oxide", covRate: 420, MixRat: 1 )
var ChipTextureBead = stats(product: "Anti-Slip Bead", covRate: 420, MixRat: 16 )

struct ColorQuartzTSTopCoat: View {
    
    
    
    let products = ["Top Shelf Epoxy®", "Polyaspartic", "Polyurethane"]
    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray", "A Resin - Enchanted Green", "A Resin - Handicap Blue",           "A Resin - Latte", "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha", "A Resin - Safety Blue", "A Resin - Safety Red",           "A Resin - Safety Yellow", "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White", "CR Resin - Clear",
                  "LG Resin - Clear"]
    
    let PATypes = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    
    let PUTypes = ["Polyurethane HS", "Polyurethane HP Clear Gloss", "Polyurethane HP Clear Satin"]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01", "EX-KTSARHB-01", "EX-KTSARLT-01",                           "EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01", "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01",                            "EX-KTSARTN-01", "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01",
                       "Contact Distributor"]
    
    let typesB = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    let TextureOptions = ["No Texture", "Anti-Slip Aluminum Oxide 120 grit", "Anti-Slip Aluminum Oxide 220 grit",  "Anti-Slip Bead 100", "Anti-Slip Bead 50", "Anti-Slip Tex 50"]
    
    let textureCodes = ["", "EX-KASAO120-01", "EX-KASAOX220-EA", "EX-KASB100-EA", "EX-KASB50-EA", "EX-KAST50-EA"]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA", "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA", "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA", "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01",]
    
    
    
    @EnvironmentObject var QuartzTS : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @EnvironmentObject var QuartzTS_TSAC4 : stats2
    @EnvironmentObject var QuartzTS_TSBC4 : stats2
    @EnvironmentObject var QuartzTS_TSColorantC4 : stats2
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
    
    
    func updateCovRate() -> Void
    {
        // TSE cov rate
        if QuartzTS.Coat4ProductType == 0
        {
            if QuartzTS.BroadcastSizeSelection == 0
            {
                QuartzTS_TSAC4.covRate = 210
                QuartzTS_TSBC4.covRate = 210
                QuartzTS_TSColorantC4.covRate = 210
            }
            
            else if QuartzTS.BroadcastSizeSelection == 1
            {
                QuartzTS_TSAC4.covRate = 285
                QuartzTS_TSBC4.covRate = 285
                QuartzTS_TSColorantC4.covRate = 285
                
            }
            else
            {
                QuartzTS_TSAC4.covRate = 420
                QuartzTS_TSBC4.covRate = 420
                QuartzTS_TSColorantC4.covRate = 420
                
            }
        }
        // change cov rate to 800 if polyA is chosen
        else if QuartzTS.Coat4ProductType == 1
        {
            QuartzTS_TSAC4.covRate = 750
            QuartzTS_TSBC4.covRate = 750
        }
        // else poly is chosen
        else
        {
            
            // if poly hs is chosen
            if QuartzTS.Coat4PtA == 0
            {
                QuartzTS_TSAC4.covRate = 560
                QuartzTS_TSBC4.covRate = 560
            }
            // HP clear gloss
            else if QuartzTS.Coat4PtA == 1
            {
                QuartzTS_TSAC4.covRate = 575
                QuartzTS_TSBC4.covRate = 575
            }
            
            // HP clear satin
            else
            {
                QuartzTS_TSAC4.covRate = 675
                QuartzTS_TSBC4.covRate = 675
            }
        }
    }
    func checkPCoatCodes() -> Void {
        
        if QuartzTS.Coat4ProductType == 1
        {
            if QuartzTS.Coat4PtA == 0 && QuartzTS.Coat4PtB == 0 {
                QuartzTS.Coat4PtACode = "EX-KPLY72AZ-01"
                QuartzTS.Coat4PtBCode = "EX-KPLY72B-01"
            }
            else if QuartzTS.Coat4PtA == 0 && QuartzTS.Coat4PtB == 1 {
                QuartzTS.Coat4PtACode = "EX-KPLY72AF-01"
                QuartzTS.Coat4PtBCode = "EX-KPLY72B-01"
                
            }
            else if QuartzTS.Coat4PtA == 1 && QuartzTS.Coat4PtB == 0 {
                QuartzTS.Coat4PtACode = "EX-KPLY85AZ-01"
                QuartzTS.Coat4PtBCode = "EX-KPLY85B-01"
            }
            else if QuartzTS.Coat4PtA == 1 && QuartzTS.Coat4PtB == 1 {
                QuartzTS.Coat4PtACode = "EX-KPLY85AF-01"
                QuartzTS.Coat4PtBCode = "EX-KPLY85B-01"
                
            }
            else if QuartzTS.Coat4PtA == 2 && QuartzTS.Coat4PtB == 0 {
                QuartzTS.Coat4PtACode = "EX-KPLY92AZ-01"
                QuartzTS.Coat4PtBCode = "EX-KPLY92B-01"
                
            }
            else if QuartzTS.Coat4PtA == 2 && QuartzTS.Coat4PtB == 1 {
                QuartzTS.Coat4PtACode = "EX-KPLY92AF-01"
                QuartzTS.Coat4PtBCode = "EX-KPLY92B-01"
                
            }
        }
        else if QuartzTS.Coat4ProductType == 2
        {
            // POLY HS EZ
            if QuartzTS.Coat4PtA == 0 && QuartzTS.Coat4PtB == 0 {
                QuartzTS.Coat4PtACode = "EX-KPLYHSAZ-01"
                QuartzTS.Coat4PtBCode = "EX-KPLYHSB-01"
            }
            // POLY HS FAST
            else if QuartzTS.Coat4PtA == 0 && QuartzTS.Coat4PtB == 1 {
                QuartzTS.Coat4PtACode = "EX-KPLYHSAF-01"
                QuartzTS.Coat4PtBCode = "EX-KPLYHSB-01"
                
            }
            // POLY HP GLOSS
            else if QuartzTS.Coat4PtA == 1 {
                QuartzTS.Coat4PtACode = "EX-KPLYHPGA-01"
                QuartzTS.Coat4PtBCode = "EX-KPLYHPB-01"
            }
            // POLY HP SATIN
            else if QuartzTS.Coat4PtA == 2  {
                QuartzTS.Coat4PtACode = "EX-KPLYHPSA-01"
                QuartzTS.Coat4PtBCode = "EX-KPLYHPB-01"
                
            }
        }
    }
    
    
    func checkTexture() -> Void
    {
        // check if bead is chosen
        if QuartzTS.Coat4Texture > 2
        {
            TSTextureC4.MixRat = 8
        }
        
        else
        {
            TSTextureC4.MixRat = 1
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Coat 4 Product:")
                    .fontWeight(.bold)
                Picker(selection: $QuartzTS.Coat4ProductType,
                       label: ZStack {
                    Text("\(products[QuartzTS.Coat4ProductType])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.9)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                    //  .padding()
                }) {
                    ForEach (0 ..< products.count, id: \.self) { index in
                        Text(self.products[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .onChange(of: QuartzTS.Coat4ProductType) { _ in
                    updateCovRate()
                    //                    checkPUCodes()
                    checkPCoatCodes()
                }
                Spacer()
                Text("Coating Thickness: 8-12 mils")
                    .fontWeight(.heavy)
                    .padding()
                //               SplashTSFloorInfo()
            }
            .padding()
            
            // matting additive coat option
            HStack {
                Toggle(isOn: $QuartzTS.Coat4MatAdd, label: {
                    Text("Add Optional Matting Additive")
                        .fontWeight(.bold)
                    
                })
                .toggleStyle(CheckBoxToggleStyle())
            }
            .padding()
            
            if QuartzTS.Coat4ProductType == 0
            {
                Text("Top Shelf Epoxy® Part A:")
                    .fontWeight(.bold)
                Picker(selection: $QuartzTS.Coat4PtA,
                       label: ZStack {
                    Text("\(typesA[QuartzTS.Coat4PtA])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.9)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                    //  .padding()
                }) {
                    ForEach (0 ..< typesA.count, id: \.self) { index in
                        Text(self.typesA[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                
                Text("Top Shelf Epoxy® Part B:")
                    .fontWeight(.bold)
                Picker(selection: $QuartzTS.Coat4PtB,
                       label: ZStack {
                    Text("\(typesB[QuartzTS.Coat4PtB])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 150, height: 25)
                    //   .padding()
                }) {
                    ForEach (0 ..< typesB.count, id: \.self) { index in
                        Text(self.typesB[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                //             .onChange(of: QuartzTS.Coat4PtB) { _ in
                //                 CheckCoatChoices()
                //             }
                Text("Top Shelf Epoxy® Colorant:")
                    .fontWeight(.bold)
                Picker(selection: $QuartzTS.Coat4TSColorant,
                       label: ZStack {
                    Text("\(TSColorantChoices[QuartzTS.Coat4TSColorant])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 400, height: 25)
                }) {
                    ForEach (0 ..< TSColorantChoices.count, id: \.self) { index in
                        Text(self.TSColorantChoices[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            }
            else if QuartzTS.Coat4ProductType == 1
            {
                HStack
                {
                    Text("Polyaspartic:")
                        .fontWeight(.bold)
                    Picker(selection: $QuartzTS.Coat4PtA,
                           label: ZStack {
                        Text("\(typesA[QuartzTS.Coat4PtA])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.9)
                            .cornerRadius(5)
                            .frame(width: 225, height: 25)
                        //  .padding()
                    }) {
                        ForEach (0 ..< PATypes.count, id: \.self) { index in
                            Text(self.PATypes[index]).tag(index)
                        }
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .onChange(of: QuartzTS.Coat4PtA) { _ in
                        checkPCoatCodes()
                    }
                    
                    Picker(selection: $QuartzTS.Coat4PtB,
                           label: ZStack {
                        Text("\(hardeners[QuartzTS.Coat4PtB])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.9)
                            .cornerRadius(5)
                            .frame(width: 225, height: 25)
                        //  .padding()
                    }) {
                        ForEach (0 ..< hardeners.count, id: \.self) { index in
                            Text(self.hardeners[index]).tag(index)
                        }
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .onChange(of: QuartzTS.Coat4PtB) { _ in
                        checkPCoatCodes()
                    }
                    Spacer()
                }
                .padding()
            }
            else
            {
                HStack
                {
                    Text("Polyurethane:")
                        .fontWeight(.bold)
                    Picker(selection: $QuartzTS.Coat4PtA,
                           label: ZStack {
                        Text("\(typesA[QuartzTS.Coat4PtA])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.9)
                            .cornerRadius(5)
                            .frame(width: 225, height: 25)
                        //  .padding()
                    }) {
                        ForEach (0 ..< PUTypes.count, id: \.self) { index in
                            Text(self.PUTypes[index]).tag(index)
                        }
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .onChange(of: QuartzTS.Coat4PtA) { _ in
                        updateCovRate()
                        //                        checkPUCodes()
                        checkPCoatCodes()
                    }
                    if QuartzTS.Coat4PtA == 0
                    {
                        Picker(selection: $QuartzTS.Coat4PtB,
                               label: ZStack {
                            Text("\(hardeners[QuartzTS.Coat4PtB])")
                                .opacity(1)
                            Rectangle()
                                .fill(Color.black)
                                .opacity(0.9)
                                .cornerRadius(5)
                                .frame(width: 225, height: 25)
                            //  .padding()
                        }) {
                            ForEach (0 ..< hardeners.count, id: \.self) { index in
                                Text(self.hardeners[index]).tag(index)
                            }
                        }
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .onChange(of: QuartzTS.Coat4PtB) { _ in
                            updateCovRate()
                            //                        checkPUCodes()
                            checkPCoatCodes()
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            
            // poly colorant picker if TSE is not selected
            if QuartzTS.Coat4ProductType != 0
            {
                Text("Poly Colorant:")
                    .fontWeight(.bold)
                Picker(selection: $QuartzTS.Coat4PColorant,
                       label: ZStack {
                    Text("\(PolyColorantChoices[QuartzTS.Coat4PColorant])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.9)
                        .cornerRadius(5)
                        .frame(width: 225, height: 25)
                    //  .padding()
                }) {
                    ForEach (0 ..< PolyColorantChoices.count, id: \.self) { index in
                        Text(self.PolyColorantChoices[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            }
            
            // texture picker
            Text("Texture:")
                .fontWeight(.bold)
            Picker(selection: $QuartzTS.Coat4Texture,
                   label: ZStack {
                Text("\(TextureOptions[QuartzTS.Coat4Texture])")
                    .opacity(1)
                Rectangle()
                    .fill(Color.black)
                    .opacity(0.9)
                    .cornerRadius(5)
                    .frame(width: 225, height: 25)
                //  .padding()
            }) {
                ForEach (0 ..< TextureOptions.count, id: \.self) { index in
                    Text(self.TextureOptions[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
            .onChange(of: QuartzTS.Coat4Texture) { _ in
                checkTexture()
            }
            
            
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
                            Text("\(quant(product: QuartzTS_TSAC4))")
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
                            Text("\(quant(product: QuartzTS_TSAC4))")
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
                        Text("\(quant(product: QuartzTS_TSBC4))")
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
                            Text("\(quant(product: QuartzTS_TSColorantC4))")
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
                        Text("\(quant(product: QuartzTS_TSAC4))")
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
                        Text("\(quant(product: QuartzTS_TSAC4))")
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
                            Text("\(PUTypes[QuartzTS.Coat4PtA]) - \(hardeners[QuartzTS.Coat4PtB]) Part A, 1 gal ")
                                .font(.caption)
                        }
                        // Poly HP Gloss
                        else if QuartzTS.Coat4PtA == 1
                        {
                            Text("\(PUTypes[QuartzTS.Coat4PtA]) Part A, 1/4 gal ")
                                .font(.caption)
                        }
                        // Poly HP Satin
                        else
                        {
                            Text("\(PUTypes[QuartzTS.Coat4PtA]) Part A, 1/2 gal ")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(quant(product: QuartzTS_TSAC4))")
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
                            Text("\(PUTypes[QuartzTS.Coat4PtA]) Part B, 1/2 gal ")
                                .font(.caption)
                        }
                        else
                        {
                            Text("\(PUTypes[QuartzTS.Coat4PtA]) Part B, 1 gal ")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(quant(product: QuartzTS_TSAC4))")
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
                        Text("\(quant(product: QuartzTS_TSColorantC4))")
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
                        Text("\(quant(product: QuartzTS_TSAC4))")
                            .font(.caption)
                    }
                }
            }
            
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $QuartzTS.Coat4Waste, formatter: NumberFormatter())
                    .frame(width:40, height:25)
                    .background(Color(red:249.0/255.0, green: 244.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: QuartzTS_TSAC4) + QuartzTS.Coat4Waste) kit(s)")
            }
            .padding()
        }
    }
}


struct QuartzTSTopCoat_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat3()
    }
}
