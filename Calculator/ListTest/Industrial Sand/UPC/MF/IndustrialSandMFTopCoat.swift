//
//  SplashFloorTSCoat4.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

var SandMF_TSAC4 = stats2(product: "Top Shelf® Epoxy Part A:", covRate: 120, MixRat: 1)
var SandMF_TSBC4 = stats2(product: "Top Shelf® Epoxy Part B:", covRate: 120, MixRat: 0.5)
var SandMF_TSColorantC4 = stats2(product: "Top Shelf® Epoxy Colorant:", covRate: 120, MixRat: 16)

struct IndustrialSandMFTopCoat: View {
    
    
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
    
    @EnvironmentObject var SandMF : ColorQuartzTSValues //Used for coat selections
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
    //        if SandMF.Coat4ProductType == 0
    //        {
    //            SandMF_TSAC4.covRate = 120
    //            SandMF_TSBC4.covRate = 120
    //        }
    //        // change cov rate to 800 if polyA is chosen
    //        else if SandMF.Coat4ProductType == 1
    //        {
    //            SandMF_TSAC4.covRate = 160
    //            SandMF_TSBC4.covRate = 160
    //        }
    //        // else poly is chosen
    //        else
    //        {
    //            SandMF_TSAC4.covRate = 120
    //            SandMF_TSBC4.covRate = 120
    //
    ////            // if poly hs is chosen
    ////            if SandMF.Coat4PtA == 0
    ////            {
    ////                TSAC4.covRate = 600
    ////                TSBC4.covRate = 600
    ////            }
    ////            // HP clear gloss
    ////            else if SandMF.Coat4PtA == 1
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
        
