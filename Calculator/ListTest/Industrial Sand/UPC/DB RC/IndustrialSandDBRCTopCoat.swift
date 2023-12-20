//
//  SplashFloorTSCoat4.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

var SandDBRC_TSAC4 = stats2(product: "Top Shelf® Epoxy Part A:", covRate: 120, MixRat: 1)
var SandDBRC_TSBC4 = stats2(product: "Top Shelf® Epoxy Part B:", covRate: 120, MixRat: 0.5)
var SandDBRC_TSColorantC4 = stats2(product: "Top Shelf® Epoxy Colorant:", covRate: 120, MixRat: 16)

struct IndustrialSandDBRCTopCoat: View {
    
  
    let products = ["Polyaspartic", "Polyurethane", "UPC RC UV"]
    
    let typesA = ["A Resin - Beige", "A Resin - Black", "A Resin - Clear", "A Resin - Dark Gray",
                  "A Resin - Enchanted Green", "A Resin - Handicap Blue","A Resin - Latte",
                  "A Resin - Light Gray", "A Resin - Medium Gray", "A Resin - Mocha",
                  "A Resin - Safety Blue", "A Resin - Safety Red", "A Resin - Safety Yellow",
                  "A Resin - Shadow Gray", "A Resin - Tan", "A Resin - Tile Red", "A Resin - White",
                  "CR Resin - Clear", "LG Resin - Clear"]
    
    let PATypes = ["Polyaspartic 72", "Polyaspartic 85", "Polyaspartic 92 Low Odor"]
    
    let PUTypes = ["Polyurethane HS", "Polyurethane HP"]
    
    let UPCTypes = [ "UPC RC UV", "UPC RC" ]
    
    let typesACodes = ["EX-KTSARBG-01", "EX-KTSARBL-01", "EX-KTSARCL-01", "EX-KTSARDG-01", "EX-KTSAREG-01",
                       "EX-KTSARHB-01", "EX-KTSARLT-01","EX-KTSARLG-01", "EX-KTSARMG-01", "EX-KTSARMH-01",
                       "EX-KTSARSB-01", "EX-KTSARSR-01", "EX-KTSARSY-01", "EX-KTSARSG-01", "EX-KTSARTN-01",
                       "EX-KTSARTR-01", "EX-KTSARWH-01", "EX-KTSECRRC-01", "Contact Distributor"]
    
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
    
    
//    func updateCovRate() -> Void
//    {
//        // TSE cov rate
//        if SandRC.Coat4ProductType == 0
//        {
//            SandDBRC_TSAC4.covRate = 120
//            SandDBRC_TSBC4.covRate = 120
//        }
//        // change cov rate to 800 if polyA is chosen
//        else if SandRC.Coat4ProductType == 1
//        {
//            SandDBRC_TSAC4.covRate = 160
//            SandDBRC_TSBC4.covRate = 160
//        }
//        // else poly is chosen
//        else
//        {
//            SandDBRC_TSAC4.covRate = 120
//            SandDBRC_TSBC4.covRate = 120
//
////            // if poly hs is chosen
////            if SandRC.Coat4PtA == 0
////            {
////                TSAC4.covRate = 600
////                TSBC4.covRate = 600
////            }
////            // HP clear gloss
////            else if SandRC.Coat4PtA == 1
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
        
