//
//  SplashFloorTSCoat3.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

var SandSG_TSAC3 = stats2(product: "Top Shelf® Epoxy Part A:", covRate: 120, MixRat: 1)
var SandSG_TSBC3 = stats2(product: "Top Shelf® Epoxy Part B:", covRate: 120, MixRat: 0.5)
var SandSG_TSColorantC3 = stats2(product: "Top Shelf® Epoxy Colorant:", covRate: 120, MixRat: 16)

struct IndustrialSandSGCapCoat: View {
    
  
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
    
    let PUTypes = ["Polyurethane HS"]
    
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
    
    @EnvironmentObject var SandSG : ColorQuartzTSValues //Used for coat selections
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
//        if SandSG.Coat3ProductType == 0
//        {
//            SandSG_TSAC3.covRate = 120
//            SandSG_TSBC3.covRate = 120
//        }
//        // change cov rate to 800 if polyA is chosen
//        else if SandSG.Coat3ProductType == 1
//        {
//            SandSG_TSAC3.covRate = 160
//            SandSG_TSBC3.covRate = 160
//        }
//        // else poly is chosen
//        else
//        {
//            SandSG_TSAC3.covRate = 120
//            SandSG_TSBC3.covRate = 120
//
////            // if poly hs is chosen
////            if SandSG.Coat3PtA == 0
////            {
////                TSAC3.covRate = 600
////                TSBC3.covRate = 600
////            }
////            // HP clear gloss
////            else if SandSG.Coat3PtA == 1
////            {
////                TSAC3.covRate = 575
////                TSBC3.covRate = 575
////            }
////
////            // HP clear satin
////            else
////            {
////                TSAC3.covRate = 675
////                TSBC3.covRate = 675
////            }
//        }
//    }
    
