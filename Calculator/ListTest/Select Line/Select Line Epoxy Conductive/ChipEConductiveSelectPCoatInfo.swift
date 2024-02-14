//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct ChipEConductiveSelectPCoatInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("System Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Select Line Prime/Base Coat Specs"), message:
                    Text("Kretus Select Epoxy Conductive Kit: 350 sf/kit"), dismissButton: .default(Text("Close")))
        }
    }
}

struct ChipEConductiveSelectPCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