        if SandRC.Coat4PtA == 0 && SandRC.Coat4PtB == 0 {
            SandRC.PCoatPtACode = "EX-KPLY72AZ-01"
            SandRC.PCoatHardenerCode = "EX-KPLY72B-01"
        }
        else if SandRC.Coat4PtA == 0 && SandRC.Coat4PtB == 1 {
            SandRC.PCoatPtACode = "EX-KPLY72AF-01"
            SandRC.PCoatHardenerCode = "EX-KPLY72B-01"
            
        }
        else if SandRC.Coat4PtA == 1 && SandRC.Coat4PtB == 0 {
            SandRC.PCoatPtACode = "EX-KPLY85AZ-01"
            SandRC.PCoatHardenerCode = "EX-KPLY85B-01"
        }
        else if SandRC.Coat4PtA == 1 && SandRC.Coat4PtB == 1 {
            SandRC.PCoatPtACode = "EX-KPLY85AF-01"
            SandRC.PCoatHardenerCode = "EX-KPLY85B-01"
            
        }
        else if SandRC.Coat4PtA == 2 && SandRC.Coat4PtB == 0 {
            SandRC.PCoatPtACode = "EX-KPLY92AZ-01"
            SandRC.PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
        else if SandRC.Coat4PtA == 2 && SandRC.Coat4PtB == 1 {
            SandRC.PCoatPtACode = "EX-KPLY92AF-01"
            SandRC.PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
    }
    func checkPUCodes() -> Void
    {
        // POLY HS EZ
        if SandRC.Coat4PtA == 0 && SandRC.Coat4PtB == 0 {
            SandRC.PUPtACode = "EX-KPLYHSAZ-01"
            SandRC.PUHardenerCode = "EX-KPLYHSB-01"
        }
        // POLY HS FAST
        else if SandRC.Coat4PtA == 0 && SandRC.Coat4PtB == 1 {
            SandRC.PUPtACode = "EX-KPLYHSAF-01"
            SandRC.PUHardenerCode = "EX-KPLYHSB-01"
            
        }
    }
    func updateCovRate() -> Void
    {
        // changes sand size in order to fix cov updating issue
        let temp = SandRC.BroadcastSizeSelection
        SandRC.BroadcastSizeSelection = 0
        SandRC.BroadcastSizeSelection = temp
        
        // Base Coat rates
        if SandRC.BroadcastSizeSelection == 0
        {
            TSABC_SandRC.covRate = 120
            TSBBC_SandRC.covRate = 120
            TSColorantBC_SandRC.covRate = 120

            
        }
        else if SandRC.BroadcastSizeSelection == 1
        {
            TSABC_SandRC.covRate = 210
            TSBBC_SandRC.covRate = 210
            TSColorantBC_SandRC.covRate = 210
            

            
        }
        
        else
        {
            TSABC_SandRC.covRate = 210
            TSBBC_SandRC.covRate = 210
            TSColorantBC_SandRC.covRate = 210

        }
        
        // TSE cov rate
        if SandRC.Coat3ProductType == 0
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandDBRC_TSAC3.covRate = 120
                SandDBRC_TSBC3.covRate = 120
                SandDBRC_TSColorantC3.covRate = 120
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandDBRC_TSAC3.covRate = 170
                SandDBRC_TSBC3.covRate = 170
                SandDBRC_TSColorantC3.covRate = 170
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandDBRC_TSAC3.covRate = 200
                SandDBRC_TSBC3.covRate = 200
                SandDBRC_TSColorantC3.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandRC.Coat3ProductType == 1
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandDBRC_TSAC3.covRate = 160
                SandDBRC_TSBC3.covRate = 160
                SandDBRC_TSColorantC3.covRate = 160
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandDBRC_TSAC3.covRate = 230
                SandDBRC_TSBC3.covRate = 230
                SandDBRC_TSColorantC3.covRate = 230
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandDBRC_TSAC3.covRate = 270
                SandDBRC_TSBC3.covRate = 270
                SandDBRC_TSColorantC3.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandRC.Coat3ProductType == 2
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandDBRC_TSAC3.covRate = 120
                SandDBRC_TSBC3.covRate = 120
                SandDBRC_TSColorantC3.covRate = 120
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandDBRC_TSAC3.covRate = 170
                SandDBRC_TSBC3.covRate = 170
                SandDBRC_TSColorantC3.covRate = 170
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandDBRC_TSAC3.covRate = 200
                SandDBRC_TSBC3.covRate = 200
                SandDBRC_TSColorantC3.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandRC.Coat3ProductType == 3
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandDBRC_TSAC3.covRate = 100
                SandDBRC_TSBC3.covRate = 100
                SandDBRC_TSColorantC3.covRate = 100
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandDBRC_TSAC3.covRate = 150
                SandDBRC_TSBC3.covRate = 150
                SandDBRC_TSColorantC3.covRate = 150
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandDBRC_TSAC3.covRate = 200
                SandDBRC_TSBC3.covRate = 200
                SandDBRC_TSColorantC3.covRate = 200
            }
        }
        // TOP COAT
        // PolyA chosen
        if SandRC.Coat4ProductType == 0
        {
            
            SandDBRC_TSAC4.covRate = 450
            SandDBRC_TSBC4.covRate = 450
            SandDBRC_TSColorantC4.covRate = 450
            
        }

