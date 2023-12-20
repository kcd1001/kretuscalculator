//
//  CoveColorInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 7/18/22.
//

import SwiftUI

struct BCoatCoveColorQuartzInfo: View {
    
    @State var showingAlert = false
    var body: some View {
        
        Button(action: {
            self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Epoxy Cove Color Quartz Base Coat"), message:
                    Text("Mixing Ratios:\n A:B:CG = 1 gal:1/2 gal: 50 lbs\n\n Coverage Rates:\n @4\": 60 lft/kit \n @6\": 40 lft/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct BCoatCoveColorQuartzInfo_Previews: PreviewProvider {
    static var previews: some View {
        PCoatCoveColorInfo()
    }
}
