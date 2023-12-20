//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine



struct BroadcastSandRC: View {
    
    @EnvironmentObject var SandRC : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var BroadcastQuartzTS = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    
    @EnvironmentObject var TSABC_SandRC : stats
    @EnvironmentObject var TSBBC_SandRC : stats
    @EnvironmentObject var TSColorantBC_SandRC : stats

    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BroadcastSandRC : statsBroadcast
    
    @EnvironmentObject var SandRC_TSAC3 : stats2
    @EnvironmentObject var SandRC_TSBC3 : stats2
    @EnvironmentObject var SandRC_TSColorantC3 : stats2

    

    
    var ChipSizes = ["20 Mesh", "30 Mesh", "60 Mesh"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for BroadcastQuartzTS
    
    func checkChipSize() {
        if SandRC.BroadcastSizeSelection == 0 {
            BroadcastSandRC.covRate = 0.25
        }
        
        else if SandRC.BroadcastSizeSelection == 1 {
            BroadcastSandRC.covRate = 0.25
        }
        else if SandRC.BroadcastSizeSelection == 2 {
            BroadcastSandRC.covRate = 0.35
        }
    }
    
    func updateCovRate() -> Void
    {
        // Base Coat rates
        if SandRC.BroadcastSizeSelection == 0
        {
            TSABC_SandRC.covRate = 120
            TSBBC_SandRC.covRate = 120
            TSColorantBC_SandRC.covRate = 120
            
        }
        else
        {
            TSABC_SandRC.covRate = 190
            TSBBC_SandRC.covRate = 190
            TSColorantBC_SandRC.covRate = 190
            
        }
        
        // TSE cov rate
        if SandRC.Coat3ProductType == 0
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandRC_TSAC3.covRate = 120
                SandRC_TSBC3.covRate = 120
                SandRC_TSColorantC3.covRate = 120
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandRC_TSAC3.covRate = 170
                SandRC_TSBC3.covRate = 170
                SandRC_TSColorantC3.covRate = 170
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandRC_TSAC3.covRate = 200
                SandRC_TSBC3.covRate = 200
                SandRC_TSColorantC3.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandRC.Coat3ProductType == 1
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandRC_TSAC3.covRate = 160
                SandRC_TSBC3.covRate = 160
                SandRC_TSColorantC3.covRate = 160
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandRC_TSAC3.covRate = 230
                SandRC_TSBC3.covRate = 230
                SandRC_TSColorantC3.covRate = 230
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandRC_TSAC3.covRate = 270
                SandRC_TSBC3.covRate = 270
                SandRC_TSColorantC3.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandRC.Coat3ProductType == 2
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandRC_TSAC3.covRate = 120
                SandRC_TSBC3.covRate = 120
                SandRC_TSColorantC3.covRate = 120
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandRC_TSAC3.covRate = 170
                SandRC_TSBC3.covRate = 170
                SandRC_TSColorantC3.covRate = 170
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandRC_TSAC3.covRate = 200
                SandRC_TSBC3.covRate = 200
                SandRC_TSColorantC3.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandRC.Coat3ProductType == 3
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandRC_TSAC3.covRate = 100
                SandRC_TSBC3.covRate = 100
                SandRC_TSColorantC3.covRate = 100
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandRC_TSAC3.covRate = 150
                SandRC_TSBC3.covRate = 150
                SandRC_TSColorantC3.covRate = 150
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandRC_TSAC3.covRate = 200
                SandRC_TSBC3.covRate = 200
                SandRC_TSColorantC3.covRate = 200
            }
        }
        // TOP COAT
        // TSE cov rate
        if SandRC.Coat4ProductType == 0
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandRC_TSAC4.covRate = 120
                SandRC_TSBC4.covRate = 120
                SandRC_TSColorantC4.covRate = 120
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandRC_TSAC4.covRate = 170
                SandRC_TSBC4.covRate = 170
                SandRC_TSColorantC4.covRate = 170
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandRC_TSAC4.covRate = 200
                SandRC_TSBC4.covRate = 200
                SandRC_TSColorantC4.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandRC.Coat4ProductType == 1
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandRC_TSAC4.covRate = 160
                SandRC_TSBC4.covRate = 160
                SandRC_TSColorantC4.covRate = 160
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandRC_TSAC4.covRate = 230
                SandRC_TSBC4.covRate = 230
                SandRC_TSColorantC4.covRate = 230
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandRC_TSAC4.covRate = 270
                SandRC_TSBC4.covRate = 270
                SandRC_TSColorantC4.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandRC.Coat4ProductType == 2
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandRC_TSAC4.covRate = 120
                SandRC_TSBC4.covRate = 120
                SandRC_TSColorantC4.covRate = 120
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandRC_TSAC4.covRate = 170
                SandRC_TSBC4.covRate = 170
                SandRC_TSColorantC4.covRate = 170
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandRC_TSAC4.covRate = 200
                SandRC_TSBC4.covRate = 200
                SandRC_TSColorantC4.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandRC.Coat4ProductType == 3
        {
            if SandRC.BroadcastSizeSelection == 0
            {
                SandRC_TSAC4.covRate = 100
                SandRC_TSBC4.covRate = 100
                SandRC_TSColorantC4.covRate = 100
            }
            
            else if SandRC.BroadcastSizeSelection == 1
            {
                SandRC_TSAC4.covRate = 150
                SandRC_TSBC4.covRate = 150
                SandRC_TSColorantC4.covRate = 150
            }
            else if SandRC.BroadcastSizeSelection == 2
            {
                SandRC_TSAC4.covRate = 200
                SandRC_TSBC4.covRate = 200
                SandRC_TSColorantC4.covRate = 200
            }
        }
    }

    var body: some View {
        VStack {
            HStack {
                Text("Industrial Sand:")
             .fontWeight(.bold)
             Picker(selection: $SandRC.BroadcastSizeSelection, //used for size of chips
                 label: ZStack {
                     Text("\(ChipSizes[SandRC.BroadcastSizeSelection])")
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
             .onChange(of: SandRC.BroadcastSizeSelection) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandRC.Coat3ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandRC.Coat4ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
                // texture color choices
                
                /*
                 
                Picker(selection: $SandRC.BroadcastSelection,
                    label: ZStack {
                        Text("\(textureChoices[SandRC.BroadcastSelection])")
                            .opacity(1)
                        Rectangle()
                            .fill(Color.gray)
                            .opacity(0.2)
                            .cornerRadius(5)
                            .frame(width: 200, height: 25)
                          //  .padding()
                }) {
                   ForEach (0 ..< textureChoices.count, id: \.self) { index in
                       Text(self.textureChoices[index]).tag(index)
                   }
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                 
                 */
                
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
                    Text("Kretus® Approved \(ChipSizes[SandRC.BroadcastSizeSelection]) Industrial Sand")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastSandRC))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandRC.BroadcastWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("box(es)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: BroadcastSandRC) + SandRC.BroadcastWaste) bag(s)")
            }
            .padding()
        }
    }


struct BroadcastSandRC_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
