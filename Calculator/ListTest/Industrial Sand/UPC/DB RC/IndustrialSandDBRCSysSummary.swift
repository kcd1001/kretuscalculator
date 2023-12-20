//
//  EpoxyCoveColorSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 7/4/22.
//

import SwiftUI

struct IndustrialSandDBRCSysSummary: View {
    
    @EnvironmentObject var Chip : ChipOptions
    @EnvironmentObject var ChipTS : ColorChipValuesTS //Used for coat selections
    @EnvironmentObject var SandDBRC : ColorQuartzTSValues //Used for coat selections
    @EnvironmentObject var SandRC : ColorQuartzTSValues //Used for coat selections

    @EnvironmentObject var CoveColorQuartz : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var sf : SquareFeet //Square feet
    
    @EnvironmentObject var bCoatCoveQuartzTSA : stats2
    @EnvironmentObject var bCoatCoveQuartzTSB : stats2
    @EnvironmentObject var bCoatCoveQuartzTSColorant : stats2
    @EnvironmentObject var bCoatCoveQuartzTexture : stats2
    
    var BroadcastSandDBRC = statsBroadcast(product: "Color Quartz", covRate: 0.25, MixRat: 50)
    var TSMvr = stats(product: "Epoxy MVR", covRate: 190, MixRat: 1)

    
    var UPCColorantChoices = ["No Color (Unpigmented)", "Black", "Blue","Bone", "Brown", "Clay", "Gray", "Green", "Mustard", "Red"]
    
    var UPCColorantCodes = ["", "EX-KUPCCLBK-EA", "EX-KUPCCLBL-EA", "EX-KUPCCLWH-EA", "EX-KUPCCLBR-EA","EX-KUPCCLCL-EA", "EX-KUPCCLGY-EA", "EX-KUPCCLGR-EA", "EX-KUPCCLCY-EA","EX-KUPCCLRD-EA"]

    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    func quantBroadcast(product : statsBroadcast) -> Int {
        let quantity : Float = (sf.squareF * product.covRate)
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required for BroadcastQuartzTS
    
    var body: some View {
        
        if Chip.isPrimeCoat
        {
        PCoatIndustrialSandDBRCSum()
        }
        
        if Chip.isMVR
        {
            Text("MVR Coat")
                .bold()
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
                HStack{
                    Text("EX-KUPCARC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part A - RC/TT, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr) + SandRC.MVRWaste)")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-BRCUVAP6-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part B - RC UV AP, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr) + SandRC.MVRWaste)")
                        .font(.caption)
                }
                
                HStack{
                    Text("EX-KUPCRFC-EA")
                        .font(.caption)
                    Spacer()
                    Text("UPC Part C - RC, 6 lbs")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product: TSMvr) + SandRC.MVRWaste)")
                        .font(.caption)
                }
                
                if SandRC.MVRPtA != 0
                {
                    HStack{
                        Text("\(UPCColorantCodes[SandRC.MVRPtA])")
                            .font(.caption)
                        Spacer()
                        Text("UPC Colorant - \(UPCColorantChoices[SandRC.MVRPtA]), 4 oz")
                            .font(.caption)
                        Spacer()
                        Text("\(quant(product: TSMvr) + SandRC.MVRWaste)")
                            .font(.caption)
                    }
                }
            }
            
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
        }
        
        BCoatIndustrialSandDBRCSum()
        
        BroadcastSandDBRCSum()
        
        BCoat2IndustrialSandDBRCSum()
        
        Broadcast2SandDBRCSum()
        
        IndustrialSandDBRCCapCoatSum()
        
        IndustrialSandDBRCTopCoatSum()
        
    }


struct IndustrialSandDBRCSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        EpoxyCoveColorSysSummary()
    }
}
}