        if SandMF.Coat4PtA == 0 && SandMF.Coat4PtB == 0 {
            SandMF.PCoatPtACode = "EX-KPLY72AZ-01"
            SandMF.PCoatHardenerCode = "EX-KPLY72B-01"
        }
        else if SandMF.Coat4PtA == 0 && SandMF.Coat4PtB == 1 {
            SandMF.PCoatPtACode = "EX-KPLY72AF-01"
            SandMF.PCoatHardenerCode = "EX-KPLY72B-01"
            
        }
        else if SandMF.Coat4PtA == 1 && SandMF.Coat4PtB == 0 {
            SandMF.PCoatPtACode = "EX-KPLY85AZ-01"
            SandMF.PCoatHardenerCode = "EX-KPLY85B-01"
        }
        else if SandMF.Coat4PtA == 1 && SandMF.Coat4PtB == 1 {
            SandMF.PCoatPtACode = "EX-KPLY85AF-01"
            SandMF.PCoatHardenerCode = "EX-KPLY85B-01"
            
        }
        else if SandMF.Coat4PtA == 2 && SandMF.Coat4PtB == 0 {
            SandMF.PCoatPtACode = "EX-KPLY92AZ-01"
            SandMF.PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
        else if SandMF.Coat4PtA == 2 && SandMF.Coat4PtB == 1 {
            SandMF.PCoatPtACode = "EX-KPLY92AF-01"
            SandMF.PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
    }
    func checkPUCodes() -> Void
    {
        // POLY HS EZ
        if SandMF.Coat4PtA == 0 && SandMF.Coat4PtB == 0 {
            SandMF.PUPtACode = "EX-KPLYHSAZ-01"
            SandMF.PUHardenerCode = "EX-KPLYHSB-01"
        }
        // POLY HS FAST
        else if SandMF.Coat4PtA == 0 && SandMF.Coat4PtB == 1 {
            SandMF.PUPtACode = "EX-KPLYHSAF-01"
            SandMF.PUHardenerCode = "EX-KPLYHSB-01"
            
        }
    }
    func updateCovRate() -> Void
    {
        // changes sand size in order to fix cov updating issue
        let temp = SandMF.BroadcastSizeSelection
        SandMF.BroadcastSizeSelection = 0
        SandMF.BroadcastSizeSelection = temp
        
        // Base Coat rates
        if SandMF.BroadcastSizeSelection == 0
        {
            TSABC_SandMF.covRate = 120
            TSBBC_SandMF.covRate = 120
            TSColorantBC_SandMF.covRate = 120
            
            
        }
        else if SandMF.BroadcastSizeSelection == 1
        {
            TSABC_SandMF.covRate = 210
            TSBBC_SandMF.covRate = 210
            TSColorantBC_SandMF.covRate = 210
            
            
            
        }
        
        else
        {
            TSABC_SandMF.covRate = 210
            TSBBC_SandMF.covRate = 210
            TSColorantBC_SandMF.covRate = 210
            
        }
        
        // TSE cov rate
        if SandMF.Coat3ProductType == 0
        {
            if SandMF.BroadcastSizeSelection == 0
            {
                SandMF_TSAC3.covRate = 120
                SandMF_TSBC3.covRate = 120
                SandMF_TSColorantC3.covRate = 120
            }
            
            else if SandMF.BroadcastSizeSelection == 1
            {
                SandMF_TSAC3.covRate = 170
                SandMF_TSBC3.covRate = 170
                SandMF_TSColorantC3.covRate = 170
            }
            else if SandMF.BroadcastSizeSelection == 2
            {
                SandMF_TSAC3.covRate = 200
                SandMF_TSBC3.covRate = 200
                SandMF_TSColorantC3.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandMF.Coat3ProductType == 1
        {
            if SandMF.BroadcastSizeSelection == 0
            {
                SandMF_TSAC3.covRate = 160
                SandMF_TSBC3.covRate = 160
                SandMF_TSColorantC3.covRate = 160
            }
            
            else if SandMF.BroadcastSizeSelection == 1
            {
                SandMF_TSAC3.covRate = 230
                SandMF_TSBC3.covRate = 230
                SandMF_TSColorantC3.covRate = 230
            }
            else if SandMF.BroadcastSizeSelection == 2
            {
                SandMF_TSAC3.covRate = 270
                SandMF_TSBC3.covRate = 270
                SandMF_TSColorantC3.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandMF.Coat3ProductType == 2
        {
            if SandMF.BroadcastSizeSelection == 0
            {
                SandMF_TSAC3.covRate = 120
                SandMF_TSBC3.covRate = 120
                SandMF_TSColorantC3.covRate = 120
            }
            
            else if SandMF.BroadcastSizeSelection == 1
            {
                SandMF_TSAC3.covRate = 170
                SandMF_TSBC3.covRate = 170
                SandMF_TSColorantC3.covRate = 170
            }
            else if SandMF.BroadcastSizeSelection == 2
            {
                SandMF_TSAC3.covRate = 200
                SandMF_TSBC3.covRate = 200
                SandMF_TSColorantC3.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandMF.Coat3ProductType == 3
        {
            if SandMF.BroadcastSizeSelection == 0
            {
                SandMF_TSAC3.covRate = 100
                SandMF_TSBC3.covRate = 100
                SandMF_TSColorantC3.covRate = 100
            }
            
            else if SandMF.BroadcastSizeSelection == 1
            {
                SandMF_TSAC3.covRate = 150
                SandMF_TSBC3.covRate = 150
                SandMF_TSColorantC3.covRate = 150
            }
            else if SandMF.BroadcastSizeSelection == 2
            {
                SandMF_TSAC3.covRate = 200
                SandMF_TSBC3.covRate = 200
                SandMF_TSColorantC3.covRate = 200
            }
        }
        // TOP COAT
        // PolyA chosen
        if SandMF.Coat4ProductType == 0
        {
            
            SandMF_TSAC4.covRate = 450
            SandMF_TSBC4.covRate = 450
            SandMF_TSColorantC4.covRate = 450
            
        }
        
        // PolyU in cap coat
        else if SandMF.Coat4ProductType == 1
        {
            // Poly HS
            if SandMF.Coat4PtA == 0
            {
                
                SandMF_TSAC4.covRate = 340
                SandMF_TSBC4.covRate = 340
                SandMF_TSColorantC4.covRate = 340
            }
            
            // Poly HP
            else
            {
                // gloss
                if SandMF.Coat4PtB == 0
                {
                    SandMF_TSAC4.covRate = 575
                    SandMF_TSBC4.covRate = 575
                    SandMF_TSColorantC4.covRate = 575
                }
                // satin
                else
                {
                    SandMF_TSAC4.covRate = 675
                    SandMF_TSBC4.covRate = 675
                    SandMF_TSColorantC4.covRate = 675
                }
            }
        }
        
        // UPC in cap coat
        else
        {
            SandMF_TSAC4.covRate = 190
            SandMF_TSBC4.covRate = 190
            SandMF_TSColorantC4.covRate = 190
        }
    }
    
    func checkTexture() -> Void
    {
        // check if bead is chosen
        if SandMF.Coat4Texture > 2
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
                Picker(selection: $SandMF.Coat4ProductType,
                       label: ZStack {
                    Text("\(products[SandMF.Coat4ProductType])")
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
                .onChange(of: SandMF.Coat4ProductType) { _ in
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
            if SandMF.Coat4ProductType == 0
            {
                HStack
                {
                    Text("Polyaspartic:")
                        .fontWeight(.bold)
                    Picker(selection: $SandMF.Coat4PtA,
                           label: ZStack {
                        Text("\(typesA[SandMF.Coat4PtA])")
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
                    .onChange(of: SandMF.Coat4PtA) { _ in
                        checkPCoatCodes()
                    }
                    
                    Picker(selection: $SandMF.Coat4PtB,
                           label: ZStack {
                        Text("\(hardeners[SandMF.Coat4PtB])")
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
                    .onChange(of: SandMF.Coat4PtB) { _ in
                        checkPCoatCodes()
                    }
                    Spacer()
                }
                .padding()
            }
            // PU is chosen
            else if SandMF.Coat4ProductType == 1
            {
                HStack
                {
                    Text("Polyurethane:")
                        .fontWeight(.bold)
                    Picker(selection: $SandMF.Coat4PtA,
                           label: ZStack {
                        Text("\(typesA[SandMF.Coat4PtA])")
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
                    .onChange(of: SandMF.Coat4PtA) { _ in
                        //                       updateCovRate()
                        checkPUCodes()
                    }
                    if SandMF.Coat4PtA == 0
                    {
                        Picker(selection: $SandMF.Coat4PtB,
                               label: ZStack {
                            Text("\(hardeners[SandMF.Coat4PtB])")
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
                        .onChange(of: SandMF.Coat4PtB) { _ in
                            //                        updateCovRate()
                            checkPUCodes()
                        }
                    }
                    else
                    {
                        Picker(selection: $SandMF.Coat4PtB,
                               label: ZStack {
                            Text("\(hardeners[SandMF.Coat4PtB])")
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
                        .onChange(of: SandMF.Coat4PtB) { _ in
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
                        Picker(selection: $SandMF.Coat4PtA,
                               label: ZStack {
                            Text("\(UPCTypes[SandMF.Coat4PtA])")
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
                    if SandMF.Coat4PtA == 1
                    {
                        VStack
                        {
                            Text("UPC Part B: ")
                                .fontWeight(.bold)
                            Picker(selection: $SandMF.Coat4PtB,
                                   label: ZStack {
                                Text("\(typesB[SandMF.Coat4PtB])")
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
                    Picker(selection: $SandMF.Coat4TSColorant,
                           label: ZStack {
                        Text("\(UPCColorantChoices[SandMF.Coat4TSColorant])")
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
            if SandMF.Coat4ProductType != 0 && SandMF.Coat4ProductType != 3
            {
                HStack
                {
                    Text("Poly Colorant:")
                        .fontWeight(.bold)
                    Picker(selection: $SandMF.Coat4PColorant,
                           label: ZStack {
                        Text("\(PolyColorantChoices[SandMF.Coat4PColorant])")
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
                Toggle(isOn: $SandMF.Coat4MatAdd, label: {
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
                
                if SandMF.Coat4ProductType == 0
                {
                    HStack
                    {
                        Text("\(PCoatPtACode)")
                            .font(.caption)
                        Spacer()
                        Text("\(PATypes[SandMF.Coat4PtA]) - \(hardeners[SandMF.Coat4PtB]), 1 gal ")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandMF_TSAC4))")
                            .font(.caption)
                        
                    }
                    
                    HStack
                    {
                        Text("\(PCoatHardenerCode)")
                            .font(.caption)
                        Spacer()
                        Text("\(PATypes[SandMF.Coat4PtA]) Part B, 1 gal ")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandMF_TSAC4))")
                            .font(.caption)
                        
                    }
                }
                // polyurethane is chosen
                else if SandMF.Coat4ProductType == 1
                {
                    
                    HStack
                    {
                        Text("\(PUPtACode)")
                            .font(.caption)
                        Spacer()
                        // poly hs is chosen, display hardener
                        if SandMF.Coat4PtA == 0
                        {
                            Text("\(PUTypes[SandMF.Coat4PtA]) - \(hardeners[SandMF.Coat4PtB]) Part A, 1 gal ")
                                .font(.caption)
                        }
                        // Poly HP
                        else
                        {
                            if SandMF.Coat4PtB == 0
                            {
                                Text("\(PUTypes[SandMF.Coat4PtA]) Part A - \(puhpHardeners[SandMF.Coat4PtB]), 1/4 gal ")
                                    .font(.caption)
                            }
                            else
                            {
                                Text("\(PUTypes[SandMF.Coat4PtA]) Part A - \(puhpHardeners[SandMF.Coat4PtB]), 1/2 gal ")
                                    .font(.caption)
                            }
                        }
                        
                        Spacer()
                        Text("\(quant(product: SandMF_TSAC4))")
                            .font(.caption)
                        
                    }
                    
                    HStack
                    {
                        Text("\(PUHardenerCode)")
                            .font(.caption)
                        Spacer()
                        // Poly HS
                        if SandMF.Coat4PtA == 0
                        {
                            Text("\(PUTypes[SandMF.Coat4PtA]) Part B, 1/2 gal ")
                                .font(.caption)
                        }
                        else
                        {
                            Text("\(PUTypes[SandMF.Coat4PtA]) Part B, 1 gal ")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(quant(product: SandMF_TSAC4))")
                            .font(.caption)
                        
                    }
                }
                // UPC is chosen
                else
                {
                    // upc uv is chosen
                    if SandMF.Coat4PtA == 0
                    {
                        HStack
                        {
                            Text("EX-KUPCARC-EA")
                                .font(.caption)
                            Spacer()
                            Text("UPC Part A - RC/TT, 6#")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: SandMF_TSAC4))")
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
                            Text("\(quant(product: SandMF_TSAC4 ))")
                                .font(.caption)
                        }
                        HStack { // Part C
                            Text("EX-KUPCRFC-EA")
                                .font(.caption)
                            Spacer()
                            Text("UPC Part C - RC, 6#")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: SandMF_TSAC4))")
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
                            Text("\(quant(product: SandMF_TSAC4))")
                                .font(.caption)
                        }
                        
                        HStack
                        {
                            Text("EX-BRCUVAP6-EA")
                                .font(.caption)
                            Spacer()
                            Text("UPC Part B - \(Text("\(typesB[SandMF.Coat4PtB])") ), 6#")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: SandMF_TSAC4 ))")
                                .font(.caption)
                        }
                        HStack { // Part C
                            Text("EX-KUPCRFC-EA")
                                .font(.caption)
                            Spacer()
                            Text("UPC Part C - RC, 6#")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: SandMF_TSAC4))")
                                .font(.caption)
                        }
                    }
                    // upc colorant
                    if SandMF.Coat4TSColorant != 0
                    {
                        HStack
                        {
                            Text("\(UPCColorantCodes[SandMF.Coat4TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("UPC Colorant - \(UPCColorantChoices[SandMF.Coat4TSColorant]), 4 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: UPCColorant))")
                                .font(.caption)
                        }
                    }
                    // TODO - poly accelerant
                    
                }
                // poly colorant
                if SandMF.Coat4PColorant != 0 && (SandMF.Coat4ProductType != 0 || SandMF.Coat4ProductType != 3)
                {
                    HStack
                    {
                        Text("\(PolyColorantCodes[SandMF.Coat4PColorant])")
                            .font(.caption)
                        Spacer()
                        
                        Text("Poly Colorant - \(PolyColorantChoices[SandMF.Coat4PColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandMF_TSColorantC4))")
                            .font(.caption)
                        
                    }
                }
                
                if SandMF.Coat4MatAdd == true
                {
                    HStack
                    {
                        Text("EX-KMATADD-EA")
                            .font(.caption)
                        Spacer()
                        Text("Matting Additive, 1# ")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandMF_TSAC4))")
                            .font(.caption)
                    }
                }
                
                if SandMF.Coat4ProductType != 3
                {
                    HStack
                    {
                        Text("EX-KASB100-EA")
                            .font(.caption)
                        Spacer()
                        Text("Anti-Slip Bead 100")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandMF_TSAC4))")
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
                        Text("\(quant(product: SandMF_TSAC4))")
                            .font(.caption)
                    }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
        .onChange(of: SandMF.Coat4ProductType) { _ in
            updateCovRate()
            checkPUCodes()
            checkPCoatCodes()
        }
        .onChange(of: SandMF.Coat4PtA) { _ in
            updateCovRate()
        }
        .onChange(of: SandMF.Coat4PtB) { _ in
            updateCovRate()
        }
        
        HStack {
            Text("Add Waste Factor: ")
            Spacer()
            TextField("",value: $SandMF.Coat4Waste, formatter: NumberFormatter())
                .frame(width:30, height:25)
                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                .cornerRadius(5.0)
            Text("kit(s)")
        }
        .padding()
        HStack {
            Text("Total:")
            Spacer()
            Text("\(quant(product: SandMF_TSAC4) + SandMF.Coat4Waste) kit(s)")
        }
        .padding()
    }
}



struct IndustrialSandMFCoat4_Previews: PreviewProvider {
    static var previews: some View {
        IndustrialSandMFView()
    }
}
