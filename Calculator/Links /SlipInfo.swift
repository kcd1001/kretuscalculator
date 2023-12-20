//
//  SlipInfo.swift
//  ListTest
//
//  Created by Kane Davidson on 11/16/20.
//

import SwiftUI

struct SlipInfo: View {
    
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("?")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Slip Resistance"), message: Text("Select to increase slip resistance with Anti-Slip surface texture granules."), dismissButton: .default(Text("Close")))
        }
    }
}

struct SlipInfo_Previews: PreviewProvider {
    static var previews: some View {
        SlipInfo()
    }
}
