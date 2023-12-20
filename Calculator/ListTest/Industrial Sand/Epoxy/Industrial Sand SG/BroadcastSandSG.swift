//
//  BroadcastGarage.swift
//  Calculator
//
//  Created by Kane Davidson on 5/19/21.
//

import SwiftUI
import Combine



struct BroadcastSandSG: View {
    
    @EnvironmentObject var SandSG : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
//    var BroadcastQuartzTS = stats(product: "Color Chip:", covRate: 0.15, MixRat: 55)
    @EnvironmentObject var TSA_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var TSB_QuartzTS : stats //Used for system stats (mixRat,CovRate, etc)
    
    @EnvironmentObject var TSABC_SandSG : stats
    @EnvironmentObject var TSBBC_SandSG : stats
    @EnvironmentObject var TSColorantBC_SandSG : stats

    @EnvironmentObject var TSColorant : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var BroadcastSandSG : statsBroadcast
    
    @EnvironmentObject var SandSG_TSAC3 : stats2
    @EnvironmentObject var SandSG_TSBC3 : stats2
    @EnvironmentObject var SandSG_TSColorantC3 : stats2

    

    
    var ChipSizes = ["20 Mesh", "30 Mesh", "60 Mesh"]
    
    let textureChoices = ["Aspen Green", "Autumn Red", "Black", "Blue", "Brown", "Buff", "Burgundy", "Cayman Green", "Chocolate Brown", "Clear", "Colbalt Blue", "Coral Rose", "Forest Green", "Glacier Blue", "Granite", "Gray", "Green", "Peach", "Plum", "Red", "Salt & Pepper", "Smoke", "Spice", "Suntan", "Tan", "Tobacco", "Tweed", "White", "Yellow", "Industrial Sand" ]
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
         let kit = Int(ceil(Float(quantity / product.MixRat)))
         return kit
        } // returns number of kits required for BroadcastQuartzTS

    
    func updateCovRate() -> Void
    {
        // Base Coat rates
        if SandSG.BroadcastSizeSelection == 0
        {
            TSABC_SandSG.covRate = 120
            TSBBC_SandSG.covRate = 120
            TSColorantBC_SandSG.covRate = 120
            
        }
        else
        {
            TSABC_SandSG.covRate = 210
            TSBBC_SandSG.covRate = 210
            TSColorantBC_SandSG.covRate = 210
            
        }
        
        // TSE cov rate
        if SandSG.Coat3ProductType == 0
        {
            if SandSG.BroadcastSizeSelection == 0
            {
                SandSG_TSAC3.covRate = 120
                SandSG_TSBC3.covRate = 120
                SandSG_TSColorantC3.covRate = 120
            }
            
            else if SandSG.BroadcastSizeSelection == 1
            {
                SandSG_TSAC3.covRate = 170
                SandSG_TSBC3.covRate = 170
                SandSG_TSColorantC3.covRate = 170
            }
            else if SandSG.BroadcastSizeSelection == 2
            {
                SandSG_TSAC3.covRate = 200
                SandSG_TSBC3.covRate = 200
                SandSG_TSColorantC3.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandSG.Coat3ProductType == 1
        {
            if SandSG.BroadcastSizeSelection == 0
            {
                SandSG_TSAC3.covRate = 160
                SandSG_TSBC3.covRate = 160
                SandSG_TSColorantC3.covRate = 160
            }
            
            else if SandSG.BroadcastSizeSelection == 1
            {
                SandSG_TSAC3.covRate = 230
                SandSG_TSBC3.covRate = 230
                SandSG_TSColorantC3.covRate = 230
            }
            else if SandSG.BroadcastSizeSelection == 2
            {
                SandSG_TSAC3.covRate = 270
                SandSG_TSBC3.covRate = 270
                SandSG_TSColorantC3.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandSG.Coat3ProductType == 2
        {
            if SandSG.BroadcastSizeSelection == 0
            {
                SandSG_TSAC3.covRate = 120
                SandSG_TSBC3.covRate = 120
                SandSG_TSColorantC3.covRate = 120
            }
            
            else if SandSG.BroadcastSizeSelection == 1
            {
                SandSG_TSAC3.covRate = 170
                SandSG_TSBC3.covRate = 170
                SandSG_TSColorantC3.covRate = 170
            }
            else if SandSG.BroadcastSizeSelection == 2
            {
                SandSG_TSAC3.covRate = 200
                SandSG_TSBC3.covRate = 200
                SandSG_TSColorantC3.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandSG.Coat3ProductType == 3
        {
            if SandSG.BroadcastSizeSelection == 0
            {
                SandSG_TSAC3.covRate = 100
                SandSG_TSBC3.covRate = 100
                SandSG_TSColorantC3.covRate = 100
            }
            
            else if SandSG.BroadcastSizeSelection == 1
            {
                SandSG_TSAC3.covRate = 150
                SandSG_TSBC3.covRate = 150
                SandSG_TSColorantC3.covRate = 150
            }
            else if SandSG.BroadcastSizeSelection == 2
            {
                SandSG_TSAC3.covRate = 200
                SandSG_TSBC3.covRate = 200
                SandSG_TSColorantC3.covRate = 200
            }
        }
        // TOP COAT
        // TSE cov rate
        if SandSG.Coat4ProductType == 0
        {
            if SandSG.BroadcastSizeSelection == 0
            {
                SandSG_TSAC4.covRate = 120
                SandSG_TSBC4.covRate = 120
                SandSG_TSColorantC4.covRate = 120
            }
            
            else if SandSG.BroadcastSizeSelection == 1
            {
                SandSG_TSAC4.covRate = 170
                SandSG_TSBC4.covRate = 170
                SandSG_TSColorantC4.covRate = 170
            }
            else if SandSG.BroadcastSizeSelection == 2
            {
                SandSG_TSAC4.covRate = 200
                SandSG_TSBC4.covRate = 200
                SandSG_TSColorantC4.covRate = 200
            }
        }
        // PolyA is chosen in cap coat
        else if SandSG.Coat4ProductType == 1
        {
            if SandSG.BroadcastSizeSelection == 0
            {
                SandSG_TSAC4.covRate = 160
                SandSG_TSBC4.covRate = 160
                SandSG_TSColorantC4.covRate = 160
            }
            
            else if SandSG.BroadcastSizeSelection == 1
            {
                SandSG_TSAC4.covRate = 230
                SandSG_TSBC4.covRate = 230
                SandSG_TSColorantC4.covRate = 230
            }
            else if SandSG.BroadcastSizeSelection == 2
            {
                SandSG_TSAC4.covRate = 270
                SandSG_TSBC4.covRate = 270
                SandSG_TSColorantC4.covRate = 270
            }
        }
        // PolyU in cap coat
        else if SandSG.Coat4ProductType == 2
        {
            if SandSG.BroadcastSizeSelection == 0
            {
                SandSG_TSAC4.covRate = 120
                SandSG_TSBC4.covRate = 120
                SandSG_TSColorantC4.covRate = 120
            }
            
            else if SandSG.BroadcastSizeSelection == 1
            {
                SandSG_TSAC4.covRate = 170
                SandSG_TSBC4.covRate = 170
                SandSG_TSColorantC4.covRate = 170
            }
            else if SandSG.BroadcastSizeSelection == 2
            {
                SandSG_TSAC4.covRate = 200
                SandSG_TSBC4.covRate = 200
                SandSG_TSColorantC4.covRate = 200
            }
        }
        // UPC in cap coat
        else if SandSG.Coat4ProductType == 3
        {
            if SandSG.BroadcastSizeSelection == 0
            {
                SandSG_TSAC4.covRate = 100
                SandSG_TSBC4.covRate = 100
                SandSG_TSColorantC4.covRate = 100
            }
            
            else if SandSG.BroadcastSizeSelection == 1
            {
                SandSG_TSAC4.covRate = 150
                SandSG_TSBC4.covRate = 150
                SandSG_TSColorantC4.covRate = 150
            }
            else if SandSG.BroadcastSizeSelection == 2
            {
                SandSG_TSAC4.covRate = 200
                SandSG_TSBC4.covRate = 200
                SandSG_TSColorantC4.covRate = 200
            }
        }
    }

    var body: some View {
        VStack {
            HStack {
            Text("Industrial Sand:")
             .fontWeight(.bold)
             Picker(selection: $SandSG.BroadcastSizeSelection, //used for size of chips
                 label: ZStack {
                     Text("\(ChipSizes[SandSG.BroadcastSizeSelection])")
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
             .onChange(of: SandSG.BroadcastSizeSelection) { _ in
                 updateCovRate()
             }
             .onChange(of: SandSG.Coat3ProductType) { _ in
                 updateCovRate()
             }
             .onChange(of: SandSG.Coat4ProductType) { _ in
                 updateCovRate()
             }
                // texture color choices
                
                /*
                 
                Picker(selection: $SandSG.BroadcastSelection,
                    label: ZStack {
                        Text("\(textureChoices[SandSG.BroadcastSelection])")
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
                SandSGBroadcastInfo()
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
                    Text("Kretus® Approved \(ChipSizes[SandSG.BroadcastSizeSelection]) Industrial Sand")
                        .font(.caption)
                    Spacer()
                    Text("\(quantBroadcast(product: BroadcastSandSG))")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            HStack {
                Text("Add Waste Factor: ")
                Spacer()
                TextField("",value: $SandSG.BroadcastWaste, formatter: NumberFormatter())
                    .frame(width:30, height:25)
                    .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                    .cornerRadius(5.0)
                Text("bag(s)")
            }
            .padding()
            HStack {
                Text("Total:")
                Spacer()
                Text("\(quantBroadcast(product: BroadcastSandSG) + SandSG.BroadcastWaste) bag(s)")
            }
            .padding()
        }
    }


struct BroadcastSandSG_Previews: PreviewProvider {
    static var previews: some View {
        BroadcastGarage()
    }
}
}
