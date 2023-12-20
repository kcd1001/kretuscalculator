//
//  SplashFloorTSCoat4.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

var ESDTS_TSAC4 = stats2(product: "Top Shelf® Epoxy Part A:", covRate: 270, MixRat: 1)
var ESDTS_TSBC4 = stats2(product: "Top Shelf® Epoxy Part B:", covRate: 270, MixRat: 0.5)
var ESDTS_TSColorantC4 = stats2(product: "Top Shelf® Epoxy Colorant:", covRate: 270, MixRat: 16)

struct ESDTSTopCoat: View {
    
    
    let products = ["Top Shelf Epoxy®", "Polyaspartic 92", "Polyurethane HP Gloss"]
    
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
    
    let PACodes = ["EX-KPLY92AZ-01", "EX-KPLY92AF-01"]
    
    let PUTypes = ["Polyurethane HS", "Polyurethane HP"]
    
    let typesB = ["AP", "EZ", "Fast"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let puhpHardeners = ["HP Gloss", "HP Satin"]
    
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA"]
    
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
    
    let PolyColorantChoices = ["No Color (pre-pigmented Part A)", "Dark Gray", "Light Gray", "Medium Gray", "Safety Blue"]
    
    let PolyColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KPLYCLDG-EA", "EX-KPLYCLLG-EA", "EX-KPLYCLMG-EA",
                             "EX-KPLYCLSB-EA"]
    
    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA",
                            "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    @EnvironmentObject var ESDTS : ColorQuartzTSValues //Used for coat selections
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
    
    
    //    func updateCovRate() -> Void
    //    {
    //        // TSE cov rate
    //        if ESDTS.Coat4ProductType == 0
    //        {
    //            ESDTS_TSAC4.covRate = 120
    //            ESDTS_TSBC4.covRate = 120
    //        }
    //        // change cov rate to 800 if polyA is chosen
    //        else if ESDTS.Coat4ProductType == 1
    //        {
    //            ESDTS_TSAC4.covRate = 160
    //            ESDTS_TSBC4.covRate = 160
    //        }
    //        // else poly is chosen
    //        else
    //        {
    //            ESDTS_TSAC4.covRate = 120
    //            ESDTS_TSBC4.covRate = 120
    //
    ////            // if poly hs is chosen
    ////            if ESDTS.Coat4PtA == 0
    ////            {
    ////                TSAC4.covRate = 600
    ////                TSBC4.covRate = 600
    ////            }
    ////            // HP clear gloss
    ////            else if ESDTS.Coat4PtA == 1
    ////            {
    ////                TSAC4.covRate = 575
    ////                TSBC4.covRate = 575
    ////            }
    ////
    ////            // HP clear satin
    ////            else
    ////            {
    ////                TSAC4.covRate = 675
    ////                TSBC4.covRate = 675
    ////            }
    //        }
    //    }
    
