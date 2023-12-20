//
//  PCoatEpoxyMVR.swift
//  Calculator
//
//  Created by Kane Davidson on 6/13/22.
//

import SwiftUI

struct MVRCoatEpoxyMVR: View {
    
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
        ThicknessEpoxyMVR()
        
        // Part A Picker
        Text("Top Shelf Epoxy® Part A:")
            .fontWeight(.bold)
        Picker(selection: $epoxyMVR.MVRCoatPtA,
               label: ZStack {
            Text("\(typesA[epoxyMVR.MVRCoatPtA])")
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
        
        // Part B Picker
        Text("Top Shelf Epoxy® Part B:")
            .fontWeight(.bold)
        Picker(selection: $epoxyMVR.MVRCoatPtB,
               label: ZStack {
            Text("\(typesB[epoxyMVR.MVRCoatPtB])")
                .opacity(1)
            Rectangle()
                .fill(Color.black)
                .opacity(0.9)
                .cornerRadius(5)
                .frame(width: 225, height: 25)
            //  .padding()
        }) {
            ForEach (0 ..< typesB.count, id: \.self) { index in
                Text(self.typesB[index]).tag(index)
            }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(5)
        
        // coat summary
        VStack
        {
            HStack
            {
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
            HStack
            {
                Text("\(typesACodes[epoxyMVR.MVRCoatPtA])")
                    .font(.caption)
                Spacer()
                Text("Top Shelf Epoxy® Part A - \(typesA[epoxyMVR.MVRCoatPtA])")
                    .font(.caption)
                Spacer()
                Text("\(quant(product:MVRCoatTSA))")
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
                Text("\(quant(product:MVRCoatTSB))")
                    .font(.caption)
            }

        }
        .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
        .cornerRadius(5.0)
        .padding()
        
        HStack {
            Text("Add Waste Factor: ")
            Spacer()
            TextField("",value: $epoxyMVR.MVRCoatWaste, formatter: NumberFormatter())
                .frame(width:30, height:25)
                .background(Color(red:239.0/255.0, green: 243.0/255.0, blue: 244.0/250, opacity: 1.0))
                .cornerRadius(5.0)
            Text("kit(s)")
        }
        .padding()
        HStack {
            Text("Total:")
            Spacer()
            Text("\(quant(product: MVRCoatTSA) + epoxyMVR.MVRCoatWaste) kit(s)")
        }
        .padding()
    }
}

struct MVRCoatEpoxyMVR_Previews: PreviewProvider {
    static var previews: some View {
        PCoatEpoxyMVR()
    }
}
