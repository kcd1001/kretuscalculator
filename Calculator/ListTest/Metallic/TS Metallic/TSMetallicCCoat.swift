//
//  SplashFloorTSCoat1.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

var cCoatmetallicTSA = stats(product: "Top Shelf Epoxy Part A", covRate: 350, MixRat: 1)
var cCoatmetallicTSB = stats(product: "Top Shelf Epoxy Part A", covRate: 350, MixRat: 0.5)
var cCoatmetallicPigment = stats(product: "Top Shelf Epoxy Part A", covRate: 350, MixRat: 16)
var cCoatmetallicTexture = stats(product: "Anti slip glass", covRate: 350, MixRat: 10)

struct TSMetallicCCoat: View {

    let products = ["Top Shelf Epoxy®", "Polyaspartic", "Polyurethane"]
    
    let typesA = [ "EZ - Clear", "FC - Clear" ]
    
    let typesB = [ "AP", "EZ", ]
    
    let typesACodes = ["EX-KPLYHSAZ-01", "EX-KPLYHSAF-01"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let puhpHardeners = ["HP Gloss", "HP Satin"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA" ]
    
    let pigmentChoices = ["Antique Silver", "Black", "Cabernet", "California Gold", "Carbon", "Cherrywood", "Dark Blue", "Dark Gray", "Forest Green", "Gold Glitter", "Ivory", "Jade Green", "New Copper", "Olive", "Sedona", "Silver Glitter", "Sky Blue", "Sterling", "Sunset Gold", "Violet"]
    
    let pigmentCodes = [ "EX-KMETASL-EA", "EX-KMETABL-EA", "EX-KMETACB-EA", "EX-KMETACG-EA", "EX-KMETACN-EA", "EX-KMETACW-EA", "EX-KMETADB-EA", "EX-KMETADG-EA", "EX-KMETAFG-EA", "EX-KMETGG-EA", "EX-KMETAIV-EA", "EX-KMETAJG-EA", "EX-KMETANC-EA", "EX-KMETAOL-EA", "EX-KMETASD-EA", "EX-KMETASG-EA", "EX-KMETASB-EA", "EX-KMETAST-EA", "EX-KMETASN-EA", "EX-KMETAVL-EA" ]
    
    let PATypes = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    
    let PUTypes = ["Polyurethane HS", "Polyurethane HP", ""]
    
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
    
    @EnvironmentObject var tsMetallic : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    @State var PCoatPtACode = "EX-KPLY72AZ-01"
    @State var PCoatHardenerCode = "EX-KPLY72B-01"
    @State var PUPtACode = "EX-KPLY72AZ-01"
    @State var PUHardenerCode = "EX-KPLY72B-01"
    @State var isSolventCleaner = false

    @State var UPCACode = "EX-KUPCARC-EA"
    @State var UPCBCode = "EX-KUPCRCA6-EA"
    @State var UPCCode = "EX-KUPCRFC-EA"


    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    func checkPCoatCodes() -> Void {
        
        if tsMetallic.Coat4ProductType == 1
        {
            if tsMetallic.Coat4PtA == 0 && tsMetallic.Coat4PtB == 0 {
                tsMetallic.Coat4PtACode = "EX-KPLY72AZ-01"
                tsMetallic.Coat4PtBCode = "EX-KPLY72B-01"
            }
            else if tsMetallic.Coat4PtA == 0 && tsMetallic.Coat4PtB == 1 {
                tsMetallic.Coat4PtACode = "EX-KPLY72AF-01"
                tsMetallic.Coat4PtBCode = "EX-KPLY72B-01"
                
            }
            else if tsMetallic.Coat4PtA == 1 && tsMetallic.Coat4PtB == 0 {
                tsMetallic.Coat4PtACode = "EX-KPLY85AZ-01"
                tsMetallic.Coat4PtBCode = "EX-KPLY85B-01"
            }
            else if tsMetallic.Coat4PtA == 1 && tsMetallic.Coat4PtB == 1 {
                tsMetallic.Coat4PtACode = "EX-KPLY85AF-01"
                tsMetallic.Coat4PtBCode = "EX-KPLY85B-01"
                
            }
            else if tsMetallic.Coat4PtA == 2 && tsMetallic.Coat4PtB == 0 {
                tsMetallic.Coat4PtACode = "EX-KPLY92AZ-01"
                tsMetallic.Coat4PtBCode = "EX-KPLY92B-01"
                
            }
            else if tsMetallic.Coat4PtA == 2 && tsMetallic.Coat4PtB == 1 {
                tsMetallic.Coat4PtACode = "EX-KPLY92AF-01"
                tsMetallic.Coat4PtBCode = "EX-KPLY92B-01"
                
            }
        }
        else if tsMetallic.Coat4ProductType == 2
        {
            // POLY HS EZ
            if tsMetallic.Coat4PtA == 0 && tsMetallic.Coat4PtB == 0 {
                tsMetallic.Coat4PtACode = "EX-KPLYHSAZ-01"
                tsMetallic.Coat4PtBCode = "EX-KPLYHSB-01"
            }
            // POLY HS FAST
            else if tsMetallic.Coat4PtA == 0 && tsMetallic.Coat4PtB == 1 {
                tsMetallic.Coat4PtACode = "EX-KPLYHSAF-01"
                tsMetallic.Coat4PtBCode = "EX-KPLYHSB-01"
                
            }
            
            // POLY HP GLOSS
            if tsMetallic.Coat4PtA == 1 && tsMetallic.Coat4PtB == 0 {
                tsMetallic.Coat4PtACode = "EX-KPLYHPGA-01"
                tsMetallic.Coat4PtBCode = "EX-KPLYHPB-01"
            }
            // POLY HP SATIN
            else if tsMetallic.Coat4PtA == 1 && tsMetallic.Coat4PtB == 1 {
                tsMetallic.Coat4PtACode = "EX-KPLYHPSA-01"
                tsMetallic.Coat4PtBCode = "EX-KPLYHPB-01"
                
            }
        }
    }

    
    func checkTexture() -> Void
    {
        // check if bead is chosen
        if tsMetallic.Coat4Texture > 2
        {
            cCoatmetallicTexture.MixRat = 8
        }
        
        else
        {
            cCoatmetallicTexture.MixRat = 1
        }
    }
    
    func checkCovRate() -> Void
    {
        
        let temp = tsMetallic.Coat4ProductType
        tsMetallic.Coat4ProductType = 0
        tsMetallic.Coat4ProductType = temp
        
        if tsMetallic.Coat4ProductType == 0
        {
            cCoatmetallicTSA.covRate = 350
            cCoatmetallicTSB.covRate = 350
            cCoatmetallicPigment.covRate = 350
        }
        else
        {
            cCoatmetallicTSA.covRate = 210
            cCoatmetallicTSB.covRate = 210
            cCoatmetallicPigment.covRate = 210
        }
    }
    
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

    
    var body: some View {
//        HStack {
//
//            Text("Coating Thickness: 8 mils")
//                .fontWeight(.heavy)
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .leading)
//            Spacer()
//
// //           PCoattsMetallicInfo()
//                
//            }
//            .padding()
//            .frame(maxWidth: .infinity, alignment: .leading)
//        .padding()
//
//                Text("Polyurethane HS Part A:")
//                    .fontWeight(.bold)
//                Picker(selection: $tsMetallic.Coat4PtA,
//                       label: ZStack {
//                    Text("\(typesA[tsMetallic.Coat4PtA])")
//                        .opacity(1)
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.2)
//                        .cornerRadius(5)
//                        .frame(width: 150, height: 25)
//                    //   .padding()
//                }) {
//                    ForEach (0 ..< typesA.count, id: \.self) { index in
//                        Text(self.typesA[index]).tag(index)
//                    }
//                }
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(5)
//                //             .onChange(of: tsMetallic.Coat1PtB) { _ in
//                //                 CheckCoatChoices()
//                //             }
        VStack {
            HStack {
                Text("Top Coat Product:")
                    .fontWeight(.bold)
                Picker(selection: $tsMetallic.Coat4ProductType,
                       label: ZStack {
                    Text("\(products[tsMetallic.Coat4ProductType])")
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
                .onChange(of: tsMetallic.Coat4ProductType) { _ in
                    
                    checkCovRate()
                    checkPCoatCodes()
                    
                }
                
                Spacer()
                
                //               SplashTSFloorInfo()
            }
            .padding()
            
            // matting additive coat option
            HStack {
                Toggle(isOn: $tsMetallic.Coat4MatAdd, label: {
                    Text("Add Optional Matting Additive")
                        .fontWeight(.bold)
                    
                })
                .toggleStyle(CheckBoxToggleStyle())
            }
            .padding()
            
            if tsMetallic.Coat4ProductType == 0
            {
                
                Text("Top Shelf Epoxy® Part B:")
                    .fontWeight(.bold)
                Picker(selection: $tsMetallic.Coat4PtB,
                       label: ZStack {
                    Text("\(typesB[tsMetallic.Coat4PtB])")
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
                //             .onChange(of: tsMetallic.Coat4PtB) { _ in
                //                 CheckCoatChoices()
                //             }
//                Text("Top Shelf Epoxy® Colorant:")
//                    .fontWeight(.bold)
//                Picker(selection: $tsMetallic.Coat4TSColorant,
//                       label: ZStack {
//                    Text("\(TSColorantChoices[tsMetallic.Coat4TSColorant])")
//                        .opacity(1)
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.2)
//                        .cornerRadius(5)
//                        .frame(width: 300, height: 25)
//                }) {
//                    ForEach (0 ..< TSColorantChoices.count, id: \.self) { index in
//                        Text(self.TSColorantChoices[index]).tag(index)
//                    }
//                }
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(5)
            }
            // PA chosen
            else if tsMetallic.Coat4ProductType == 1
            {
                HStack
                {
                    Text("Polyaspartic:")
                        .fontWeight(.bold)
                    Picker(selection: $tsMetallic.Coat4PtA,
                           label: ZStack {
                        Text("\(PATypes[tsMetallic.Coat4PtA])")
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
                    .onChange(of: tsMetallic.Coat4PtA) { _ in
                        checkPCoatCodes()
                    }
                    
                    Picker(selection: $tsMetallic.Coat4PtB,
                           label: ZStack {
                        Text("\(hardeners[tsMetallic.Coat4PtB])")
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
                    .onChange(of: tsMetallic.Coat4PtB) { _ in
                        checkPCoatCodes()
                    }
                    Spacer()
                }
                .padding()
            }
            // PU is chosen
            else if tsMetallic.Coat4ProductType == 2
            {
                HStack
                {
                    Text("Polyurethane:")
                        .fontWeight(.bold)
                    Picker(selection: $tsMetallic.Coat4PtA,
                           label: ZStack {
                        Text("\(PUTypes[tsMetallic.Coat4PtA])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.9)
                            .cornerRadius(5)
                            .frame(width: 225, height: 25)
                        //  .padding()
                    }) {
                        ForEach (0 ..< PUTypes.count - 1, id: \.self) { index in
                            Text(self.PUTypes[index]).tag(index)
                        }
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .onChange(of: tsMetallic.Coat4PtA) { _ in
                        //                       updateCovRate()
                        checkPCoatCodes()
                    }
                    if tsMetallic.Coat4PtA == 0
                    {
                        Picker(selection: $tsMetallic.Coat4PtB,
                               label: ZStack {
                            Text("\(hardeners[tsMetallic.Coat4PtB])")
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
                        .onChange(of: tsMetallic.Coat4PtB) { _ in
                            //                        updateCovRate()
                            checkPCoatCodes()
                        }
                    }
                    else
                    {
                        Picker(selection: $tsMetallic.Coat4PtB,
                               label: ZStack {
                            Text("\(hardeners[tsMetallic.Coat4PtB])")
                                .opacity(1)
                            Rectangle()
                                .fill(Color.black)
                                .opacity(0.9)
                                .cornerRadius(5)
                                .frame(width: 225, height: 25)
                            //  .padding()
                        }) {
                            ForEach (0 ..< puhpHardeners.count, id: \.self) { index in
                                Text(self.puhpHardeners[index]).tag(index)
                            }
                        }
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .onChange(of: tsMetallic.Coat4PtB) { _ in
                            //                        updateCovRate()
                            checkPCoatCodes()
                        }
                    }
                    Spacer()
                }
                .padding()
            }

            
            // poly colorant picker if TSE or UPC is not selected
            if tsMetallic.Coat4ProductType != 0
            {
                Text("Poly Colorant:")
                    .fontWeight(.bold)
                Picker(selection: $tsMetallic.Coat4PColorant,
                       label: ZStack {
                    Text("\(PolyColorantChoices[tsMetallic.Coat4PColorant])")
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
            Picker(selection: $tsMetallic.Coat4Texture,
                   label: ZStack {
                Text("\(TextureOptions[tsMetallic.Coat4Texture])")
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
            .onChange(of: tsMetallic.Coat4Texture) { _ in
                checkTexture()
            }
            //
            //            // texture picker
            //            Text("Texture:")
            //                .fontWeight(.bold)
            //            Picker(selection: $tsMetallic.Coat4Texture,
            //                   label: ZStack {
            //                Text("\(TextureOptions[tsMetallic.Coat4Texture])")
            //                    .opacity(1)
            //                Rectangle()
            //                    .fill(Color.black)
            //                    .opacity(0.9)
            //                    .cornerRadius(5)
            //                    .frame(width: 225, height: 25)
            //                //  .padding()
            //            }) {
            //                ForEach (0 ..< TextureOptions.count, id: \.self) { index in
            //                    Text(self.TextureOptions[index]).tag(index)
            //                }
            //            }
            //            .background(Color.gray.opacity(0.2))
            //            .cornerRadius(5)
            //            .onChange(of: tsMetallic.Coat4Texture) { _ in
            //                checkTexture()
            //            }
            
            
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
                        Text("\(quant(product: cCoatmetallicTSA))")
                            .font(.caption)
                    }
                    
                    HStack{
                        Text("\(typesBCodes[tsMetallic.Coat4PtB])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Part B: \(typesB[tsMetallic.Coat4PtB]), 1/2 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: cCoatmetallicTSB))")
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
                        Text("\(quant(product:cCoatmetallicTSA))")
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
                        Text("\(quant(product: cCoatmetallicTSB))")
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
                        Text("\(quant(product: cCoatmetallicTSA))")
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
                        Text("\(quant(product: cCoatmetallicTSB))")
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
                        Text("\(quant(product: cCoatmetallicPigment))")
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
                        Text("\(quant(product: cCoatmetallicTSA))")
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
                            Text("\(quantTexture(product: TSTextureC3))")
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
                            Text("\(quantTexture(product: TSTextureC3))")
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
                            Text("\(quantTexture(product: TSTextureC3))")
                                .font(.caption)
                            
                        }
                    }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
            
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
//                    HStack{
//                        Text("\(typesACodes[tsMetallic.Coat4PtA])")
//                            .font(.caption)
//                        Spacer()
//                        Text("Polyurethane HS Part A: \(typesA[tsMetallic.Coat4PtA]), 1 gal")
//                            .font(.caption)
//                        Spacer()
//                        Text("\(quant(product: cCoatmetallicTSB))")
//                            .font(.caption)
//                    }
//
//                HStack{
//                    Text("EX-KPLYHSB-EA")
//                        .font(.caption)
//                    Spacer()
//                    Text("Polyurethane HS Part B, 1/2 gal")
//                        .font(.caption)
//                    Spacer()
//                    Text("\(quant(product: cCoatmetallicTSB))")
//                        .font(.caption)
//                }
//
//                HStack{
//                    Text("EX-KASG70-EA")
//                        .font(.caption)
//                    Spacer()
//                    Text("Anti-Slip Glass 70, 32 oz")
//                        .font(.caption)
//                    Spacer()
//                    Text("\(quant(product: cCoatmetallicTexture))")
//                        .font(.caption)
//                }
//
//            }
//            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
//            .cornerRadius(5.0)
//            .padding()
        
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $tsMetallic.Coat4Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: cCoatmetallicTSA) + tsMetallic.Coat4Waste) kit(s)")
            }
            .padding()
        }
    }



struct TSMetallicCCoat_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat1()
    }
}
