//
//  SplashFloorTSCoat1.swift
//  Calculator
//
//  Created by Kane Davidson on 4/12/22.
//

import SwiftUI

var TSAC1 = stats2(product: "Top Shelf® Epoxy Part A:", covRate: 450, MixRat: 1)
var TSBC1 = stats2(product: "Top Shelf® Epoxy Part B:", covRate: 450, MixRat: 0.5)
var TSColorantC1 = stats2(product: "Top Shelf® Epoxy Colorant:", covRate: 450, MixRat: 16)

struct SplashFloorTSCoat1: View {
    
    let products = ["Top Shelf Epoxy®", "Polyaspartic", "Polyurethane", "Urethane Polymer Concrete"]
    
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
    
    let UPCTypes = ["RC", "SL", "MF"]
    
    let UPCHardeners = ["AP", "EZ", "FC"]
    
    let typesB = ["AP", "EZ", "Fast", "MVR - EZ", "MVR - FC", "TH"]
    
    let hardeners = ["EZ - Clear", "Fast - Clear"]
    
    let typesBCodes = ["EX-KTSEAPB-EA", "EX-KTSEZB-EA", "EX-KTSEFB-EA", "EX-KTSEMVZB-EA", "EX-KTSEMVFB-EA", "EX-KTSETHB-EA"]
    
    let TSColorantChoices = ["No Color (pre-pigmented Part A)", "Beige", "Black", "Dark Gray", "Enchanted Green", "Hand. Blue", "Latte", "Light Gray", "Medium Gray", "Mocha", "Safety Blue", "Safety Red", "Safety Yellow", "Shadow Gray", "Tan", "Tile Red", "White",]
    
    let TSColorantCodes = ["No Color (pre-pigmented Part A)", "EX-KTSECLBG-EA", "EX-KTSECLBL-EA", "EX-KTSECLDG-EA", "EX-KTSECLEG-EA", "EX-KTSECLHB-EA", "EX-KTSECLLT-EA", "EX-KTSECLLG-EA", "EX-KTSECLMG-EA", "EX-KTSECLMC-EA", "EX-KTSECLSB-EA", "EX-KTSECLSR-EA", "EX-KTSECLSY-EA", "EX-KTSECLSG-EA", "EX-KTSECLTN-EA", "EX-KTSECLTR-EA", "EX-KTSECLWH-01",]
    
