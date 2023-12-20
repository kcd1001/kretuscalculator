//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessEpoxyCoveColorChip: View {
    
    @EnvironmentObject var CoveColorChip : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var bCoatCoveChipTSA : stats2
    @EnvironmentObject var bCoatCoveChipTSB : stats2
    @EnvironmentObject var bCoatCoveChipTSColorant : stats2
    @EnvironmentObject var bCoatCoveChipTexture : stats2
    
    let thickness = ["4\"", "6 \""]
    
    var body: some View {
        VStack {
            HStack {
                Text("System Thickness")
                    .fontWeight(.heavy)
                Spacer()
                ChipRCInfo()
            }.padding()
            Picker(selection: $CoveColorChip.ThicknessSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onChange(of: CoveColorChip.ThicknessSelection) { _ in
                if CoveColorChip.ThicknessSelection == 0 {
                    bCoatCoveChipTSA.covRate = 60
                    bCoatCoveChipTSB.covRate = 60
                    bCoatCoveChipTSColorant.covRate = 60
                    bCoatCoveChipTexture.covRate = 60
                    
                }
                if CoveColorChip.ThicknessSelection == 1 {
                    bCoatCoveChipTSA.covRate = 40
                    bCoatCoveChipTSB.covRate = 40
                    bCoatCoveChipTSColorant.covRate = 40
                    bCoatCoveChipTexture.covRate = 40
                }
            }
        }
    }
}


struct ThicknessEpoxyCoveColorChip_Previews: PreviewProvider {
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
