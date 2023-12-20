//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipRCPrimeCoatInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Color Chip RC Prime Coat"), message:
                    Text("Mixing Ratio: A:UCC:B:C: = 6 lbs:4 oz:6 lbs:6 lbs \n\n Coverage Rates: \n @3-4 mils: 330 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipRCPrimeCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