    let UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    let UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]
    
    @EnvironmentObject var SplashTSFloor : ColorSplashValuesFloorTS //Used for coat selections
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
    
    func updateCovRate() -> Void
    {
        // TSE cov rate
        if SplashTSFloor.Coat1ProductType == 0
        {
            TSAC1.covRate = 450
            TSBC1.covRate = 450
            
        }
        // change cov rate to 800 if polyA is chosen
        else if SplashTSFloor.Coat1ProductType == 1
        {
            TSAC1.covRate = 800
            TSBC1.covRate = 800

        }
        // else poly is chosen
        else if SplashTSFloor.Coat1ProductType == 2
        {
            // if poly hs is chosen
            if SplashTSFloor.Coat1PtA == 0
            {
                TSAC1.covRate = 600
                TSBC1.covRate = 600

            }
            // HP clear gloss
            else if SplashTSFloor.Coat1PtA == 1
            {
                TSAC1.covRate = 575
                TSBC1.covRate = 575

            }
            
            // HP clear satin
            else
            {
                TSAC1.covRate = 675
                TSBC1.covRate = 675

            }
        }
        // UPC is chosen
        else
        {
            // check if RC is chosen
            if SplashTSFloor.Coat1PtA == 0
            {
                TSAC1.covRate = 200
                TSBC1.covRate = 200
            }
            // check if SL is chosen
            else if SplashTSFloor.Coat1PtA == 1
            {
                TSAC1.covRate = 45
                TSBC1.covRate = 45
                TSBC1.MixRat = 25
            }
            // check if MF is chosen
            else
            {
                TSAC1.covRate = 45
                TSBC1.covRate = 45
                TSBC1.MixRat = 25
            }
            
        }
    }
    
    func checkPCoatCodes() -> Void {
        
        if SplashTSFloor.Coat1PtA == 0 && SplashTSFloor.Coat1Hardener == 0 {
            PCoatPtACode = "EX-KPLY72AZ-01"
            PCoatHardenerCode = "EX-KPLY72B-01"
        }
        else if SplashTSFloor.Coat1PtA == 0 && SplashTSFloor.Coat1Hardener == 1 {
            PCoatPtACode = "EX-KPLY72AF-01"
            PCoatHardenerCode = "EX-KPLY72B-01"
            
        }
        else if SplashTSFloor.Coat1PtA == 1 && SplashTSFloor.Coat1Hardener == 0 {
            PCoatPtACode = "EX-KPLY85AZ-01"
            PCoatHardenerCode = "EX-KPLY85B-01"
        }
        else if SplashTSFloor.Coat1PtA == 1 && SplashTSFloor.Coat1Hardener == 1 {
            PCoatPtACode = "EX-KPLY85AF-01"
            PCoatHardenerCode = "EX-KPLY85B-01"
            
        }
        else if SplashTSFloor.Coat1PtA == 2 && SplashTSFloor.Coat1Hardener == 0 {
            PCoatPtACode = "EX-KPLY92AZ-01"
            PCoatHardenerCode = "EX-KPLY92B-01"
            
        }
        else if SplashTSFloor.Coat1PtA == 2 && SplashTSFloor.Coat1Hardener == 1 {
            PCoatPtACode = "EX-KPLY92AF-01"
            PCoatHardenerCode = "EX-KPLY92B-01"
        }
    }
    func checkPUCodes() -> Void
    {
        // POLY HS EZ
        if SplashTSFloor.Coat1PtA == 0 && SplashTSFloor.Coat1Hardener == 0 {
            PUPtACode = "EX-KPLYHSAZ-01"
            PUHardenerCode = "EX-KPLYHSB-01"
        }
        // POLY HS FAST
        else if SplashTSFloor.Coat1PtA == 0 && SplashTSFloor.Coat1Hardener == 1 {
            PUPtACode = "EX-KPLYHSAF-01"
            PUHardenerCode = "EX-KPLYHSB-01"
            
        }
        // POLY HP GLOSS
        else if SplashTSFloor.Coat1PtA == 1 {
            PUPtACode = "EX-KPLYHPGA-01"
            PUHardenerCode = "EX-KPLYHPB-01"
        }
        // POLY HP SATIN
        else if SplashTSFloor.Coat1PtA == 2  {
            PUPtACode = "EX-KPLYHPSA-01"
            PUHardenerCode = "EX-KPLYHPB-01"
            
        }
    }
    
    func checkUPC() -> Void
    {
        if SplashTSFloor.Coat1ProductType == 3
        {
            if SplashTSFloor.Coat1PtA == 0
            {
                SplashTSFloor.UPCSelection = "RC/TT"
            }
            
            else
            {
                SplashTSFloor.UPCSelection = "SL/MF"
            }
        }
    }
    
    func checkUPCCodes() -> Void
    {
        if SplashTSFloor.Coat1ProductType == 3
        {
            // check if RC is chosen
            if SplashTSFloor.Coat1PtA == 0
            {
                // set part a and c codes
                UPCACode = "EX-KUPCARC-EA"
                UPCCode = "EX-KUPCRFC-EA"
                
                // check if AP is hardener
                if SplashTSFloor.Coat1Hardener == 0
                {
                    UPCBCode = "EX-KUPCRCA6-EA"
                }
                
                // check if EZ is hardener
                else if SplashTSFloor.Coat1Hardener == 1
                {
                    UPCBCode = "EX-KUPCRCZ6-EA"
                }
                
                // else, FC is hardener
                else
                {
                    UPCBCode = "EX-KUPCRCF6-EA"
                }
                
            }
            
            // check if SL is chosen
            else if SplashTSFloor.Coat1PtA == 1
            {
                // set part a and c codes
                UPCACode = "EX-KUPCASL8-EA"
                UPCCode = "EX-KUPCASL8-EA"
                
                // check if AP is hardener
                if SplashTSFloor.Coat1Hardener == 0
                {
                    UPCBCode = "EX-KUPCSLB8-EA"
                }
                
                // check if EZ is hardener
                else if SplashTSFloor.Coat1Hardener == 1
                {
                    UPCBCode = "EX-KUPCSLZ8-EA"
                }
                
                // else, FC is hardener
                else
                {
                    UPCBCode = "EX-KUPCSLF8-EA"
                }
            }
            
            // else, MF is chosen
            else
            {
                // set part a and c codes
                UPCACode = "EX-KUPCASL8-EA"
                UPCCode = "EX-KUPCMFC-EA"
                
                // check if AP is hardener
                if SplashTSFloor.Coat1Hardener == 0
                {
                    UPCBCode = "EX-KUPCSLB8-EA"
                }
                
                // check if EZ is hardener
                else if SplashTSFloor.Coat1Hardener == 1
                {
                    UPCBCode = "EX-KUPCSLZ8-EA"
                }
                
                // else, FC is hardener
                else
                {
                    UPCBCode = "EX-KUPCSLF8-EA"
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Coating Thickness: 8-12 mils")
                .fontWeight(.heavy)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            HStack {
                Text("Coat 1 Product:")
                    .fontWeight(.bold)
                Picker(selection: $SplashTSFloor.Coat1ProductType,
                       label: ZStack {
                    Text("\(products[SplashTSFloor.Coat1ProductType])")
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
                .onChange(of: SplashTSFloor.Coat1ProductType) { _ in
                    updateCovRate()
                    checkPUCodes()
                }
                
                //               SplashTSFloorInfo()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // solvent cleaner coat option
            HStack {
                Toggle(isOn: $SplashTSFloor.Coat1SolventCleaner, label: {
                    Text("Add Optional Solvent Cleaner")
                        .fontWeight(.bold)

                })
                .toggleStyle(CheckBoxToggleStyle())
            }
            .padding()
            
            // check for coat product selected
            if SplashTSFloor.Coat1ProductType == 0
            {
                Text("Top Shelf Epoxy® Part A:")
                    .fontWeight(.bold)
                Picker(selection: $SplashTSFloor.Coat1PtA,
                       label: ZStack {
                    Text("\(typesA[SplashTSFloor.Coat1PtA])")
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
                Picker(selection: $SplashTSFloor.Coat1PtB,
                       label: ZStack {
                    Text("\(typesB[SplashTSFloor.Coat1PtB])")
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
                //             .onChange(of: SplashTSFloor.Coat1PtB) { _ in
                //                 CheckCoatChoices()
                //             }
                Text("Top Shelf Epoxy® Colorant:")
                    .fontWeight(.bold)
                Picker(selection: $SplashTSFloor.Coat1TSColorant,
                       label: ZStack {
                    Text("\(TSColorantChoices[SplashTSFloor.Coat1TSColorant])")
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
            // PA is chosen
            else if SplashTSFloor.Coat1ProductType == 1
            {
                
                HStack
                {
                    Text("Polyaspartic:")
                        .fontWeight(.bold)
                    Picker(selection: $SplashTSFloor.Coat1PtA,
                           label: ZStack {
                        Text("\(typesA[SplashTSFloor.Coat1PtA])")
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
                    .onChange(of: SplashTSFloor.Coat1PtA) { _ in
                        checkPCoatCodes()
                    }
                    
                    
                    Picker(selection: $SplashTSFloor.Coat1Hardener,
                           label: ZStack {
                        Text("\(hardeners[SplashTSFloor.Coat1Hardener])")
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
                    .onChange(of: SplashTSFloor.Coat1Hardener) { _ in
                        checkPCoatCodes()
                    }
                    Spacer()
                }
                .padding()
            }
            // PU is chosen
            else if SplashTSFloor.Coat1ProductType == 2
            {
                HStack
                {
                    Text("Polyurethane:")
                        .fontWeight(.bold)
                    Picker(selection: $SplashTSFloor.Coat1PtA,
                           label: ZStack {
                        Text("\(typesA[SplashTSFloor.Coat1PtA])")
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
                    .onChange(of: SplashTSFloor.Coat1PtA) { _ in
                        updateCovRate()
                        checkPUCodes()
                    }
                    if SplashTSFloor.Coat1PtA == 0
                    {
                        Picker(selection: $SplashTSFloor.Coat1Hardener,
                               label: ZStack {
                            Text("\(hardeners[SplashTSFloor.Coat1Hardener])")
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
                        .onChange(of: SplashTSFloor.Coat1Hardener) { _ in
                            checkPUCodes()
                            updateCovRate()

                        }
                    }
                    Spacer()
                }
                .padding()
            }

            // UPC is chosen
            else
            {
                HStack
                {
                    Text("Urethane Polymer Concrete:")
                        .fontWeight(.bold)
                    Picker(selection: $SplashTSFloor.Coat1PtA,
                           label: ZStack {
                        Text("\(UPCTypes[SplashTSFloor.Coat1PtA])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.9)
                            .cornerRadius(5)
                            .frame(width: 225, height: 25)
                        //  .padding()
                    }) {
                        ForEach (0 ..< UPCTypes.count, id: \.self) { index in
                            Text(self.UPCTypes[index]).tag(index)
                        }
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .onChange(of: SplashTSFloor.Coat1PtA) { _ in
                        checkUPCCodes()
                        checkUPC()
                        updateCovRate()
                    }
                    Spacer()
                }
                .padding()

                HStack
                {
                    Text("Choose Your Speed: \(SplashTSFloor.UPCSelection) - ")
                        .fontWeight(.bold)
                    
                    // hardener picker
                    Picker(selection: $SplashTSFloor.Coat1Hardener,
                           label: ZStack {
                        Text("\(UPCHardeners[SplashTSFloor.Coat1Hardener])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.black)
                            .opacity(0.9)
                            .cornerRadius(5)
                            .frame(width: 225, height: 25)
                        //  .padding()
                    }) {
                        ForEach (0 ..< UPCHardeners.count, id: \.self) { index in
                            Text(self.UPCHardeners[index]).tag(index)
                        }
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .onChange(of: SplashTSFloor.Coat1Hardener) { _ in
                        checkUPCCodes()
                    }
                    Spacer()
                }
                .padding()
         
                HStack
                {
                    Text("UPC Colorant:")
                        .fontWeight(.bold)
                    Picker(selection: $SplashTSFloor.Coat1TSColorant,
                           label: ZStack {
                        Text("\(UPCColorantChoices[SplashTSFloor.Coat1TSColorant])")
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
                if SplashTSFloor.Coat1ProductType == 0 
                {
                    if SplashTSFloor.Coat1PtA == 4 {
                        HStack{
                            Text("\(typesACodes[SplashTSFloor.Coat1PtA])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Part A: Ench. Green, 1 gal")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSAC1))")
                                .font(.caption)
                        }
                    }
                    else {
                        HStack{
                            Text("\(typesACodes[SplashTSFloor.Coat1PtA])")
                                .font(.caption)
                            Spacer()
                            Text("TSE Part A: \(typesA[SplashTSFloor.Coat1PtA]), 1 gal")
                                .font(.caption)
                            Spacer()
                            Text("\(quant(product: TSAC1))")
                                .font(.caption)
                        }
                    }
                    HStack{
                        Text("\(typesBCodes[SplashTSFloor.Coat1PtB])")
                            .font(.caption)
                        Spacer()
                        Text("Top Shelf® Epoxy Part B: \(typesB[SplashTSFloor.Coat1PtB]), 1/2 gal")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSBC1))")
                            .font(.caption)
                    }
                    if SplashTSFloor.Coat1TSColorant != 0 {
                        if SplashTSFloor.Coat1TSColorant == 1 || SplashTSFloor.Coat1TSColorant == 5 || SplashTSFloor.Coat1TSColorant == 6 || SplashTSFloor.Coat1TSColorant == 10 || SplashTSFloor.Coat1TSColorant == 11 || SplashTSFloor.Coat1TSColorant == 12 || SplashTSFloor.Coat1TSColorant == 13 || SplashTSFloor.Coat1TSColorant == 16 {
                            HStack {
                                Text("\(TSColorantCodes[SplashTSFloor.Coat1TSColorant])")
                                    .font(.caption)
                                Spacer()
                                Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SplashTSFloor.Coat1TSColorant]), 16 oz")
                                    .font(.caption)
                                Spacer()
                                Text("\(quant(product: TSColorantC1))")
                                    .font(.caption)
                            }
                        }
                        else if SplashTSFloor.Coat1TSColorant == 4 {
                            HStack {
                                Text("\(TSColorantCodes[SplashTSFloor.Coat1TSColorant])")
                                    .font(.caption)
                                Spacer()
                                Text("TSE Colorant:  Ench. Green, 8 oz")
                                    .font(.caption)
                                Spacer()
                                Text("\(quant(product: TSColorantC1))")
                                    .font(.caption)
                            }
                        }
                        else {
                            HStack {
                                Text("\(TSColorantCodes[SplashTSFloor.Coat1TSColorant])")
                                    .font(.caption)
                                Spacer()
                                Text("Top Shelf® Epoxy Colorant:  \(TSColorantChoices[SplashTSFloor.Coat1TSColorant]), 8 oz")
                                    .font(.caption)
                                Spacer()
                                Text("\(quant(product: TSColorantC1))")
                                    .font(.caption)
                            }
                        }
                    }
                }
                // PA is chosen
                else if SplashTSFloor.Coat1ProductType == 1
                {
                    HStack
                    {
                        Text("\(PCoatPtACode)")
                            .font(.caption)
                        Spacer()
                        Text("\(PATypes[SplashTSFloor.Coat1PtA]) - \(hardeners[SplashTSFloor.Coat1Hardener]), 1 gal ")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC1))")
                            .font(.caption)
                        
                    }
                    
                    HStack
                    {
                        Text("\(PCoatHardenerCode)")
                            .font(.caption)
                        Spacer()
                        Text("\(PATypes[SplashTSFloor.Coat1PtA]) Part B, 1 gal ")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC1))")
                            .font(.caption)
                        
                    }
                }
                // polyurethane is chosen
                else if SplashTSFloor.Coat1ProductType == 2
                {
                    HStack
                    {
                        Text("\(PUPtACode)")
                            .font(.caption)
                        Spacer()
                        // poly hs is chosen, display hardener
                        if SplashTSFloor.Coat1PtA == 0
                        {
                            Text("\(PUTypes[SplashTSFloor.Coat1PtA]) - \(hardeners[SplashTSFloor.Coat1Hardener]) Part A, 1 gal ")
                                .font(.caption)
                        }
                        // Poly HP Gloss
                        else if SplashTSFloor.Coat1PtA == 1
                        {
                            Text("\(PUTypes[SplashTSFloor.Coat1PtA]) Part A, 1/4 gal ")
                                .font(.caption)
                        }
                        // Poly HP Satin
                        else
                        {
                            Text("\(PUTypes[SplashTSFloor.Coat1PtA]) Part A, 1/2 gal ")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(quant(product: TSAC1))")
                            .font(.caption)
                        
                    }
                    
                    HStack
                    {
                        Text("\(PUHardenerCode)")
                            .font(.caption)
                        Spacer()
                        // Poly HS
                        if SplashTSFloor.Coat1PtA == 0
                        {
                            Text("\(PUTypes[SplashTSFloor.Coat1PtA]) Part B, 1/2 gal ")
                                .font(.caption)
                        }
                        else
                        {
                            Text("\(PUTypes[SplashTSFloor.Coat1PtA]) Part B, 1 gal ")
                                .font(.caption)
                        }
                        Spacer()
                        Text("\(quant(product: TSAC1))")
                            .font(.caption)
                        
                    }
                }
                
                // UPC is chosen
                else
                {
                  HStack
                    {
                        Text("\(UPCACode)")
                            .font(.caption)
                        Spacer()
                        
                        // check if RC is chosen
                        if SplashTSFloor.Coat1PtA == 0
                        {
                            Text("UPC Part A - \(SplashTSFloor.UPCSelection), 6 #")
                            .font(.caption)
                        }
                        
                        else
                        {
                            Text("UPC Part A - \(SplashTSFloor.UPCSelection), 8 #")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Text("\(quant(product: TSAC1))")
                            .font(.caption)
                    }
                    
                    HStack
                    {
                        Text("\(UPCBCode)")
                            .font(.caption)
                        Spacer()
                        
                        // check if RC is chosen
                        if SplashTSFloor.Coat1PtA == 0
                        {
                            Text("UPC Part B - \(SplashTSFloor.UPCSelection) - \(UPCHardeners[SplashTSFloor.Coat1Hardener]), 6 #")
                            .font(.caption)
                        }
                        
                        else
                        {
                            Text("UPC Part B - \(SplashTSFloor.UPCSelection) - \(UPCHardeners[SplashTSFloor.Coat1Hardener]), 8 #")
                                .font(.caption)
                        }
                        Spacer()
                        
                        Text("\(quant(product: TSBC1))")
                            .font(.caption)
                    }
                    
                    HStack
                    {
                        Text("\(UPCCode)")
                            .font(.caption)
                        Spacer()
                        // check if RC is chosen
                        if SplashTSFloor.Coat1PtA == 0
                        {
                        Text("UPC Part C - \(UPCTypes[SplashTSFloor.Coat1PtA]), 6 #")
                            .font(.caption)
                        }
                        
                        else if SplashTSFloor.Coat1PtA == 1
                        {
                            Text("UPC Part C - \(UPCTypes[SplashTSFloor.Coat1PtA]), 25 #")
                                .font(.caption)
                        }
                        else
                        {
                            Text("UPC Part C - \(UPCTypes[SplashTSFloor.Coat1PtA]), 40 #")
                                .font(.caption)
                        }
                        Spacer()
                        
                        Text("\(quant(product: TSBC1))")
                            .font(.caption)
                    }
                    
                    // check for UPC colorant
                    if SplashTSFloor.Coat1TSColorant != 0
                    {
                        HStack
                        {
                            Text("\(UPCColorantCodes[SplashTSFloor.Coat1TSColorant])")
                                .font(.caption)
                            Spacer()
                            
                            Text("UPC Colorant - \(UPCColorantChoices[SplashTSFloor.Coat1TSColorant]), 4 oz")
                                .font(.caption)
                            Spacer()
                            
                            Text("\(quant(product: TSAC1))")
                                .font(.caption)
                        }
                    }
                }
                
                // check for solvent cleaner
                if SplashTSFloor.Coat1SolventCleaner == true
                {
                    HStack
                    {
                        Text("EX-KSLVCLN-EA")
                            .font(.caption)
                        Spacer()
                        Text("Solvent Cleaner, 32 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSAC1))")
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
                TextField("",value: $SplashTSFloor.Coat1Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("kit(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quant(product: TSAC1) + SplashTSFloor.Coat1Waste) kit(s)")
            }
            .padding()
        }
    }
}


struct SplashFloorTSCoat1_Previews: PreviewProvider {
    static var previews: some View {
        SplashFloorTSCoat1()
    }
}