    func checkPCoatCodes() -> Void {
        
        if ESDTS.Coat4PtA == 0 && ESDTS.Coat4PtB == 0 {
            PCoatPtACode = "EX-KPLY72AZ-01"
            PCoatHardenerCode = "EX-KPLY72B-01"
        }
        else if ESDTS.Coat4PtA == 0 && ESDTS.Coat4PtB == 1 {
            PCoatPtACode = "EX-KPLY72AF-01"
            PCoatHardenerCode = "EX-KPLY72B-01"
            
        }
        else if ESDTS.Coat4PtA == 1 && ESDTS.Coat4PtB == 0 {
            PCoatPtACode = "EX-KPLY85AZ-01"
            PCoatHardenerCode = "EX-KPLY85B-01"
        }
        else if ESDTS.Coat4PtA == 1 && ESDTS.Coat4PtB == 1 {
            PCoatPtACode = "EX-KPLY85AF-01"
            PCoatHardenerCode = "EX-KPLY85B-01"
            
        }
        else if ESDTS.Coat4PtA == 2 && ESDTS.Coat4PtB == 0 {
            PCoatPtACode = "EX-KPLY92AZ-01"
            PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
        else if ESDTS.Coat4PtA == 2 && ESDTS.Coat4PtB == 1 {
            PCoatPtACode = "EX-KPLY92AF-01"
            PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
    }
    func checkPUCodes() -> Void
    {
        // POLY HS EZ
        if ESDTS.Coat4PtA == 0 && ESDTS.Coat4PtB == 0 {
            ESDTS.PUPtACode = "EX-KPLYHSAZ-01"
            ESDTS.PUHardenerCode = "EX-KPLYHSB-01"
        }
        // POLY HS FAST
        else if ESDTS.Coat4PtA == 0 && ESDTS.Coat4PtB == 1 {
            ESDTS.PUPtACode = "EX-KPLYHSAF-01"
            ESDTS.PUHardenerCode = "EX-KPLYHSB-01"
            
        }
    }
    func updateCovRate() -> Void
    {
        
        // TOP COAT
        // TSE cov rate
        if ESDTS.Coat4ProductType == 0
        {
            
            ESDTS_TSAC4.covRate = 270
            ESDTS_TSBC4.covRate = 270
            ESDTS_TSColorantC4.covRate = 270
            
            
        }
        // PolyA is chosen in cap coat
        else if ESDTS.Coat4ProductType == 1
        {
            ESDTS_TSAC4.covRate = 270
            ESDTS_TSBC4.covRate = 270
            ESDTS_TSColorantC4.covRate = 270
        }
        // PolyU in cap coat
        else if ESDTS.Coat4ProductType == 2
        {
            
            ESDTS_TSAC4.covRate = 575
            ESDTS_TSBC4.covRate = 575
            ESDTS_TSColorantC4.covRate = 575
            
        }
        
    }
    
    func checkTexture() -> Void
    {
        // check if bead is chosen
        if ESDTS.Coat4Texture > 2
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
//            HStack {
//                Text("Top Coat Product:")
//                    .fontWeight(.bold)
//                Picker(selection: $ESDTS.Coat4ProductType,
//                       label: ZStack {
//                    Text("\(products[ESDTS.Coat4ProductType])")
//                        .opacity(1)
//                    Rectangle()
//                        .fill(Color.black)
//                        .opacity(0.9)
//                        .cornerRadius(5)
//                        .frame(width: 225, height: 25)
//                    //  .padding()
//                }) {
//                    ForEach (0 ..< products.count, id: \.self) { index in
//                        Text(self.products[index]).tag(index)
//                    }
//                }
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(5)
//                .onChange(of: ESDTS.Coat4ProductType) { _ in
//                    updateCovRate()
//                    checkPUCodes()
//                    checkPCoatCodes()
//                }
//                .onChange(of: ESDTS.Coat4PtA) { _ in
//                    updateCovRate()
//                }
//                .onChange(of: ESDTS.Coat4PtB) { _ in
//                    updateCovRate()
//                }
//                Spacer()
//                Text("Coating Thickness: 8-12 mils")
//                    .fontWeight(.heavy)
//                    .padding()
//                //               SplashTSFloorInfo()
//            }
//            .padding()
            
            // matting additive coat option
//            HStack {
//                Toggle(isOn: $ESDTS.Coat4MatAdd, label: {
//                    Text("Add Optional Matting Additive")
//                        .fontWeight(.bold)
//                    
//                })
//                .toggleStyle(CheckBoxToggleStyle())
//            }
//            .padding()
            
            // TSE Chosen
//            if ESDTS.Coat4ProductType == 0
//            {
//                Text("Top Shelf Epoxy® Part A:")
//                    .fontWeight(.bold)
//                Picker(selection: $ESDTS.Coat4PtA,
//                       label: ZStack {
//                    Text("\(typesA[ESDTS.Coat4PtA])")
//                        .opacity(1)
//                    Rectangle()
//                        .fill(Color.black)
//                        .opacity(0.9)
//                        .cornerRadius(5)
//                        .frame(width: 225, height: 25)
//                    //  .padding()
//                }) {
//                    ForEach (0 ..< typesA.count, id: \.self) { index in
//                        Text(self.typesA[index]).tag(index)
//                    }
//                }
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(5)
//
//                Text("Top Shelf Epoxy® Part B:")
//                    .fontWeight(.bold)
//                Picker(selection: $ESDTS.Coat4PtB,
//                       label: ZStack {
//                    Text("\(typesB[ESDTS.Coat4PtB])")
//                        .opacity(1)
//                    Rectangle()
//                        .fill(Color.gray)
//                        .opacity(0.2)
//                        .cornerRadius(5)
//                        .frame(width: 150, height: 25)
//                    //   .padding()
//                }) {
//                    ForEach (0 ..< typesB.count, id: \.self) { index in
//                        Text(self.typesB[index]).tag(index)
//                    }
//                }
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(5)
//                //             .onChange(of: ESDTS.Coat4PtB) { _ in
//                //                 CheckCoatChoices()
//                //             }
//                Text("Top Shelf Epoxy® Colorant:")
//                    .fontWeight(.bold)
//                Picker(selection: $ESDTS.Coat4TSColorant,
//                       label: ZStack {
//                    Text("\(TSColorantChoices[ESDTS.Coat4TSColorant])")
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
//            }
            // PA chosen

                HStack
                {
                    Text("Polyaspartic:")
                        .fontWeight(.bold)
                    //                Picker(selection: $ESDTS.Coat4PtA,
                    //                       label: ZStack {
                    //                    Text("\(typesA[ESDTS.Coat4PtA])")
                    //                        .opacity(1)
                    //                    Rectangle()
                    //                        .fill(Color.black)
                    //                        .opacity(0.9)
                    //                        .cornerRadius(5)
                    //                        .frame(width: 225, height: 25)
                    //                    //  .padding()
                    //                }) {
                    //                    ForEach (0 ..< PATypes.count, id: \.self) { index in
                    //                        Text(self.PATypes[index]).tag(index)
                    //                    }
                    //                }
                    //                .background(Color.gray.opacity(0.2))
                    //                .cornerRadius(5)
                    //                .onChange(of: ESDTS.Coat4PtA) { _ in
                    //                    checkPCoatCodes()
                    //                }
                    
                    Picker(selection: $ESDTS.Coat4PtB,
                           label: ZStack {
                        Text("\(hardeners[ESDTS.Coat4PtB])")
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
                    .onChange(of: ESDTS.Coat4PtB) { _ in
                        checkPCoatCodes()
                    }
                    Spacer()
                }
                .padding()
            
            // PU is chosen
//            else if ESDTS.Coat4ProductType == 2
//            {
//                HStack
//                {
//
//                    //                    Picker(selection: $ESDTS.Coat4PtA,
//                    //                           label: ZStack {
//                    //                        Text("\(typesA[ESDTS.Coat4PtA])")
//                    //                            .opacity(1)
//                    //                        Rectangle()
//                    //                            .fill(Color.black)
//                    //                            .opacity(0.9)
//                    //                            .cornerRadius(5)
//                    //                            .frame(width: 225, height: 25)
//                    //                        //  .padding()
//                    //                    }) {
//                    //                        ForEach (0 ..< PUTypes.count, id: \.self) { index in
//                    //                            Text(self.PUTypes[index]).tag(index)
//                    //                        }
//                    //                    }
//                    //                    .background(Color.gray.opacity(0.2))
//                    //                    .cornerRadius(5)
//                    //                    .onChange(of: ESDTS.Coat4PtA) { _ in
//                    // //                       updateCovRate()
//                    //                        checkPUCodes()
//                    //                    }
//                    //                    if ESDTS.Coat4PtA == 0
//                    //                    {
//                    //                    Picker(selection: $ESDTS.Coat4PtB,
//                    //                           label: ZStack {
//                    //                        Text("\(hardeners[ESDTS.Coat4PtB])")
//                    //                            .opacity(1)
//                    //                        Rectangle()
//                    //                            .fill(Color.black)
//                    //                            .opacity(0.9)
//                    //                            .cornerRadius(5)
//                    //                            .frame(width: 225, height: 25)
//                    //                        //  .padding()
//                    //                    }) {
//                    //                        ForEach (0 ..< hardeners.count, id: \.self) { index in
//                    //                            Text(self.hardeners[index]).tag(index)
//                    //                        }
//                    //                    }
//                    //                    .background(Color.gray.opacity(0.2))
//                    //                    .cornerRadius(5)
//                    //                    .onChange(of: ESDTS.Coat4PtB) { _ in
//                    ////                        updateCovRate()
//                    //                        checkPUCodes()
//                    //                    }
//                    //                    }
//                    //                    else
//                    //                    {
//                    //                        Picker(selection: $ESDTS.Coat4PtB,
//                    //                               label: ZStack {
//                    //                            Text("\(hardeners[ESDTS.Coat4PtB])")
//                    //                                .opacity(1)
//                    //                            Rectangle()
//                    //                                .fill(Color.black)
//                    //                                .opacity(0.9)
//                    //                                .cornerRadius(5)
//                    //                                .frame(width: 225, height: 25)
//                    //                            //  .padding()
//                    //                        }) {
//                    //                            ForEach (0 ..< puhpHardeners.count, id: \.self) { index in
//                    //                                Text(self.puhpHardeners[index]).tag(index)
//                    //                            }
//                    //                        }
//                    //                        .background(Color.gray.opacity(0.2))
//                    //                        .cornerRadius(5)
//                    //                        .onChange(of: ESDTS.Coat4PtB) { _ in
//                    //                            //                        updateCovRate()
//                    //                            checkPUCodes()
//                    //                        }
//                    //                    }
//                    //                    Spacer()
//                    //                }
//                }
//                //            // else, UPC is chosen
//                //            else
//                //            {
//                //                Text("UPC Colorant :")
//                //                    .fontWeight(.bold)
//                //                Picker(selection: $ESDTS.Coat4TSColorant,
//                //                       label: ZStack {
//                //                    Text("\(UPCColorantChoices[ESDTS.Coat4TSColorant])")
//                //                        .opacity(1)
//                //                    Rectangle()
//                //                        .fill(Color.gray)
//                //                        .opacity(0.2)
//                //                        .cornerRadius(5)
//                //                        .frame(width: 300, height: 25)
//                //                }) {
//                //                    ForEach (0 ..< UPCColorantChoices.count, id: \.self) { index in
//                //                        Text(self.UPCColorantChoices[index]).tag(index)
//                //                    }
//                //                }
//                //                .background(Color.gray.opacity(0.2))
//                //                .cornerRadius(5)
//                //            }
//
//
//                //
//                //            // texture picker
//                //            Text("Texture:")
//                //                .fontWeight(.bold)
//                //            Picker(selection: $ESDTS.Coat4Texture,
//                //                   label: ZStack {
//                //                Text("\(TextureOptions[ESDTS.Coat4Texture])")
//                //                    .opacity(1)
//                //                Rectangle()
//                //                    .fill(Color.black)
//                //                    .opacity(0.9)
//                //                    .cornerRadius(5)
//                //                    .frame(width: 225, height: 25)
//                //                //  .padding()
//                //            }) {
//                //                ForEach (0 ..< TextureOptions.count, id: \.self) { index in
//                //                    Text(self.TextureOptions[index]).tag(index)
//                //                }
//                //            }
//                //            .background(Color.gray.opacity(0.2))
//                //            .cornerRadius(5)
//                //            .onChange(of: ESDTS.Coat4Texture) { _ in
//                //                checkTexture()
//                //            }
//            }
            // poly colorant picker if TSE or UPC is not selected

                Text("Poly Colorant:")
                    .fontWeight(.bold)
                Picker(selection: $ESDTS.Coat4PColorant,
                       label: ZStack {
                    Text("\(PolyColorantChoices[ESDTS.Coat4PColorant])")
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
//                    if ESDTS.Coat4ProductType == 0
//                    {
//
//                        if ESDTS.Coat4PtA == 4 {
//                            HStack{
//                                Text("\(typesACodes[ESDTS.Coat4PtA])")
//                                    .font(.caption)
//                                Spacer()
//                                Text("TSE Part A: Ench. Green, 1 gal")
//                                    .font(.caption)
//                                Spacer()
//                                Text("\(quant(product: ESDTS_TSAC4))")
//                                    .font(.caption)
//                            }
//                        }
//                        else {
//                            HStack{
//                                Text("\(typesACodes[ESDTS.Coat4PtA])")
//                                    .font(.caption)
//                                Spacer()
//                                Text("TSE Part A: \(typesA[ESDTS.Coat4PtA]), 1 gal")
//                                    .font(.caption)
//                                Spacer()
//                                Text("\(quant(product: ESDTS_TSAC4))")
//                                    .font(.caption)
//                            }
//                        }
//                        HStack{
//                            Text("\(typesBCodes[ESDTS.Coat4PtB])")
//                                .font(.caption)
//                            Spacer()
//                            Text("Top Shelf® Epoxy Part B: \(typesB[ESDTS.Coat4PtB]), 1/2 gal")
//                                .font(.caption)
//                            Spacer()
//                            Text("\(quant(product: ESDTS_TSAC4))")
//                                .font(.caption)
//                        }
//                        if ESDTS.Coat4TSColorant != 0 {
//
//                            HStack {
//                                Text("\(TSColorantCodes[ESDTS.Coat4TSColorant])")
//                                    .font(.caption)
//                                Spacer()
//                                Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[ESDTS.Coat4TSColorant]), 16 oz")
//                                    .font(.caption)
//                                Spacer()
//                                Text("\(quant(product: ESDTS_TSColorantC4))")
//                                    .font(.caption)
//                            }
//
//                        }
//                        HStack {
//                            Text("EX-KESDADD-EA")
//                                .font(.caption)
//                            Spacer()
//                            Text("ESD Additive, 1 gal")
//                                .font(.caption)
//                            Spacer()
//                            Text("\(quant(product: ESDTS_TSAC4))")
//                                .font(.caption)
//                        }
//
//                        HStack {
//                            Text("N/A")
//                                .font(.caption)
//                            Spacer()
//                            Text("50/50 Bead 50 and Bead 100 Blend, 16 oz")
//                                .font(.caption)
//                            Spacer()
//                            Text("\(quant(product: ESDTS_TSAC4))")
//                                .font(.caption)
//                        }
//                    }
                        VStack
                    {
                        HStack
                        {
                            Text("\(PACodes[ESDTS.Coat4PtB])")
                                .font(.caption)
                            Spacer()
                            Text("Polyaspartic 92 Part A - \(hardeners[ESDTS.Coat4PtB]), 1 gal ")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: ESDTS_TSAC4))")
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
                            Text("\(quant(product: ESDTS_TSAC4))")
                                .font(.caption)
                            
                        }
                        
                        HStack {
                            Text("EX-KESDADD-EA")
                                .font(.caption)
                            Spacer()
                            Text("ESD Additive, 1 gal")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: ESDTS_TSAC4))")
                                .font(.caption)
                        }
                        
                        HStack {
                            Text("EX-KASB50-EA")
                                .font(.caption)
                            Spacer()
                            Text("Bead 50, 16 oz (Blend with bead 100)")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: ESDTS_TSAC4))")
                                .font(.caption)
                        }
                        
                        HStack {
                            Text("EX-KASB100-EA")
                                .font(.caption)
                            Spacer()
                            Text("Bead 100, 16 oz (Blend with bead 50)")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: ESDTS_TSAC4))")
                                .font(.caption)
                        }
                    }
                    
                    // polyurethane is chosen
