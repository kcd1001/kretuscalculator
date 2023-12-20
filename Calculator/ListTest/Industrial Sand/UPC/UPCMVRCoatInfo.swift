//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct UPCMVRCoatInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UPC MVR Coat"), message:
                    Text("Mixing Ratio: A:UCC:B:C = 6lbs:4oz:6lbs:6lbs \n\n Coverage Rates: \n @8-12 mils: 190 sf/kit "), dismissButton: .default(Text("Close")))
        }
    }
}

struct UPCMVRCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
