//
//  SplashFloorTSCoat3.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

struct SplashFloorTSCoat3: View {
    
    let products = ["Top Shelf Epoxy®", "Polyaspartic", "Polyurethane"]
    
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
    
    let typesB = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Ench. Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    let TextureOptions = ["No Texture", "Anti-Slip Aluminum Oxide 120 grit", "Anti-Slip Aluminum Oxide 220 grit",  "Anti-Slip Bead 100", "Anti-Slip Bead 50", "Anti-Slip Tex 50"]
    
    let textureCodes = ["", "EX-KASAO120-01", "EX-KASAOX220-EA", "EX-KASB100-EA", "EX-KASB50-EA", "EX-KAST50-EA"]
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Handicap Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLBG-EA", "EX-KPLYCLBL-EA", "EX-KPLYCLDG-EA", "EX-KPLYCLEG-EA", "EX-KPLYCLHB-EA", "EX-KPLYCLLT-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA", "EX-KPLYCLMC-EA", "EX-KPLYCLSB-EA", "EX-KPLYCLSR-EA", "EX-KPLYCLSY-EA", "EX-KPLYCLSG-EA", "EX-KPLYCLTN-EA", "EX-KPLYCLTR-EA", "EX-KPLYCLWH-01",]
    
    @EnvironmentObject var SplashTSFloor : ColorSplashValuesFloorTS //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
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

        // bead
        if SplashTSFloor.Coat3Texture > 2 && SplashTSFloor.Coat3Texture != 5
        {
            let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
            let result = Int(ceil(Float(quantity / 32)))
            
            return result
        }
        
        // AO
        else if SplashTSFloor.Coat3Texture <= 2
        {
            let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
            let result = Int(ceil(Float(quantity / 10)))
            
            return result
        }
        
