//
//  CoveColorInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 7/18/22.
//

import SwiftUI

struct PCoatCoveColorChipInfo: View {
    
    @State var showingAlert = false
    var body: some View {
        
        Button(action: {
            self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Epoxy Cove Color Chip Prime/Cap Coat"), message:
                    Text("Mixing Ratios: A:TSC:B = 1 gal : 16 oz : 1/2 gal \n\n Coverage Rates: 300 lft/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct PCoatCoveColorChipInfo_Previews: PreviewProvider {
    static var previews: some View {
        PCoatCoveColorInfo()
    }
}
