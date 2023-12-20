//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipTSSelectBCoatInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Select Line Base Coat Specs"), message:
                    Text("Mixing Ratio: A:B:SC = 2 gal:1 gal:1 qt \n\n Coverage Rates: \n @3-5 mils: 420 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipTSSelectBCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
