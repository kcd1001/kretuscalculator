//
//  TopCoatInfo.swift
//  ListTest
//
//  Created by Kane Davidson on 11/16/20.
//

import SwiftUI

struct TopCoatInfo: View {
    @State private var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("?")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Top Coat"), message: Text("A top coat helps to smooth surface defects, such as marks left by gauge rakes, trowels, or rollers."), dismissButton: .default(Text("Close")))
        }
    }
}

struct TopCoatInfo_Previews: PreviewProvider {
    static var previews: some View {
        TopCoatInfo()
    }
}
