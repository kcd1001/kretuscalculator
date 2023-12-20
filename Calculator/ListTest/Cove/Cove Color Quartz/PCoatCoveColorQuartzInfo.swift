//
//  CoveColorInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 7/18/22.
//

import SwiftUI

struct PCoatCoveColorQuartzInfo: View {
    
    @State var showingAlert = false
    var body: some View {
        
        Button(action: {
            self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Epoxy Cove Color Quartz Prime/Cap Coat"), message:
                    Text("Mixing Ratios: A:B = 1 gal : 1/2 gal \n\n Coverage Rates: 300 lft/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct PCoatCoveColorQuartzInfo_Previews: PreviewProvider {
    static var previews: some View {
        PCoatCoveColorInfo()
    }
}
