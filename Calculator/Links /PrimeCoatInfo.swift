//
//  PrimeCoatInfo.swift
//  ListTest
//
//  Created by Kane Davidson on 11/16/20.
//

import SwiftUI

struct PrimeCoatInfo: View {
    @State private var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("?")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Prime Coat"), message: Text("If outgassing occurs or is prevalent, a prime coat may be required for proper adhesion."), dismissButton: .default(Text("Close")))
        }
    }
}


struct PrimeCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        PrimeCoatInfo()
    }
}
