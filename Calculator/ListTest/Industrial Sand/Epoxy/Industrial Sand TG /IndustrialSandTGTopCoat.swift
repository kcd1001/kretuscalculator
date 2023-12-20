//
//  SplashFloorTSCoat4.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

var SandTG_TSAC4 = stats2(product: "Top Shelf® Epoxy Part A:", covRate: 120, MixRat: 1)
var SandTG_TSBC4 = stats2(product: "Top Shelf® Epoxy Part B:", covRate: 120, MixRat: 0.5)
var SandTG_TSColorantC4 = stats2(product: "Top Shelf® Epoxy Colorant:", covRate: 120, MixRat: 16)

struct IndustrialSandTGTopCoat: View {
    
  
    let products = ["Top Shelf Epoxy®", "Polyaspartic", "Polyurethane", "UPC RC UV"]
    
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
    
    let PUTypes = ["Polyurethane HS", "Polyurethane HP"]
    
    let typesB = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let puhpHardeners = ["HP Gloss", "HP Satin"]

    
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
    
    @EnvironmentObject var SandTG : ColorQuartzTSValues //Used for coat selections
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
//        if SandTG.Coat4ProductType == 0
//        {
//            SandTG_TSAC4.covRate = 120
//            SandTG_TSBC4.covRate = 120
//        }
//        // change cov rate to 800 if polyA is chosen
//        else if SandTG.Coat4ProductType == 1
//        {
//            SandTG_TSAC4.covRate = 160
//            SandTG_TSBC4.covRate = 160
//        }
//        // else poly is chosen
//        else
//        {
//            SandTG_TSAC4.covRate = 120
//            SandTG_TSBC4.covRate = 120
//
////            // if poly hs is chosen
////            if SandTG.Coat4PtA == 0
////            {
////                TSAC4.covRate = 600
////                TSBC4.covRate = 600
////            }
////            // HP clear gloss
////            else if SandTG.Coat4PtA == 1
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
        
