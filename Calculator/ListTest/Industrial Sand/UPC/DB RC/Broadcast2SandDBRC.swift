//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine



struct Broadcast2SandDBRC: View {
    
    @EnvironmentObject var SandDBRC : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var BroadcastQuartzTS = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    
    @EnvironmentObject var TSABC_SandDBRC : stats
    @EnvironmentObject var TSBBC_SandDBRC : stats
    @EnvironmentObject var TSColorantBC_SandDBRC : stats

    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BroadcastSandDBRC : statsBroadcast
    
    @EnvironmentObject var SandDBRC_TSAC3 : stats2
    @EnvironmentObject var SandDBRC_TSBC3 : stats2
    @EnvironmentObject var SandDBRC_TSColorantC3 : stats2

    

    
    var ChipSizes = ["20 Mesh", "30 Mesh", "60 Mesh"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for BroadcastQuartzTS
    
    func checkChipSize() {
        if SandDBRC.BroadcastSizeSelection == 0 {
            BroadcastSandDBRC.covRate = 0.25
        }
        
        else if SandDBRC.BroadcastSizeSelection == 1 {
            BroadcastSandDBRC.covRate = 0.25
        }
        else if SandDBRC.BroadcastSizeSelection == 2 {
            BroadcastSandDBRC.covRate = 0.35
        }
    }
    
    func updateCovRate() -> Void
    {
        // changes sand size in order to fix cov updating issue
        let temp = SandDBRC.BroadcastSizeSelection
        SandDBRC.BroadcastSizeSelection = 0
        SandDBRC.BroadcastSizeSelection = temp
        
        // Base Coat rates
        if SandDBRC.BroadcastSizeSelection == 0
        {
            TSABC_SandDBRC.covRate = 120
            TSBBC_SandDBRC.covRate = 120
            TSColorantBC_SandDBRC.covRate = 120
            
            TSABC2_SandDBRC.covRate = 120
            TSBBC2_SandDBRC.covRate = 120
            TSColorantBC2_SandDBRC.covRate = 120
            
        }
        else if SandDBRC.BroadcastSizeSelection == 1
        {
            TSABC_SandDBRC.covRate = 210
            TSBBC_SandDBRC.covRate = 210
            TSColorantBC_SandDBRC.covRate = 210
            
            TSABC2_SandDBRC.covRate = 170
            TSBBC2_SandDBRC.covRate = 170
            TSColorantBC2_SandDBRC.covRate = 170
            
        }
        
        else
        {
            TSABC_SandDBRC.covRate = 210
            TSBBC_SandDBRC.covRate = 210
            TSColorantBC_SandDBRC.covRate = 210
            
            TSABC2_SandDBRC.covRate = 200
            TSBBC2_SandDBRC.covRate = 200
            TSColorantBC2_SandDBRC.covRate = 200
        }
        
        // TSE cov rate
        if SandDBRC.Coat3ProductType == 0
        {
            if SandDBRC.BroadcastSizeSelection == 0
            {
                SandDBRC_TSAC3.covRate = 120
                SandDBRC_TSBC3.covRate = 120
                SandDBRC_TSColorantC3.covRate = 120
            }
            
            else if SandDBRC.BroadcastSizeSelection == 1
            {
                SandDBRC_TSAC3.covRate = 170
                SandDBRC_TSBC3.covRate = 170
                SandDBRC_TSColorantC3.covRate = 170
            }
            else if SandDBRC.BroadcastSizeSelection == 2
            {
                SandDBRC_TSAC3.covRate = 200
                SandDBRC_TSBC3.covRate = 200
                SandDBRC_TSColorantC3.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandDBRC.Coat3ProductType == 1
        {
            if SandDBRC.BroadcastSizeSelection == 0
            {
                SandDBRC_TSAC3.covRate = 160
                SandDBRC_TSBC3.covRate = 160
                SandDBRC_TSColorantC3.covRate = 160
            }
            
            else if SandDBRC.BroadcastSizeSelection == 1
            {
                SandDBRC_TSAC3.covRate = 230
                SandDBRC_TSBC3.covRate = 230
                SandDBRC_TSColorantC3.covRate = 230
            }
            else if SandDBRC.BroadcastSizeSelection == 2
            {
                SandDBRC_TSAC3.covRate = 270
                SandDBRC_TSBC3.covRate = 270
                SandDBRC_TSColorantC3.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandDBRC.Coat3ProductType == 2
        {
            if SandDBRC.BroadcastSizeSelection == 0
            {
                SandDBRC_TSAC3.covRate = 120
                SandDBRC_TSBC3.covRate = 120
                SandDBRC_TSColorantC3.covRate = 120
            }
            
            else if SandDBRC.BroadcastSizeSelection == 1
            {
                SandDBRC_TSAC3.covRate = 170
                SandDBRC_TSBC3.covRate = 170
                SandDBRC_TSColorantC3.covRate = 170
            }
            else if SandDBRC.BroadcastSizeSelection == 2
            {
                SandDBRC_TSAC3.covRate = 200
                SandDBRC_TSBC3.covRate = 200
                SandDBRC_TSColorantC3.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandDBRC.Coat3ProductType == 3
        {
            if SandDBRC.BroadcastSizeSelection == 0
            {
                SandDBRC_TSAC3.covRate = 100
                SandDBRC_TSBC3.covRate = 100
                SandDBRC_TSColorantC3.covRate = 100
            }
            
            else if SandDBRC.BroadcastSizeSelection == 1
            {
                SandDBRC_TSAC3.covRate = 150
                SandDBRC_TSBC3.covRate = 150
                SandDBRC_TSColorantC3.covRate = 150
            }
            else if SandDBRC.BroadcastSizeSelection == 2
            {
                SandDBRC_TSAC3.covRate = 200
                SandDBRC_TSBC3.covRate = 200
                SandDBRC_TSColorantC3.covRate = 200
            }
        }
        // TOP COAT
        // TSE cov rate
        if SandDBRC.Coat4ProductType == 0
        {

                SandDBRC_TSAC4.covRate = 400
                SandDBRC_TSBC4.covRate = 400
                SandDBRC_TSColorantC4.covRate = 400

        }
        // PolyA is chosen in cap coat
        else if SandDBRC.Coat4ProductType == 1
        {
            SandDBRC_TSAC4.covRate = 450
            SandDBRC_TSBC4.covRate = 450
            SandDBRC_TSColorantC4.covRate = 450
        }
        // PolyU in cap coat
        else if SandDBRC.Coat4ProductType == 2
        {
            // Poly HS
            if SandDBRC.Coat4PtA == 0
            {
                
                SandDBRC_TSAC4.covRate = 340
                SandDBRC_TSBC4.covRate = 340
                SandDBRC_TSColorantC4.covRate = 340
            }
            
            // Poly HP
            else
            {
                // gloss
                if SandDBRC.Coat4PtB == 0
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
        else if SandDBRC.Coat4ProductType == 3
        {
            SandDBRC_TSAC4.covRate = 190
            SandDBRC_TSBC4.covRate = 190
            SandDBRC_TSColorantC4.covRate = 190
        }
    }

    var body: some View {
        VStack {
            HStack {
                Text("Industrial Sand:")
             .fontWeight(.bold)
                Text("\(ChipSizes[SandDBRC.BroadcastSizeSelection])")
                    .opacity(1)
                    .fontWeight(.bold)

             .cornerRadius(5)
             .onChange(of: SandDBRC.BroadcastSizeSelection) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandDBRC.Coat3ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandDBRC.Coat4ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandDBRC.Coat4PtA) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandDBRC.Coat4PtB) { _ in
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
                    Text("Kretus® Approved \(ChipSizes[SandDBRC.BroadcastSizeSelection]) Industrial Sand")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastSandDBRC))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandDBRC.Broadcast2Waste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("box(es)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: BroadcastSandDBRC) + SandDBRC.Broadcast2Waste) bag(s)")
            }
            .padding()
        }
    }


struct Broadcast2SandDBRC_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
