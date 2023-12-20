//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessEpoxyCoveColor: View {
    
    @EnvironmentObject var CoveColor : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var bCoatCoveTSA : stats2
    @EnvironmentObject var bCoatCoveTSB : stats2
    @EnvironmentObject var bCoatCoveTSColorant : stats2
    @EnvironmentObject var bCoatCoveTexture : stats2
    
    let thickness = ["4\"", "6 \""]
    
    var body: some View {
        VStack {
            HStack {
                Text("System Thickness")
                    .fontWeight(.heavy)
                Spacer()
 //               ChipRCInfo()
            }.padding()
            Picker(selection: $CoveColor.ThicknessSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onChange(of: CoveColor.ThicknessSelection) { _ in
                if CoveColor.ThicknessSelection == 0 {
                    bCoatCoveTSA.covRate = 60
                    bCoatCoveTSB.covRate = 60
                    bCoatCoveTSColorant.covRate = 60
                    bCoatCoveTexture.covRate = 60
                    
                }
                if CoveColor.ThicknessSelection == 1 {
                    bCoatCoveTSA.covRate = 40
                    bCoatCoveTSB.covRate = 40
                    bCoatCoveTSColorant.covRate = 40
                    bCoatCoveTexture.covRate = 40
                }
            }
        }
    }
}


struct ThicknessEpoxyCoveColor_Previews: PreviewProvider {
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
