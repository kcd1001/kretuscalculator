//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine



struct BroadcastSandDBTS: View {
    
    @EnvironmentObject var SandDBTS : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var BroadcastQuartzTS = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    
    @EnvironmentObject var TSABC_SandDBTS : stats
    @EnvironmentObject var TSBBC_SandDBTS : stats
    @EnvironmentObject var TSColorantBC_SandDBTS : stats

    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BroadcastSandDBTS : statsBroadcast
    
    @EnvironmentObject var SandDBTS_TSAC3 : stats2
    @EnvironmentObject var SandDBTS_TSBC3 : stats2
    @EnvironmentObject var SandDBTS_TSColorantC3 : stats2

    

    
    var ChipSizes = ["20 Mesh", "30 Mesh", "60 Mesh"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for BroadcastQuartzTS
    
    func checkChipSize() {
        if SandDBTS.BroadcastSizeSelection == 0 {
            BroadcastSandDBTS.covRate = 0.25
        }
        
        else if SandDBTS.BroadcastSizeSelection == 1 {
            BroadcastSandDBTS.covRate = 0.25
        }
        else if SandDBTS.BroadcastSizeSelection == 2 {
            BroadcastSandDBTS.covRate = 0.35
        }
    }
    
    func updateCovRate() -> Void
    {
        // changes sand size in order to fix cov updating issue
        let temp = SandDBTS.BroadcastSizeSelection
        SandDBTS.BroadcastSizeSelection = 0
        SandDBTS.BroadcastSizeSelection = temp
        
        // Base Coat rates
        if SandDBTS.BroadcastSizeSelection == 0
        {
            TSABC_SandDBTS.covRate = 120
            TSBBC_SandDBTS.covRate = 120
            TSColorantBC_SandDBTS.covRate = 120
            
            TSABC2_SandDBTS.covRate = 120
            TSBBC2_SandDBTS.covRate = 120
            TSColorantBC2_SandDBTS.covRate = 120
            
        }
        else if SandDBTS.BroadcastSizeSelection == 1
        {
            TSABC_SandDBTS.covRate = 210
            TSBBC_SandDBTS.covRate = 210
            TSColorantBC_SandDBTS.covRate = 210
            
            TSABC2_SandDBTS.covRate = 170
            TSBBC2_SandDBTS.covRate = 170
            TSColorantBC2_SandDBTS.covRate = 170
            
        }
        
        else
        {
            TSABC_SandDBTS.covRate = 210
            TSBBC_SandDBTS.covRate = 210
            TSColorantBC_SandDBTS.covRate = 210
            
            TSABC2_SandDBTS.covRate = 200
            TSBBC2_SandDBTS.covRate = 200
            TSColorantBC2_SandDBTS.covRate = 200
        }
        
        // TSE cov rate
        if SandDBTS.Coat3ProductType == 0
        {
            if SandDBTS.BroadcastSizeSelection == 0
            {
                SandDBTS_TSAC3.covRate = 120
                SandDBTS_TSBC3.covRate = 120
                SandDBTS_TSColorantC3.covRate = 120
            }
            
            else if SandDBTS.BroadcastSizeSelection == 1
            {
                SandDBTS_TSAC3.covRate = 170
                SandDBTS_TSBC3.covRate = 170
                SandDBTS_TSColorantC3.covRate = 170
            }
            else if SandDBTS.BroadcastSizeSelection == 2
            {
                SandDBTS_TSAC3.covRate = 200
                SandDBTS_TSBC3.covRate = 200
                SandDBTS_TSColorantC3.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandDBTS.Coat3ProductType == 1
        {
            if SandDBTS.BroadcastSizeSelection == 0
            {
                SandDBTS_TSAC3.covRate = 160
                SandDBTS_TSBC3.covRate = 160
                SandDBTS_TSColorantC3.covRate = 160
            }
            
            else if SandDBTS.BroadcastSizeSelection == 1
            {
                SandDBTS_TSAC3.covRate = 230
                SandDBTS_TSBC3.covRate = 230
                SandDBTS_TSColorantC3.covRate = 230
            }
            else if SandDBTS.BroadcastSizeSelection == 2
            {
                SandDBTS_TSAC3.covRate = 270
                SandDBTS_TSBC3.covRate = 270
                SandDBTS_TSColorantC3.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandDBTS.Coat3ProductType == 2
        {
            if SandDBTS.BroadcastSizeSelection == 0
            {
                SandDBTS_TSAC3.covRate = 120
                SandDBTS_TSBC3.covRate = 120
                SandDBTS_TSColorantC3.covRate = 120
            }
            
            else if SandDBTS.BroadcastSizeSelection == 1
            {
                SandDBTS_TSAC3.covRate = 170
                SandDBTS_TSBC3.covRate = 170
                SandDBTS_TSColorantC3.covRate = 170
            }
            else if SandDBTS.BroadcastSizeSelection == 2
            {
                SandDBTS_TSAC3.covRate = 200
                SandDBTS_TSBC3.covRate = 200
                SandDBTS_TSColorantC3.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandDBTS.Coat3ProductType == 3
        {
            if SandDBTS.BroadcastSizeSelection == 0
            {
                SandDBTS_TSAC3.covRate = 100
                SandDBTS_TSBC3.covRate = 100
                SandDBTS_TSColorantC3.covRate = 100
            }
            
            else if SandDBTS.BroadcastSizeSelection == 1
            {
                SandDBTS_TSAC3.covRate = 150
                SandDBTS_TSBC3.covRate = 150
                SandDBTS_TSColorantC3.covRate = 150
            }
            else if SandDBTS.BroadcastSizeSelection == 2
            {
                SandDBTS_TSAC3.covRate = 200
                SandDBTS_TSBC3.covRate = 200
                SandDBTS_TSColorantC3.covRate = 200
            }
        }
        // TOP COAT
        // TSE cov rate
        if SandDBTS.Coat4ProductType == 0
        {

                SandDBTS_TSAC4.covRate = 400
                SandDBTS_TSBC4.covRate = 400
                SandDBTS_TSColorantC4.covRate = 400

        }
        // PolyA is chosen in cap coat
        else if SandDBTS.Coat4ProductType == 1
        {
            SandDBTS_TSAC4.covRate = 450
            SandDBTS_TSBC4.covRate = 450
            SandDBTS_TSColorantC4.covRate = 450
        }
        // PolyU in cap coat
        else if SandDBTS.Coat4ProductType == 2
        {
            // Poly HS
            if SandDBTS.Coat4PtA == 0
            {
                
                SandDBTS_TSAC4.covRate = 340
                SandDBTS_TSBC4.covRate = 340
                SandDBTS_TSColorantC4.covRate = 340
            }
            
            // Poly HP
            else
            {
                // gloss
                if SandDBTS.Coat4PtB == 0
                {
                    SandDBTS_TSAC4.covRate = 575
                    SandDBTS_TSBC4.covRate = 575
                    SandDBTS_TSColorantC4.covRate = 575
                }
                // satin
                else
                {
                    SandDBTS_TSAC4.covRate = 675
                    SandDBTS_TSBC4.covRate = 675
                    SandDBTS_TSColorantC4.covRate = 675
                }
            }
        }
        
        // UPC in cap coat
        else if SandDBTS.Coat4ProductType == 3
        {
            SandDBTS_TSAC4.covRate = 190
            SandDBTS_TSBC4.covRate = 190
            SandDBTS_TSColorantC4.covRate = 190
        }
    }

    var body: some View {
        VStack {
            HStack {
                Text("Industrial Sand:")
             .fontWeight(.bold)
             Picker(selection: $SandDBTS.BroadcastSizeSelection, //used for size of chips
                 label: ZStack {
                     Text("\(ChipSizes[SandDBTS.BroadcastSizeSelection])")
                         .opacity(1)
                     Rectangle()
                         .fill(Color.gray)
                         .opacity(0.2)
                         .cornerRadius(5)
                         .frame(width: 50, height: 25)
                       //  .padding()
             }) {
                ForEach (0 ..< ChipSizes.count, id: \.self) { index in
                    Text(self.ChipSizes[index]).tag(index)
                }
             }
             .background(Color.gray.opacity(0.2))
             .cornerRadius(5)
             .onChange(of: SandDBTS.BroadcastSizeSelection) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandDBTS.Coat3ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandDBTS.Coat4ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandDBTS.Coat4PtA) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandDBTS.Coat4PtB) { _ in
                 checkChipSize()
                 updateCovRate()
             }
                
                Spacer()
                QuartzBroadcastInfo()
            } .padding()
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
                HStack {
                    Text("Contact Distributor")
                        .font(.caption)
                    Spacer()
                    Text("Kretus® Approved \(ChipSizes[SandDBTS.BroadcastSizeSelection]) Industrial Sand")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastSandDBTS))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandDBTS.BroadcastWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("bag(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: BroadcastSandDBTS) + SandDBTS.BroadcastWaste) bag(s)")
            }
            .padding()
        }
    }


struct BroadcastSandDBTS_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