//                    else if ESDTS.Coat4ProductType == 2
//                    {
//
//                        HStack
//                        {
//                            Text("EX-KPLYHPGA-EA")
//                                .font(.caption)
//                            Spacer()
//
//                            Text("Polyurethane HP Gloss Part A, 1 qt")
//                                .font(.caption)
//                            Spacer()
//
//                            Text("\(quant(product: ESDTS_TSAC4))")
//                                .font(.caption)
//                        }
//
//                        HStack
//                        {
//                            Text("EX-KPLYHPB-01")
//                                .font(.caption)
//                            Spacer()
//
//                            Text("Polyurethane HP Gloss Part B, 1 gal")
//                                .font(.caption)
//                            Spacer()
//
//                            Text("\(quant(product: ESDTS_TSAC4))")
//                                .font(.caption)
//                        }
//
//                        HStack
//                        {
//                            Text("EX-KSLVCLN-EA")
//                                .font(.caption)
//                            Spacer()
//
//                            Text("Solvent Cleaner, 1 qt")
//                                .font(.caption)
//                            Spacer()
//
//                            Text("\(quant(product: ESDTS_TSAC4))")
//                                .font(.caption)
//                        }
//
//                        HStack {
//                            Text("EX-KESDADD-EA")
//                                .font(.caption)
//                            Spacer()
//                            Text("ESD Additive, 1 gal")
//                                .font(.caption)
//                            Spacer()
//                            Text("\(quant(product: ESDTS_TSAC4))")
//                                .font(.caption)
//                        }
//
//                        HStack {
//                            Text("N/A")
//                                .font(.caption)
//                            Spacer()
//                            Text("50/50 Bead 50 and Bead 100 Blend, 16 oz")
//                                .font(.caption)
//                            Spacer()
//                            Text("\(quant(product: ESDTS_TSAC4))")
//                                .font(.caption)
//                        }
//
//
//                    }
                    

                    // poly colorant
                    if ESDTS.Coat4PColorant != 0
                    {
                        HStack
                        {
                            Text("\(PolyColorantCodes[ESDTS.Coat4PColorant])")
                                .font(.caption)
                            Spacer()
                            
                            Text("Poly Colorant - \(PolyColorantChoices[ESDTS.Coat4PColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: ESDTS_TSColorantC4))")
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
            

            
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $ESDTS.Coat4Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: ESDTS_TSAC4) + ESDTS.Coat4Waste) kit(s)")
            }
            .padding()
        }
}
    
    
    
    struct ESDTSCoat4_Previews: PreviewProvider {
        static var previews: some View {
            ESDTSView()
        }
    }

