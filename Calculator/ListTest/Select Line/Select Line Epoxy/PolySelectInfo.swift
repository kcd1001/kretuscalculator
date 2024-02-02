//
//  ChipGarageInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 5/18/21.
//

import SwiftUI

struct PolySelectInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("Coat Specs")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Kretus Select Poly Info"), message:
                    Text("Kretus Select Poly Kit: 350 sf/kit"), dismissButton: .default(Text("Close")))
        }
    }
}

struct PolySelectInfo_test: PreviewProvider {
    static var previews: some View {
        ChipGarageInfo()
    }
}
