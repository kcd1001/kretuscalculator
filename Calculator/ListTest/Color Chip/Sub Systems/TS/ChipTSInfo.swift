//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipTSInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip TS Specs"), message:
                    Text("Mixing Ratio: A:B: = 1 gal:1/2 gal \n\n Coverage Rates: \n @8-12 mils: 210 sf/kit \n\n If choosing a lighter colorant, an optional prime coat is recommended"), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipTSInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