        // tex
        else
        {
            let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
            let result = Int(ceil(Float(quantity / 44)))
            
            return result
        }
                    
      
    } // returns number of kits required
    
    func updateCovRate() -> Void
    {
        let temp = SplashTSFloor.Coat3ProductType
        SplashTSFloor.Coat3ProductType = 0
        SplashTSFloor.Coat3ProductType = temp
        
        // TSE cov rate
        if SplashTSFloor.Coat3ProductType == 0
        {
            TSAC3.covRate = 600
            TSBC3.covRate = 600
            TSColorantC3.covRate = 600
            TSTextureC3.covRate = 600

            
        }
        // change cov rate to 800 if polyA is chosen
        else if SplashTSFloor.Coat3ProductType == 1
        {
            TSAC3.covRate = 800
            TSBC3.covRate = 800
            TSColorantC3.covRate = 800
            TSTextureC3.covRate = 800


        }
        // else poly is chosen
        else
        {
            // if poly hs is chosen
            if SplashTSFloor.Coat3PtA == 0
            {
                TSAC3.covRate = 600
                TSBC3.covRate = 600
                TSColorantC3.covRate = 600
                TSTextureC3.covRate = 600


            }
            // HP clear gloss
            else if SplashTSFloor.Coat3PtA == 1
            {
                TSAC3.covRate = 575
                TSBC3.covRate = 575
                TSColorantC3.covRate = 575
                TSTextureC3.covRate = 575


            }
            
            // HP clear satin
            else
            {
                TSAC3.covRate = 675
                TSBC3.covRate = 675
                TSColorantC3.covRate = 675
                TSTextureC3.covRate = 675


            }
        }
    }
    
    func checkPCoatCodes() -> Void {
        
        if SplashTSFloor.Coat3ProductType == 1
        {
            if SplashTSFloor.Coat3PtA == 0 && SplashTSFloor.Coat3PtB == 0 {
                SplashTSFloor.Coat3PtACode = "EX-KPLY72AZ-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLY72B-01"
            }
            else if SplashTSFloor.Coat3PtA == 0 && SplashTSFloor.Coat3PtB == 1 {
                SplashTSFloor.Coat3PtACode = "EX-KPLY72AF-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLY72B-01"
                
            }
            else if SplashTSFloor.Coat3PtA == 1 && SplashTSFloor.Coat3PtB == 0 {
                SplashTSFloor.Coat3PtACode = "EX-KPLY85AZ-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLY85B-01"
            }
            else if SplashTSFloor.Coat3PtA == 1 && SplashTSFloor.Coat3PtB == 1 {
                SplashTSFloor.Coat3PtACode = "EX-KPLY85AF-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLY85B-01"
                
            }
            else if SplashTSFloor.Coat3PtA == 2 && SplashTSFloor.Coat3PtB == 0 {
                SplashTSFloor.Coat3PtACode = "EX-KPLY92AZ-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLY92B-01"
                
            }
            else if SplashTSFloor.Coat3PtA == 2 && SplashTSFloor.Coat3PtB == 1 {
                SplashTSFloor.Coat3PtACode = "EX-KPLY92AF-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLY92B-01"
                
            }
        }
        else if SplashTSFloor.Coat3ProductType == 2
        {
            // POLY HS EZ
            if SplashTSFloor.Coat3PtA == 0 && SplashTSFloor.Coat3PtB == 0 {
                SplashTSFloor.Coat3PtACode = "EX-KPLYHSAZ-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLYHSB-01"
            }
            // POLY HS FAST
            else if SplashTSFloor.Coat3PtA == 0 && SplashTSFloor.Coat3PtB == 1 {
                SplashTSFloor.Coat3PtACode = "EX-KPLYHSAF-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLYHSB-01"
                
            }
            // POLY HP GLOSS
            else if SplashTSFloor.Coat3PtA == 1 {
                SplashTSFloor.Coat3PtACode = "EX-KPLYHPGA-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLYHPB-01"
            }
            // POLY HP SATIN
            else if SplashTSFloor.Coat3PtA == 2  {
                SplashTSFloor.Coat3PtACode = "EX-KPLYHPSA-01"
                SplashTSFloor.Coat3PtBCode = "EX-KPLYHPB-01"
                
            }
        }
    }

    
    func checkTexture() -> Void
    {
        // check if bead is chosen
        if SplashTSFloor.Coat3Texture > 2
        {
            TSTextureC3.MixRat = 8
        }
        
        else
        {
            TSTextureC3.MixRat = 1
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Coat 3 Product:")
                    .fontWeight(.bold)
                Picker(selection: $SplashTSFloor.Coat3ProductType,
                       label: ZStack {
                    Text("\(products[SplashTSFloor.Coat3ProductType])")
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
                .onChange(of: SplashTSFloor.Coat3ProductType) { _ in
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
                Toggle(isOn: $SplashTSFloor.Coat3MatAdd, label: {
                    Text("Add Optional Matting Additive")
                        .fontWeight(.bold)
                    
                })
                .toggleStyle(CheckBoxToggleStyle())
            }
            .padding()
            
            if SplashTSFloor.Coat3ProductType == 0
            {
            Text("Top Shelf Epoxy® Part A:")
                .fontWeight(.bold)
            Picker(selection: $SplashTSFloor.Coat3PtA,
                   label: ZStack {
                Text("\(typesA[SplashTSFloor.Coat3PtA])")
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
            Picker(selection: $SplashTSFloor.Coat3PtB,
                   label: ZStack {
                Text("\(typesB[SplashTSFloor.Coat3PtB])")
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
            //             .onChange(of: SplashTSFloor.Coat3PtB) { _ in
            //                 CheckCoatChoices()
            //             }
            Text("Top Shelf Epoxy® Colorant:")
                .fontWeight(.bold)
            Picker(selection: $SplashTSFloor.Coat3TSColorant,
                   label: ZStack {
                Text("\(TSColorantChoices[SplashTSFloor.Coat3TSColorant])")
                    .opacity(1)
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.2)
                    .cornerRadius(5)
                    .frame(width: 300, height: 25)
            }) {
                ForEach (0 ..< TSColorantChoices.count, id: \.self) { index in
                    Text(self.TSColorantChoices[index]).tag(index)
                }
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
            }
            else if SplashTSFloor.Coat3ProductType == 1
            {
                HStack
                {
                Text("Polyaspartic:")
                    .fontWeight(.bold)
                Picker(selection: $SplashTSFloor.Coat3PtA,
                       label: ZStack {
                    Text("\(typesA[SplashTSFloor.Coat3PtA])")
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
                .onChange(of: SplashTSFloor.Coat3PtA) { _ in
                    checkPCoatCodes()
                }
                
                Picker(selection: $SplashTSFloor.Coat3PtB,
                       label: ZStack {
                    Text("\(hardeners[SplashTSFloor.Coat3PtB])")
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
                .onChange(of: SplashTSFloor.Coat3PtB) { _ in
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
                    Text("PolyU:")
                        .fontWeight(.bold)
                    Picker(selection: $SplashTSFloor.Coat3PtA,
                           label: ZStack {
                        Text("\(typesA[SplashTSFloor.Coat3PtA])")
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
                    .onChange(of: SplashTSFloor.Coat3PtA) { _ in
                        updateCovRate()
//                        checkPUCodes()
                        checkPCoatCodes()
                    }
                    if SplashTSFloor.Coat3PtA == 0
                    {
                    Picker(selection: $SplashTSFloor.Coat3PtB,
                           label: ZStack {
                        Text("\(hardeners[SplashTSFloor.Coat3PtB])")
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
                    .onChange(of: SplashTSFloor.Coat3PtB) { _ in
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
            if SplashTSFloor.Coat3ProductType != 0
            {
                Text("Poly Colorant:")
                    .fontWeight(.bold)
                Picker(selection: $SplashTSFloor.Coat3PColorant,
                       label: ZStack {
                    Text("\(PolyColorantChoices[SplashTSFloor.Coat3PColorant])")
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
            Picker(selection: $SplashTSFloor.Coat3Texture,
                   label: ZStack {
                Text("\(TextureOptions[SplashTSFloor.Coat3Texture])")
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
            .onChange(of: SplashTSFloor.Coat3Texture) { _ in
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
                        Text("\(quant(product: TSAC3))")
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
                        Text("\(quant(product: TSAC3))")
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
                    Text("\(quant(product: TSBC3))")
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
                            Text("\(quant(product: TSColorantC1))")
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
                            Text("\(quant(product: TSColorantC3))")
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
                            Text("\(quant(product: TSColorantC3))")
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
                    Text("\(quant(product: TSAC3))")
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
                    Text("\(quant(product: TSAC3))")
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
                    Text("\(quant(product: TSAC3))")
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
                    Text("\(quant(product: TSAC3))")
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
                        Text("\(quant(product: TSColorantC3))")
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
                    Text("\(quant(product: TSTextureC3))")
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
                            Text("\(quant(product: TSTextureC3))")
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
                            Text("\(quant(product: TSTextureC3))")
                                .font(.caption)
                            
                        }
                    }
                }
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
                        Text("\(quant(product: TSAC3))")
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
                TextField("",value: $SplashTSFloor.Coat3Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSAC3) + SplashTSFloor.Coat3Waste) kit(s)")
            }
            .padding()
        }
    }
}


struct SplashFloorTSCoat3_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat3()
    }
}
