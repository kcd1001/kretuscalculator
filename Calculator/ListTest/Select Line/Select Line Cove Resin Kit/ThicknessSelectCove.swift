//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessSelectCove: View {
    
    @EnvironmentObject var CoveColor : EpoxyCoveSelections //Used for coat selections
    @EnvironmentObject var selectTSA_CoveResin : stats //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var selectTSB_CoveResin : stats //Used for system stats (mixRat,CovRate, etc)
    
    let thickness = ["4\"", "6 \""]
    
    var body: some View {
        VStack {
            HStack {
                Text("Thickness")
                    .fontWeight(.heavy)
                Spacer()
 //               ChipRCInfo()
            }.padding()
            Picker(selection: $CoveColor.ThicknessSelectSelection, label: Text("Thickness")) {
                ForEach (0 ..< thickness.count, id: \.self) {
                    Text(self.thickness[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .offset(y:-15)
            .onChange(of: CoveColor.ThicknessSelectSelection) { _ in
                if CoveColor.ThicknessSelection == 0 {
                    selectTSA_CoveResin.covRate = 60

                    
                }
                if CoveColor.ThicknessSelectSelection == 1 {
                    selectTSA_CoveResin.covRate = 40

                }
            }
        }
    }
}


struct ThicknessSelectCove_Previews: PreviewProvider {
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
