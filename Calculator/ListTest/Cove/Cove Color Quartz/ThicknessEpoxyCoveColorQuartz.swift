//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessEpoxyCoveColorQuartz: View {
    
    @EnvironmentObject var CoveColorQuartz : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var bCoatCoveQuartzTSA : stats2
    @EnvironmentObject var bCoatCoveQuartzTSB : stats2
    @EnvironmentObject var bCoatCoveQuartzTSColorant : stats2
    @EnvironmentObject var bCoatCoveQuartzTexture : stats2
    
    let thickness = ["4\"", "6 \""]
    
    var body: some View {
        VStack {
            HStack {
                Text("System Thickness")
                    .fontWeight(.heavy)
                Spacer()
//                ChipRCInfo()
            }.padding()
            Picker(selection: $CoveColorQuartz.ThicknessSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onChange(of: CoveColorQuartz.ThicknessSelection) { _ in
                if CoveColorQuartz.ThicknessSelection == 0 {
                    bCoatCoveQuartzTSA.covRate = 60
                    bCoatCoveQuartzTSB.covRate = 60
                    bCoatCoveQuartzTSColorant.covRate = 60
                    bCoatCoveQuartzTexture.covRate = 60
                    
                }
                if CoveColorQuartz.ThicknessSelection == 1 {
                    bCoatCoveQuartzTSA.covRate = 40
                    bCoatCoveQuartzTSB.covRate = 40
                    bCoatCoveQuartzTSColorant.covRate = 40
                    bCoatCoveQuartzTexture.covRate = 40
                }
            }
        }
    }
}


struct ThicknessEpoxyCoveColorQuartz_Previews: PreviewProvider {
    static let test1 = stats(product: "Urethane Polymer Concrete Part A:", covRate: 200, MixRat: 6)
    static let test2 = stats(product: "Urethane Polymer Concrete Part B:", covRate: 200, MixRat: 6)
    static let test3 = stats(product: "Urethane Polymer Concrete Part C:", covRate: 200, MixRat: 6)
    static var previews: some View {
        Thickness()
            .environmentObject(test1)
            .environmentObject(test2)
            .environmentObject(test3)
    }
}
