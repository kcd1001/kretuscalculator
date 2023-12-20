//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine



struct BroadcastSandTS: View {
    
    @EnvironmentObject var SandTS : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var BroadcastQuartzTS = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    
    @EnvironmentObject var TSABC_SandTS : stats
    @EnvironmentObject var TSBBC_SandTS : stats
    @EnvironmentObject var TSColorantBC_SandTS : stats

    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BroadcastSandTS : statsBroadcast
    
    @EnvironmentObject var sandTS_TSAC3 : stats2
    @EnvironmentObject var sandTS_TSBC3 : stats2
    @EnvironmentObject var sandTS_TSColorantC3 : stats2

    

    
    var ChipSizes = ["20 Mesh", "30 Mesh", "60 Mesh"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for BroadcastQuartzTS
    
    func checkChipSize() {
        if SandTS.BroadcastSizeSelection == 0 {
            BroadcastSandTS.covRate = 0.25
        }
        
        else if SandTS.BroadcastSizeSelection == 1 {
            BroadcastSandTS.covRate = 0.25
        }
        else if SandTS.BroadcastSizeSelection == 2 {
            BroadcastSandTS.covRate = 0.35
        }
    }
    
    func updateCovRate() -> Void
    {
        // Base Coat rates
        if SandTS.BroadcastSizeSelection == 0
        {
            TSABC_SandTS.covRate = 120
            TSBBC_SandTS.covRate = 120
            TSColorantBC_SandTS.covRate = 120
            
        }
        else
        {
            TSABC_SandTS.covRate = 210
            TSBBC_SandTS.covRate = 210
            TSColorantBC_SandTS.covRate = 210
            
        }
        
        // TSE cov rate
        if SandTS.Coat3ProductType == 0
        {
            if SandTS.BroadcastSizeSelection == 0
            {
                sandTS_TSAC3.covRate = 120
                sandTS_TSBC3.covRate = 120
                sandTS_TSColorantC3.covRate = 120
            }
            
            else if SandTS.BroadcastSizeSelection == 1
            {
                sandTS_TSAC3.covRate = 170
                sandTS_TSBC3.covRate = 170
                sandTS_TSColorantC3.covRate = 170
            }
            else if SandTS.BroadcastSizeSelection == 2
            {
                sandTS_TSAC3.covRate = 200
                sandTS_TSBC3.covRate = 200
                sandTS_TSColorantC3.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandTS.Coat3ProductType == 1
        {
            if SandTS.BroadcastSizeSelection == 0
            {
                sandTS_TSAC3.covRate = 160
                sandTS_TSBC3.covRate = 160
                sandTS_TSColorantC3.covRate = 160
            }
            
            else if SandTS.BroadcastSizeSelection == 1
            {
                sandTS_TSAC3.covRate = 230
                sandTS_TSBC3.covRate = 230
                sandTS_TSColorantC3.covRate = 230
            }
            else if SandTS.BroadcastSizeSelection == 2
            {
                sandTS_TSAC3.covRate = 270
                sandTS_TSBC3.covRate = 270
                sandTS_TSColorantC3.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandTS.Coat3ProductType == 2
        {
            if SandTS.BroadcastSizeSelection == 0
            {
                sandTS_TSAC3.covRate = 120
                sandTS_TSBC3.covRate = 120
                sandTS_TSColorantC3.covRate = 120
            }
            
            else if SandTS.BroadcastSizeSelection == 1
            {
                sandTS_TSAC3.covRate = 170
                sandTS_TSBC3.covRate = 170
                sandTS_TSColorantC3.covRate = 170
            }
            else if SandTS.BroadcastSizeSelection == 2
            {
                sandTS_TSAC3.covRate = 200
                sandTS_TSBC3.covRate = 200
                sandTS_TSColorantC3.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandTS.Coat3ProductType == 3
        {
            if SandTS.BroadcastSizeSelection == 0
            {
                sandTS_TSAC3.covRate = 100
                sandTS_TSBC3.covRate = 100
                sandTS_TSColorantC3.covRate = 100
            }
            
            else if SandTS.BroadcastSizeSelection == 1
            {
                sandTS_TSAC3.covRate = 150
                sandTS_TSBC3.covRate = 150
                sandTS_TSColorantC3.covRate = 150
            }
            else if SandTS.BroadcastSizeSelection == 2
            {
                sandTS_TSAC3.covRate = 200
                sandTS_TSBC3.covRate = 200
                sandTS_TSColorantC3.covRate = 200
            }
        }
        // TOP COAT
        // TSE cov rate
        if SandTS.Coat4ProductType == 0
        {
            if SandTS.BroadcastSizeSelection == 0
            {
                sandTS_TSAC4.covRate = 120
                sandTS_TSBC4.covRate = 120
                sandTS_TSColorantC4.covRate = 120
            }
            
            else if SandTS.BroadcastSizeSelection == 1
            {
                sandTS_TSAC4.covRate = 170
                sandTS_TSBC4.covRate = 170
                sandTS_TSColorantC4.covRate = 170
            }
            else if SandTS.BroadcastSizeSelection == 2
            {
                sandTS_TSAC4.covRate = 200
                sandTS_TSBC4.covRate = 200
                sandTS_TSColorantC4.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandTS.Coat4ProductType == 1
        {
            if SandTS.BroadcastSizeSelection == 0
            {
                sandTS_TSAC4.covRate = 160
                sandTS_TSBC4.covRate = 160
                sandTS_TSColorantC4.covRate = 160
            }
            
            else if SandTS.BroadcastSizeSelection == 1
            {
                sandTS_TSAC4.covRate = 230
                sandTS_TSBC4.covRate = 230
                sandTS_TSColorantC4.covRate = 230
            }
            else if SandTS.BroadcastSizeSelection == 2
            {
                sandTS_TSAC4.covRate = 270
                sandTS_TSBC4.covRate = 270
                sandTS_TSColorantC4.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandTS.Coat4ProductType == 2
        {
            if SandTS.BroadcastSizeSelection == 0
            {
                sandTS_TSAC4.covRate = 120
                sandTS_TSBC4.covRate = 120
                sandTS_TSColorantC4.covRate = 120
            }
            
            else if SandTS.BroadcastSizeSelection == 1
            {
                sandTS_TSAC4.covRate = 170
                sandTS_TSBC4.covRate = 170
                sandTS_TSColorantC4.covRate = 170
            }
            else if SandTS.BroadcastSizeSelection == 2
            {
                sandTS_TSAC4.covRate = 200
                sandTS_TSBC4.covRate = 200
                sandTS_TSColorantC4.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandTS.Coat4ProductType == 3
        {
            if SandTS.BroadcastSizeSelection == 0
            {
                sandTS_TSAC4.covRate = 100
                sandTS_TSBC4.covRate = 100
                sandTS_TSColorantC4.covRate = 100
            }
            
            else if SandTS.BroadcastSizeSelection == 1
            {
                sandTS_TSAC4.covRate = 150
                sandTS_TSBC4.covRate = 150
                sandTS_TSColorantC4.covRate = 150
            }
            else if SandTS.BroadcastSizeSelection == 2
            {
                sandTS_TSAC4.covRate = 200
                sandTS_TSBC4.covRate = 200
                sandTS_TSColorantC4.covRate = 200
            }
        }
    }

    var body: some View {
        VStack {
            HStack {
                Text("Industrial Sand:")
             .fontWeight(.bold)
             Picker(selection: $SandTS.BroadcastSizeSelection, //used for size of chips
                 label: ZStack {
                     Text("\(ChipSizes[SandTS.BroadcastSizeSelection])")
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
             .onChange(of: SandTS.BroadcastSizeSelection) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandTS.Coat3ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
             .onChange(of: SandTS.Coat4ProductType) { _ in
                 checkChipSize()
                 updateCovRate()
             }
                // texture color choices
                
                /*
                 
                Picker(selection: $SandTS.BroadcastSelection,
                    label: ZStack {
                        Text("\(textureChoices[SandTS.BroadcastSelection])")
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
                    Text("Kretus® Approved \(ChipSizes[SandTS.BroadcastSizeSelection]) Industrial Sand")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastSandTS))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandTS.BroadcastWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("bag(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: BroadcastSandTS) + SandTS.BroadcastWaste) bag(s)")
            }
            .padding()
        }
    }


struct BroadcastSandTS_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
