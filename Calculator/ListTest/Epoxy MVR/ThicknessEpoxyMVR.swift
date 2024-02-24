//
//  Thickness.swift
//  ListTest
//
//  Created by Kane Davidson on 11/4/20.
//

import SwiftUI
import Combine

struct ThicknessEpoxyMVR: View {
    
    @EnvironmentObject var sysOptions : OptionsEpoxyMVR
    @EnvironmentObject var PCoatTSA : stats2 //Used for system stats (mixRat,CovRate, etc)
    @EnvironmentObject var PCoatTSB : stats2 //Used for system stats (mixRat,CovRate, etc)

    @EnvironmentObject var MVRCoatTSA : stats
    @EnvironmentObject var MVRCoatTSB : stats
    
        
    let thickness = ["12 mils", "16 mils"]
    
    var body: some View {
        
            HStack {
                Text("Coating Thickness: ")
                    .fontWeight(.heavy)
                Spacer()
                Picker(selection: $sysOptions.ThicknessSelection, label: Text("Thickness")) {
                    ForEach (0 ..< thickness.count, id: \.self) {
                        Text(self.thickness[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: sysOptions.ThicknessSelection) { _ in
                    if sysOptions.ThicknessSelection == 0 {
                        MVRCoatTSA.covRate = 202
                        MVRCoatTSB.covRate = 202
                        
                        
                    }
                    if sysOptions.ThicknessSelection == 1 {
                        MVRCoatTSA.covRate = 150
                        MVRCoatTSB.covRate = 150
                        
                        
                    }
                }
            }.padding()
            
        
    }
}


struct ThicknessEpoxyMVR_Previews: PreviewProvider {
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
