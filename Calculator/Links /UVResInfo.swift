//
//  UVResInfo.swift
//  ListTest
//
//  Created by Kane Davidson on 11/16/20.
//

import SwiftUI

struct UVResInfo: View {
    
    
    @State private var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("?")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("UV Resistance"), message: Text("If color stability is important, select this option to ensure top coat protects against damage from harsh lighting and UV rays."), dismissButton: .default(Text("Close")))
        }
    }
}
            

struct UVResInfo_Previews: PreviewProvider {
    static var previews: some View {
        UVResInfo()
    }
}