        if SandTG.Coat4PtA == 0 && SandTG.Coat4PtB == 0 {
            SandTG.PCoatPtACode = "EX-KPLY72AZ-01"
            SandTG.PCoatHardenerCode = "EX-KPLY72B-01"
        }
        else if SandTG.Coat4PtA == 0 && SandTG.Coat4PtB == 1 {
            SandTG.PCoatPtACode = "EX-KPLY72AF-01"
            SandTG.PCoatHardenerCode = "EX-KPLY72B-01"
            
        }
        else if SandTG.Coat4PtA == 1 && SandTG.Coat4PtB == 0 {
            SandTG.PCoatPtACode = "EX-KPLY85AZ-01"
            SandTG.PCoatHardenerCode = "EX-KPLY85B-01"
        }
        else if SandTG.Coat4PtA == 1 && SandTG.Coat4PtB == 1 {
            SandTG.PCoatPtACode = "EX-KPLY85AF-01"
            SandTG.PCoatHardenerCode = "EX-KPLY85B-01"
            
        }
        else if SandTG.Coat4PtA == 2 && SandTG.Coat4PtB == 0 {
            SandTG.PCoatPtACode = "EX-KPLY92AZ-01"
            SandTG.PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
        else if SandTG.Coat4PtA == 2 && SandTG.Coat4PtB == 1 {
            SandTG.PCoatPtACode = "EX-KPLY92AF-01"
            SandTG.PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
    }
    func checkPUCodes() -> Void
    {
        // POLY HS EZ
        if SandTG.Coat4PtA == 0 && SandTG.Coat4PtB == 0 {
            SandTG.PUPtACode = "EX-KPLYHSAZ-01"
            SandTG.PUHardenerCode = "EX-KPLYHSB-01"
        }
        // POLY HS FAST
        else if SandTG.Coat4PtA == 0 && SandTG.Coat4PtB == 1 {
            SandTG.PUPtACode = "EX-KPLYHSAF-01"
            SandTG.PUHardenerCode = "EX-KPLYHSB-01"
            
        }
    }
    func updateCovRate() -> Void
    {
        // changes sand size in order to fix cov updating issue
        let temp = SandTG.BroadcastSizeSelection
        SandTG.BroadcastSizeSelection = 0
        SandTG.BroadcastSizeSelection = temp
        
        // Base Coat rates
        if SandTG.BroadcastSizeSelection == 0
        {
            TSABC_SandTG.covRate = 120
            TSBBC_SandTG.covRate = 120
            TSColorantBC_SandTG.covRate = 120

            
        }
        else if SandTG.BroadcastSizeSelection == 1
        {
            TSABC_SandTG.covRate = 210
            TSBBC_SandTG.covRate = 210
            TSColorantBC_SandTG.covRate = 210
            

            
        }
        
        else
        {
            TSABC_SandTG.covRate = 210
            TSBBC_SandTG.covRate = 210
            TSColorantBC_SandTG.covRate = 210

        }
        
        // TSE cov rate
        if SandTG.Coat3ProductType == 0
        {
            if SandTG.BroadcastSizeSelection == 0
            {
                SandTG_TSAC3.covRate = 120
                SandTG_TSBC3.covRate = 120
                SandTG_TSColorantC3.covRate = 120
            }
            
            else if SandTG.BroadcastSizeSelection == 1
            {
                SandTG_TSAC3.covRate = 170
                SandTG_TSBC3.covRate = 170
                SandTG_TSColorantC3.covRate = 170
            }
            else if SandTG.BroadcastSizeSelection == 2
            {
                SandTG_TSAC3.covRate = 200
                SandTG_TSBC3.covRate = 200
                SandTG_TSColorantC3.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandTG.Coat3ProductType == 1
        {
            if SandTG.BroadcastSizeSelection == 0
            {
                SandTG_TSAC3.covRate = 160
                SandTG_TSBC3.covRate = 160
                SandTG_TSColorantC3.covRate = 160
            }
            
            else if SandTG.BroadcastSizeSelection == 1
            {
                SandTG_TSAC3.covRate = 230
                SandTG_TSBC3.covRate = 230
                SandTG_TSColorantC3.covRate = 230
            }
            else if SandTG.BroadcastSizeSelection == 2
            {
                SandTG_TSAC3.covRate = 270
                SandTG_TSBC3.covRate = 270
                SandTG_TSColorantC3.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandTG.Coat3ProductType == 2
        {
            if SandTG.BroadcastSizeSelection == 0
            {
                SandTG_TSAC3.covRate = 120
                SandTG_TSBC3.covRate = 120
                SandTG_TSColorantC3.covRate = 120
            }
            
            else if SandTG.BroadcastSizeSelection == 1
            {
                SandTG_TSAC3.covRate = 170
                SandTG_TSBC3.covRate = 170
                SandTG_TSColorantC3.covRate = 170
            }
            else if SandTG.BroadcastSizeSelection == 2
            {
                SandTG_TSAC3.covRate = 200
                SandTG_TSBC3.covRate = 200
                SandTG_TSColorantC3.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandTG.Coat3ProductType == 3
        {
            if SandTG.BroadcastSizeSelection == 0
            {
                SandTG_TSAC3.covRate = 100
                SandTG_TSBC3.covRate = 100
                SandTG_TSColorantC3.covRate = 100
            }
            
            else if SandTG.BroadcastSizeSelection == 1
            {
                SandTG_TSAC3.covRate = 150
                SandTG_TSBC3.covRate = 150
                SandTG_TSColorantC3.covRate = 150
            }
            else if SandTG.BroadcastSizeSelection == 2
            {
                SandTG_TSAC3.covRate = 200
                SandTG_TSBC3.covRate = 200
                SandTG_TSColorantC3.covRate = 200
            }
        }
        // TOP COAT
        // TSE cov rate
        if SandTG.Coat4ProductType == 0
        {
            
            SandTG_TSAC4.covRate = 400
            SandTG_TSBC4.covRate = 400
            SandTG_TSColorantC4.covRate = 400
            
        }
        // PolyA is chosen in cap coat
        else if SandTG.Coat4ProductType == 1
        {
            SandTG_TSAC4.covRate = 450
            SandTG_TSBC4.covRate = 450
            SandTG_TSColorantC4.covRate = 450
        }
        // PolyU in cap coat
        else if SandTG.Coat4ProductType == 2
        {
            // Poly HS
            if SandTG.Coat4PtA == 0
            {
                
                SandTG_TSAC4.covRate = 340
                SandTG_TSBC4.covRate = 340
                SandTG_TSColorantC4.covRate = 340
            }
            
            // Poly HP
            else
            {
                // gloss
                if SandTG.Coat4PtB == 0
                {
                    SandTG_TSAC4.covRate = 575
                    SandTG_TSBC4.covRate = 575
                    SandTG_TSColorantC4.covRate = 575
                }
                // satin
                else
                {
                    SandTG_TSAC4.covRate = 675
                    SandTG_TSBC4.covRate = 675
                    SandTG_TSColorantC4.covRate = 675
                }
            }
        }
        
        // UPC in cap coat
        else if SandTG.Coat4ProductType == 3
        {
            SandTG_TSAC4.covRate = 190
            SandTG_TSBC4.covRate = 190
            SandTG_TSColorantC4.covRate = 190
        }
    }
    
    func checkTexture() -> Void
    {
        // check if bead is chosen
        if SandTG.Coat4Texture > 2
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
                Text("Coat 3 Product:")
                    .fontWeight(.bold)
                Picker(selection: $SandTG.Coat4ProductType,
                       label: ZStack {
                    Text("\(products[SandTG.Coat4ProductType])")
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
                .onChange(of: SandTG.Coat4ProductType) { _ in
 //                  updateCovRate()
                    checkPUCodes()
                    checkPCoatCodes()
                    }
                Spacer()
 //               SplashTSFloorInfo()
            }
            .padding()
            
            // matting additive coat option
            HStack {
                Toggle(isOn: $SandTG.Coat4MatAdd, label: {
                    Text("Add Optional Matting Additive")
                        .fontWeight(.bold)
                    
                })
                .toggleStyle(CheckBoxToggleStyle())
            }
            .padding()
            
            if SandTG.Coat4ProductType == 0
            {
            Text("Top Shelf Epoxy® Part A:")
                .fontWeight(.bold)
            Picker(selection: $SandTG.Coat4PtA,
                   label: ZStack {
                Text("\(typesA[SandTG.Coat4PtA])")
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
            Picker(selection: $SandTG.Coat4PtB,
                   label: ZStack {
                Text("\(typesB[SandTG.Coat4PtB])")
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
            //             .onChange(of: SandTG.Coat4PtB) { _ in
            //                 CheckCoatChoices()
            //             }
            Text("Top Shelf Epoxy® Colorant:")
                .fontWeight(.bold)
            Picker(selection: $SandTG.Coat4TSColorant,
                   label: ZStack {
                Text("\(TSColorantChoices[SandTG.Coat4TSColorant])")
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
            // PA chosen
            else if SandTG.Coat4ProductType == 1
            {
                HStack
                {
                Text("Polyaspartic:")
                    .fontWeight(.bold)
                Picker(selection: $SandTG.Coat4PtA,
                       label: ZStack {
                    Text("\(typesA[SandTG.Coat4PtA])")
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
                .onChange(of: SandTG.Coat4PtA) { _ in
                    checkPCoatCodes()
                }
                
                Picker(selection: $SandTG.Coat4PtB,
                       label: ZStack {
                    Text("\(hardeners[SandTG.Coat4PtB])")
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
                .onChange(of: SandTG.Coat4PtB) { _ in
                    checkPCoatCodes()
                }
                Spacer()
                }
                .padding()
            }
            // PU is chosen
            else if SandTG.Coat4ProductType == 2
            {
                HStack
                {
                    Text("Polyurethane:")
                        .fontWeight(.bold)
                    Picker(selection: $SandTG.Coat4PtA,
                           label: ZStack {
                        Text("\(typesA[SandTG.Coat4PtA])")
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
                    .onChange(of: SandTG.Coat4PtA) { _ in
 //                       updateCovRate()
                        checkPUCodes()
                    }
                    if SandTG.Coat4PtA == 0
                    {
                    Picker(selection: $SandTG.Coat4PtB,
                           label: ZStack {
                        Text("\(hardeners[SandTG.Coat4PtB])")
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
                    .onChange(of: SandTG.Coat4PtB) { _ in
//                        updateCovRate()
                        checkPUCodes()
                    }
                    }
                    else
                    {
                        Picker(selection: $SandTG.Coat4PtB,
                               label: ZStack {
                            Text("\(hardeners[SandTG.Coat4PtB])")
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
                        .onChange(of: SandTG.Coat4PtB) { _ in
                            //                        updateCovRate()
                            checkPUCodes()
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            // else, UPC is chosen
            else
            {
                Text("UPC Colorant :")
                    .fontWeight(.bold)
                Picker(selection: $SandTG.Coat4TSColorant,
                       label: ZStack {
                    Text("\(UPCColorantChoices[SandTG.Coat4TSColorant])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 300, height: 25)
                }) {
                    ForEach (0 ..< UPCColorantChoices.count, id: \.self) { index in
                        Text(self.UPCColorantChoices[index]).tag(index)
                    }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            }
            
            // poly colorant picker if TSE or UPC is not selected
            if SandTG.Coat4ProductType != 0 && SandTG.Coat4ProductType != 3
            {
                Text("Poly Colorant:")
                    .fontWeight(.bold)
                Picker(selection: $SandTG.Coat4PColorant,
                       label: ZStack {
                    Text("\(PolyColorantChoices[SandTG.Coat4PColorant])")
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
//            
//            // texture picker
//            Text("Texture:")
//                .fontWeight(.bold)
//            Picker(selection: $SandTG.Coat4Texture,
//                   label: ZStack {
//                Text("\(TextureOptions[SandTG.Coat4Texture])")
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
//            .onChange(of: SandTG.Coat4Texture) { _ in
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
                if SandTG.Coat4ProductType == 0
                {
                
                if SandTG.Coat4PtA == 4 {
                    HStack{
                        Text("\(typesACodes[SandTG.Coat4PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandTG_TSAC4))")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[SandTG.Coat4PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[SandTG.Coat4PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandTG_TSAC4))")
                            .font(.caption)
                    }
                }
                HStack{
                    Text("\(typesBCodes[SandTG.Coat4PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[SandTG.Coat4PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandTG_TSAC4))")
                        .font(.caption)
                }
                if SandTG.Coat4TSColorant != 0 {

                        HStack {
                            Text("\(TSColorantCodes[SandTG.Coat4TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SandTG.Coat4TSColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: SandTG_TSColorantC4))")
                                .font(.caption)
                        }
                    
                }
                }
            else if SandTG.Coat4ProductType == 1
            {
                HStack
                {
                    Text("\(PCoatPtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandTG.Coat4PtA]) - \(hardeners[SandTG.Coat4PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandTG_TSAC4))")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(PCoatHardenerCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandTG.Coat4PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandTG_TSAC4))")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else if SandTG.Coat4ProductType == 2
            {
                
                HStack
                {
                    Text("\(PUPtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if SandTG.Coat4PtA == 0
                    {
                    Text("\(PUTypes[SandTG.Coat4PtA]) - \(hardeners[SandTG.Coat4PtB]) Part A, 1 gal ")
                        .font(.caption)
                    }
                    // Poly HP
                    else
                    {
                        if SandTG.Coat4PtB == 0
                        {
                            Text("\(PUTypes[SandTG.Coat4PtA]) Part A - \(puhpHardeners[SandTG.Coat4PtB]), 1/4 gal ")
                                .font(.caption)
                        }
                        else
                        {
                            Text("\(PUTypes[SandTG.Coat4PtA]) Part A - \(puhpHardeners[SandTG.Coat4PtB]), 1/2 gal ")
                                .font(.caption)
                        }
                    }

                    Spacer()
                    Text("\(quant(product: SandTG_TSAC4))")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(PUHardenerCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if SandTG.Coat4PtA == 0
                    {
                    Text("\(PUTypes[SandTG.Coat4PtA]) Part B, 1/2 gal ")
                        .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[SandTG.Coat4PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: SandTG_TSAC4))")
                        .font(.caption)
                    
                }
            }
            // UPC is chosen
            else
            {
                HStack{
                    Text("EX-KUPCARC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - RC/TT, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandTG_TSAC4))")
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
                    Text("\(quant(product: SandTG_TSAC4 ))")
                        .font(.caption)
                }
                HStack { // Part C
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6#")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandTG_TSAC4))")
                        .font(.caption)
                }
                // upc colorant
                if SandTG.Coat4TSColorant != 0
                {
                    HStack
                    {
                        Text("\(UPCColorantCodes[SandTG.Coat4TSColorant])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant - \(UPCColorantChoices[SandTG.Coat4TSColorant]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: UPCColorant))")
                            .font(.caption)
                    }
                }
                // TODO - poly accelerant
                
            }
                // poly colorant
                if SandTG.Coat4PColorant != 0 && (SandTG.Coat4ProductType != 0 || SandTG.Coat4ProductType != 3)
                {
                    HStack
                    {
                        Text("\(PolyColorantCodes[SandTG.Coat4PColorant])")
                            .font(.caption)
                        Spacer()
                       
                        Text("Poly Colorant - \(PolyColorantChoices[SandTG.Coat4PColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandTG_TSColorantC4))")
                            .font(.caption)
                        
                    }
                }

                if SandTG.Coat4MatAdd == true
                {
                    HStack
                    {
                        Text("EX-KMATADD-EA")
                            .font(.caption)
                        Spacer()
                        Text("Matting Additive, 1# ")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandTG_TSAC4))")
                            .font(.caption)
                    }
                }
                
                if SandTG.Coat4ProductType != 3
                {
                    HStack
                    {
                        Text("EX-KASB100-EA")
                            .font(.caption)
                        Spacer()
                        Text("Anti-Slip Bead 100")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandTG_TSAC4))")
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
                        Text("\(quant(product: SandTG_TSAC4))")
                            .font(.caption)
                    }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            }
        .onChange(of: SandTG.Coat4ProductType) { _ in
            updateCovRate()
            checkPUCodes()
            checkPCoatCodes()
        }
        .onChange(of: SandTG.Coat4PtA) { _ in
            updateCovRate()
        }
        .onChange(of: SandTG.Coat4PtB) { _ in
            updateCovRate()
        }
        
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandTG.Coat4Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: SandTG_TSAC4) + SandTG.Coat4Waste) kit(s)")
            }
            .padding()
        }
    }



struct IndustrialSandTGCoat4_Previews: PreviewProvider {
    static var previews: some View {
        IndustrialSandTGView()
    }
}
