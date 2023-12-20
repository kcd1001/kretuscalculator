//
//  EpoxyMVRSysSummary.swift
//  Calculator
//
//  Created by Kane Davidson on 6/13/22.
//

import SwiftUI

struct EpoxyMVRSysSummary: View {
    
    @EnvironmentObject var sysOptions : OptionsEpoxyMVR
    @EnvironmentObject var PCoatTSA : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PCoatTSB : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var epoxyMVR : EpoxyMVRValues
    @EnvironmentObject var MVRCoatTSA : stats
    @EnvironmentObject var MVRCoatTSB : stats
    @EnvironmentObject var sf : SquareFeet
    
    var typesA = ["A Resin - Clear", "CR Resin - Clear "]
    var typesB = ["MVR - EZ", "MVR - FC"]
    
    let typesACodes = ["EX-KTSARCL-01", "EX-KTSECRRC-01"]
    let typesBCodes = ["EX-KTSMVZB-EA", "EX-KTSMVFB-EA"]
    
    func quant(product : stats) -> Int {
        let quantity : Float = (sf.squareF / product.covRate) * product.MixRat
        let kit = Int(ceil(Float(quantity / product.MixRat)))
        return kit
    } // returns number of kits required
    
    var body: some View {
        VStack
        {
            if sysOptions.isPrimeCoat == true
            {
            Text("Prime Coat")
                .bold()
            VStack {
                // headers
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
                // products
                HStack
                {
                    Text("\(typesACodes[epoxyMVR.PCoatPtA])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf Epoxy® Part A - \(typesA[epoxyMVR.PCoatPtA])")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product:PCoatTSA) + epoxyMVR.PCoatWaste)")
                        .font(.caption)
                }
                HStack
                {
                    Text("\(typesBCodes[epoxyMVR.PCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf Epoxy® Part B - \(typesA[epoxyMVR.PCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product:PCoatTSB) + epoxyMVR.PCoatWaste)")
                        .font(.caption)
                }
                HStack
                {
                    Text("EX-KSLVCLN-EA")
                        .font(.caption)
                    Spacer()
                    Text("Solvent Cleaner")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product:PCoatTSA) + epoxyMVR.PCoatWaste)")
                        .font(.caption)
                }
        }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            }
            // MVR coat
            Text("MVR Coat")
                .bold()
            VStack {
                // headers
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
                // products
                HStack
                {
                    Text("\(typesACodes[epoxyMVR.MVRCoatPtA])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf Epoxy® Part A - \(typesA[epoxyMVR.MVRCoatPtA])")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product:MVRCoatTSA) + epoxyMVR.MVRCoatWaste)")
                        .font(.caption)
                }
                HStack
                {
                    Text("\(typesBCodes[epoxyMVR.MVRCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("Top Shelf Epoxy® Part B - \(typesB[epoxyMVR.MVRCoatPtB])")
                        .font(.caption)
                    Spacer()
                    Text("\(quant(product:MVRCoatTSB) + epoxyMVR.MVRCoatWaste)")
                        .font(.caption)
                }

            }
            .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
            .cornerRadius(5.0)
            .padding()
            
    }
        
}

struct EpoxyMVRSysSummary_Previews: PreviewProvider {
    static var previews: some View {
        EpoxyMVRSysSummary()
    }
}
}
