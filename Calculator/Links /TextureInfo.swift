//
//  TextureInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 2/19/21.
//

import SwiftUI

struct TextureInfo: View {
    @State var showingAlert = false
    
    var body: some View {
        
        Button(action: {
                self.showingAlert = true})
        {
            Text("?")
                .underline()
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Texture 2"), message: Text("For areas that see heavy foot traffic and daily cleaning, a 50/50 blend of two texture is recommended. Blending textures that differ in shape or size provides sufficient traction yet is smooth enough to be properly cleaned."), dismissButton: .default(Text("Close")))
        }
    }}

struct TextureInfo_Previews: PreviewProvider {
    static var previews: some View {
        TextureInfo()
    }
}
