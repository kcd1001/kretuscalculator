//
//  ChipTSView.swift
//  Calculator
//
//  Created by Kane Davidson on 9/8/21.
//

import SwiftUI

class OptionsEpoxyMVR: ObservableObject {
    
    @Published var isTopCoat2 : Bool = false
    @Published var isPrimeCoat = false
    @Published var isMVR = false
    @Published var ThicknessSelection : Int = 0
    //    @Published var isUVRes : Bool = false
    //    @Published var isTexture : Bool = false
    //    @Published var showingPicker : Bool = false
    //    @Published var ThicknessSelection : Int = 0
    //    @Published var totalThickness : Int = 0
    
}

struct EpoxyMVRView: View {
    
    var body: some View {
        
        let sysOptions = OptionsEpoxyMVR()
        
        let epoxyMVR = EpoxyMVRValues()
        let sf = SquareFeet()
        
        let PCoatTSA = stats2(product: "Urethane Polymer Concrete Part A:", covRate: 450, MixRat: 1)
        let PCoatTSB = stats2(product: "Urethane Polymer Concrete Part B:", covRate: 450, MixRat: 0.5)
        
        let MVRCoatTSA = stats(product: "TSE Part A", covRate: 210, MixRat: 1)
        let MVRCoatTSB = stats(product: "TSE Part B", covRate: 210, MixRat: 0.5)


            ScrollView {
                VStack {
                    SFFormChip()
                    SystemOptions()
                    
                  //  UPC_Colorant_()
                  //    .padding()
                    CoatChoicesEpoxyMVR()
                               
                }.navigationBarTitle("Epoxy MVR", displayMode: .inline)
            }
            .environmentObject(sf)
            .environmentObject(sysOptions)
            .environmentObject(epoxyMVR)
            .environmentObject(PCoatTSA)
            .environmentObject(PCoatTSB)
            .environmentObject(MVRCoatTSA)
            .environmentObject(MVRCoatTSB)

        }
    }


struct EpoxyMVRView_Previews: PreviewProvider {
    static var previews: some View {
        ChipTSView()
    }
}