    func checkPCoatCodes() -> Void {
        
        if SandSG.Coat3PtA == 0 && SandSG.Coat3PtB == 0 {
            SandSG.PCoatPtACode = "EX-KPLY72AZ-01"
            SandSG.PCoatHardenerCode = "EX-KPLY72B-01"
        }
        else if SandSG.Coat3PtA == 0 && SandSG.Coat3PtB == 1 {
            SandSG.PCoatPtACode = "EX-KPLY72AF-01"
            SandSG.PCoatHardenerCode = "EX-KPLY72B-01"
            
        }
        else if SandSG.Coat3PtA == 1 && SandSG.Coat3PtB == 0 {
            SandSG.PCoatPtACode = "EX-KPLY85AZ-01"
            SandSG.PCoatHardenerCode = "EX-KPLY85B-01"
        }
        else if SandSG.Coat3PtA == 1 && SandSG.Coat3PtB == 1 {
            SandSG.PCoatPtACode = "EX-KPLY85AF-01"
            SandSG.PCoatHardenerCode = "EX-KPLY85B-01"
            
        }
        else if SandSG.Coat3PtA == 2 && SandSG.Coat3PtB == 0 {
            SandSG.PCoatPtACode = "EX-KPLY92AZ-01"
            SandSG.PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
        else if SandSG.Coat3PtA == 2 && SandSG.Coat3PtB == 1 {
            SandSG.PCoatPtACode = "EX-KPLY92AF-01"
            SandSG.PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
    }
    func checkPUCodes() -> Void
    {
        // POLY HS EZ
        if SandSG.Coat3PtA == 0 && SandSG.Coat3PtB == 0 {
            SandSG.PUPtACode = "EX-KPLYHSAZ-01"
            SandSG.PUHardenerCode = "EX-KPLYHSB-01"
        }
        // POLY HS FAST
        else if SandSG.Coat3PtA == 0 && SandSG.Coat3PtB == 1 {
            SandSG.PUPtACode = "EX-KPLYHSAF-01"
            SandSG.PUHardenerCode = "EX-KPLYHSB-01"
            
        }
    }
    
    func checkTexture() -> Void
    {
        // check if bead is chosen
        if SandSG.Coat3Texture > 2
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
                Picker(selection: $SandSG.Coat3ProductType,
                       label: ZStack {
                    Text("\(products[SandSG.Coat3ProductType])")
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
                .onChange(of: SandSG.Coat3ProductType) { _ in
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
                Toggle(isOn: $SandSG.Coat3MatAdd, label: {
                    Text("Add Optional Matting Additive")
                        .fontWeight(.bold)
                    
                })
                .toggleStyle(CheckBoxToggleStyle())
            }
            .padding()
            
            if SandSG.Coat3ProductType == 0
            {
            Text("Top Shelf Epoxy® Part A:")
                .fontWeight(.bold)
            Picker(selection: $SandSG.Coat3PtA,
                   label: ZStack {
                Text("\(typesA[SandSG.Coat3PtA])")
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
            Picker(selection: $SandSG.Coat3PtB,
                   label: ZStack {
                Text("\(typesB[SandSG.Coat3PtB])")
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
            //             .onChange(of: SandSG.Coat3PtB) { _ in
            //                 CheckCoatChoices()
            //             }
            Text("Top Shelf Epoxy® Colorant:")
                .fontWeight(.bold)
            Picker(selection: $SandSG.Coat3TSColorant,
                   label: ZStack {
                Text("\(TSColorantChoices[SandSG.Coat3TSColorant])")
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
            else if SandSG.Coat3ProductType == 1
            {
                HStack
                {
                Text("Polyaspartic:")
                    .fontWeight(.bold)
                Picker(selection: $SandSG.Coat3PtA,
                       label: ZStack {
                    Text("\(typesA[SandSG.Coat3PtA])")
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
                .onChange(of: SandSG.Coat3PtA) { _ in
                    checkPCoatCodes()
                }
                
                Picker(selection: $SandSG.Coat3PtB,
                       label: ZStack {
                    Text("\(hardeners[SandSG.Coat3PtB])")
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
                .onChange(of: SandSG.Coat3PtB) { _ in
                    checkPCoatCodes()
                }
                Spacer()
                }
                .padding()
            }
            // PU is chosen
            else if SandSG.Coat3ProductType == 2
            {
                HStack
                {
                    Text("Polyurethane:")
                        .fontWeight(.bold)
                    Picker(selection: $SandSG.Coat3PtA,
                           label: ZStack {
                        Text("\(typesA[SandSG.Coat3PtA])")
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
                    .onChange(of: SandSG.Coat3PtA) { _ in
 //                       updateCovRate()
                        checkPUCodes()
                    }
                    if SandSG.Coat3PtA == 0
                    {
                    Picker(selection: $SandSG.Coat3PtB,
                           label: ZStack {
                        Text("\(hardeners[SandSG.Coat3PtB])")
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
                    .onChange(of: SandSG.Coat3PtB) { _ in
//                        updateCovRate()
                        checkPUCodes()
                    }
                    }
                    Spacer()
                }
                .padding()
            }

            
            // poly colorant picker if TSE or UPC is not selected
            if SandSG.Coat3ProductType != 0
            {
                Text("Poly Colorant:")
                    .fontWeight(.bold)
                Picker(selection: $SandSG.Coat3PColorant,
                       label: ZStack {
                    Text("\(PolyColorantChoices[SandSG.Coat3PColorant])")
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
//            Picker(selection: $SandSG.Coat3Texture,
//                   label: ZStack {
//                Text("\(TextureOptions[SandSG.Coat3Texture])")
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
//            .onChange(of: SandSG.Coat3Texture) { _ in
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
                if SandSG.Coat3ProductType == 0
                {
                
                if SandSG.Coat3PtA == 4 {
                    HStack{
                        Text("\(typesACodes[SandSG.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: Ench. Green, 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandSG_TSAC3))")
                            .font(.caption)
                    }
                }
                else {
                    HStack{
                        Text("\(typesACodes[SandSG.Coat3PtA])")
                            .font(.caption)
                        Spacer()
                        Text("TSE Part A: \(typesA[SandSG.Coat3PtA]), 1 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandSG_TSAC3))")
                            .font(.caption)
                    }
                }
                HStack{
                    Text("\(typesBCodes[SandSG.Coat3PtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf® Epoxy Part B: \(typesB[SandSG.Coat3PtB]), 1/2 gal")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandSG_TSAC3))")
                        .font(.caption)
                }
                if SandSG.Coat3TSColorant != 0 {

                        HStack {
                            Text("\(TSColorantCodes[SandSG.Coat3TSColorant])")
                                .font(.caption)
                            Spacer()
                            Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SandSG.Coat3TSColorant]), 16 oz")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: SandSG_TSColorantC3))")
                                .font(.caption)
                        }
                    
                }
                }
            else if SandSG.Coat3ProductType == 1
            {
                HStack
                {
                    Text("\(PCoatPtACode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandSG.Coat3PtA]) - \(hardeners[SandSG.Coat3PtB]), 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandSG_TSAC3))")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(PCoatHardenerCode)")
                        .font(.caption)
                    Spacer()
                    Text("\(PATypes[SandSG.Coat3PtA]) Part B, 1 gal ")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: SandSG_TSAC3))")
                        .font(.caption)
                    
                }
            }
            // polyurethane is chosen
            else if SandSG.Coat3ProductType == 2
            {
                
                HStack
                {
                    Text("\(PUPtACode)")
                        .font(.caption)
                    Spacer()
                    // poly hs is chosen, display hardener
                    if SandSG.Coat3PtA == 0
                    {
                    Text("\(PUTypes[SandSG.Coat3PtA]) - \(hardeners[SandSG.Coat3PtB]) Part A, 1 gal ")
                        .font(.caption)
                    }
                    // Poly HP Gloss
                    else if SandSG.Coat3PtA == 1
                    {
                    Text("\(PUTypes[SandSG.Coat3PtA]) Part A, 1/4 gal ")
                        .font(.caption)
                    }
                    // Poly HP Satin
                    else
                    {
                        Text("\(PUTypes[SandSG.Coat3PtA]) Part A, 1/2 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: SandSG_TSAC3))")
                        .font(.caption)
                    
                }
                
                HStack
                {
                    Text("\(PUHardenerCode)")
                        .font(.caption)
                    Spacer()
                    // Poly HS
                    if SandSG.Coat3PtA == 0
                    {
                    Text("\(PUTypes[SandSG.Coat3PtA]) Part B, 1/2 gal ")
                        .font(.caption)
                    }
                    else
                    {
                        Text("\(PUTypes[SandSG.Coat3PtA]) Part B, 1 gal ")
                            .font(.caption)
                    }
                    Spacer()
                    Text("\(quant(product: SandSG_TSAC3))")
                        .font(.caption)
                    
                }
            }

                // poly colorant
                if SandSG.Coat3PColorant != 0 && (SandSG.Coat3ProductType != 0 || SandSG.Coat3ProductType != 3)
                {
                    HStack
                    {
                        Text("\(PolyColorantCodes[SandSG.Coat3PColorant])")
                            .font(.caption)
                        Spacer()
                       
                        Text("Poly Colorant - \(PolyColorantChoices[SandSG.Coat3PColorant]), 16 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandSG_TSColorantC3))")
                            .font(.caption)
                        
                    }
                }

                if SandSG.Coat3MatAdd == true
                {
                    HStack
                    {
                        Text("EX-KMATADD-EA")
                            .font(.caption)
                        Spacer()
                        Text("Matting Additive, 1# ")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: SandSG_TSAC3))")
                            .font(.caption)
                    }
                }
            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            }
            
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandSG.Coat3Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: SandSG_TSAC3) + SandSG.Coat3Waste) kit(s)")
            }
            .padding()
        }
    }



struct IndustrialSandSGCoat3_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat3()
    }
}