        // PolyU in cap coat
        else if SandRC.Coat4ProductType == 1
        {
            // Poly HS
            if SandRC.Coat4PtA == 0
            {
                
                SandDBRC_TSAC4.covRate = 340
                SandDBRC_TSBC4.covRate = 340
                SandDBRC_TSColorantC4.covRate = 340
            }
            
            // Poly HP
            else
            {
                // gloss
                if SandRC.Coat4PtB == 0
                {
                    SandDBRC_TSAC4.covRate = 575
                    SandDBRC_TSBC4.covRate = 575
                    SandDBRC_TSColorantC4.covRate = 575
                }
                // satin
                else
                {
                    SandDBRC_TSAC4.covRate = 675
                    SandDBRC_TSBC4.covRate = 675
                    SandDBRC_TSColorantC4.covRate = 675
                }
            }
        }
        
        // UPC in cap coat
        else
        {
            SandDBRC_TSAC4.covRate = 190
            SandDBRC_TSBC4.covRate = 190
            SandDBRC_TSColorantC4.covRate = 190
        }
    }
    
    func checkTexture() -> Void
    {
        // check if bead is chosen
        if SandRC.Coat4Texture > 2
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
                Text("Top Coat Product:")
                    .fontWeight(.bold)
                Picker(selection: $SandRC.Coat4ProductType,
                       label: ZStack {
                    Text("\(products[SandRC.Coat4ProductType])")
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
                .onChange(of: SandRC.Coat4ProductType) { _ in
 //                  updateCovRate()
                    checkPUCodes()
                    checkPCoatCodes()
                    }
                Spacer()
                Text("Coating Thickness: 8-12 mils")
                    .fontWeight(.heavy)
                    .padding()
 //               SplashTSFloorInfo()
            }
            .padding()
            
            // PA chosen
            if SandRC.Coat4ProductType == 0
            {
                HStack
                {
                Text("Polyaspartic:")
                    .fontWeight(.bold)
                Picker(selection: $SandRC.Coat4PtA,
                       label: ZStack {
                    Text("\(typesA[SandRC.Coat4PtA])")
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
                .onChange(of: SandRC.Coat4PtA) { _ in
                    checkPCoatCodes()
                }
                
                Picker(selection: $SandRC.Coat4PtB,
                       label: ZStack {
                    Text("\(hardeners[SandRC.Coat4PtB])")
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
                .onChange(of: SandRC.Coat4PtB) { _ in
                    checkPCoatCodes()
                }
                Spacer()
                }
                .padding()
            }
            // PU is chosen
            else if SandRC.Coat4ProductType == 1
            {
                HStack
                {
                    Text("Polyurethane:")
                        .fontWeight(.bold)
                    Picker(selection: $SandRC.Coat4PtA,
                           label: ZStack {
                        Text("\(typesA[SandRC.Coat4PtA])")
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
                    .onChange(of: SandRC.Coat4PtA) { _ in
 //                       updateCovRate()
                        checkPUCodes()
                    }
                    if SandRC.Coat4PtA == 0
                    {
                    Picker(selection: $SandRC.Coat4PtB,
                           label: ZStack {
                        Text("\(hardeners[SandRC.Coat4PtB])")
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
                    .onChange(of: SandRC.Coat4PtB) { _ in
//                        updateCovRate()
                        checkPUCodes()
                    }
                    }
                    else
                    {
                        Picker(selection: $SandRC.Coat4PtB,
                               label: ZStack {
                            Text("\(hardeners[SandRC.Coat4PtB])")
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
                        .onChange(of: SandRC.Coat4PtB) { _ in
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
                HStack{
                    VStack{
                        Text("UPC Type: ")
                            .fontWeight(.bold)
                        // picker for upc type
                        Picker(selection: $SandRC.Coat4PtA,
                               label: ZStack {
                            Text("\(UPCTypes[SandRC.Coat4PtA])")
                                .opacity(1)
                            Rectangle()
                                .fill(Color.gray)
                                .opacity(0.2)
                                .cornerRadius(5)
                                .frame(width: 300, height: 25)
                        }) {
                            ForEach (0 ..< UPCTypes.count, id: \.self) { index in
                                Text(self.UPCTypes[index]).tag(index)
                            }
                        }
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    }
                    // hardener picker if UV isn't chosen
                    if SandRC.Coat4PtA == 1
                    {
                        VStack
                        {
                            Text("UPC Part B: ")
                                .fontWeight(.bold)
                            Picker(selection: $SandRC.Coat4PtB,
                                   label: ZStack {
                                Text("\(typesB[SandRC.Coat4PtB])")
                                    .opacity(1)
                                Rectangle()
                                    .fill(Color.black)
                                    .opacity(0.9)
                                    .cornerRadius(5)
                                    .frame(width: 225, height: 25)
                                //  .padding()
                            }) {
                                ForEach (0 ..< 3, id: \.self) { index in
                                    Text(self.typesB[index]).tag(index)
                                }
                            }
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                            Spacer()
                        }
                        .padding()
                    }
                }
                

                
                HStack
                {
                    Text("UPC Colorant :")
                        .fontWeight(.bold)
                    Picker(selection: $SandRC.Coat4TSColorant,
                           label: ZStack {
                        Text("\(UPCColorantChoices[SandRC.Coat4TSColorant])")
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
                    Spacer()

                }
                .padding()
            }
            
            // poly colorant picker if TSE or UPC is not selected
            if SandRC.Coat4ProductType != 0 && SandRC.Coat4ProductType != 3
            {
                HStack
                {
                    Text("Poly Colorant:")
                        .fontWeight(.bold)
                    Picker(selection: $SandRC.Coat4PColorant,
                           label: ZStack {
                        Text("\(PolyColorantChoices[SandRC.Coat4PColorant])")
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
                    Spacer()

                }
                .padding()
            }
            
            // matting additive coat option
            HStack {
                Toggle(isOn: $SandRC.Coat4MatAdd, label: {
                    Text("Add Optional Matting Additive")
                        .fontWeight(.bold)
                    
                })
                .toggleStyle(CheckBoxToggleStyle())
            }
            .padding()
            
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
                    Text("\(PCoatPtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandRC.Coat4PtA]) - \(hardeners[SandRC.Coat4PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandDBRC_TSAC4))")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(PCoatHardenerCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandRC.Coat4PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandDBRC_TSAC4))")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else if SandRC.Coat4ProductType == 1
            {
                
                HStack
                {
                    Text("\(PUPtACode)")
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
                    Text("\(quant(product: SandDBRC_TSAC4))")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(PUHardenerCode)")
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
                    Text("\(quant(product: SandDBRC_TSAC4))")
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
                        Text("\(quant(product: SandDBRC_TSAC4))")
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
                        Text("\(quant(product: SandDBRC_TSAC4 ))")
                            .font(.caption)
                    }
                    HStack { // Part C
                        Text("EX-KUPCRFC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - RC, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandDBRC_TSAC4))")
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
                        Text("\(quant(product: SandDBRC_TSAC4))")
                            .font(.caption)
                    }
                    
                    HStack
                    {
                        Text("EX-BRCUVAP6-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part B - \(Text("\(typesB[SandRC.Coat4PtB])") ), 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandDBRC_TSAC4 ))")
                            .font(.caption)
                    }
                    HStack { // Part C
                        Text("EX-KUPCRFC-EA")
                            .font(.caption)
                        Spacer()
                        Text("UPC Part C - RC, 6#")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandDBRC_TSAC4))")
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
                        Text("\(quant(product: UPCColorant))")
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
                        Text("\(quant(product: SandDBRC_TSColorantC4))")
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
                        Text("\(quant(product: SandDBRC_TSAC4))")
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
                        Text("\(quant(product: SandDBRC_TSAC4))")
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
                        Text("\(quant(product: SandDBRC_TSAC4))")
                            .font(.caption)
                    }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            }
        .onChange(of: SandRC.Coat4ProductType) { _ in
            updateCovRate()
            checkPUCodes()
            checkPCoatCodes()
        }
        .onChange(of: SandRC.Coat4PtA) { _ in
            updateCovRate()
        }
        .onChange(of: SandRC.Coat4PtB) { _ in
            updateCovRate()
        }
        
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandRC.Coat4Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: SandDBRC_TSAC4) + SandRC.Coat4Waste) kit(s)")
            }
            .padding()
        }
    }



struct IndustrialSandDBRCCoat4_Previews: PreviewProvider {
    static var previews: some View {
        IndustrialSandRCView()
    }
}
