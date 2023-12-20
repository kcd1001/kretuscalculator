//
//  Texture .swift
//  ListTest
//
//  Created by Kane Davidson on 1/15/21.
//

import SwiftUI

struct Texture: View {
   
    @EnvironmentObject var upcChoice : sysChoices //Used for coat selections
    
    let texture = ["Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24", "Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20"]
        
    let texture2 = ["Anti-Slip AO 60", "Anti-Slip AO 36", "Anti-Slip AO 24", "Industrial Sand #60", "Industrial Sand #30", "Industrial Sand #20", "No Top Coat Texture 2"]
        
    
    var body: some View {
        Text("Top Coat Texture 1")
            .fontWeight(.bold)
            Picker(selection: $upcChoice.texture1,
                label: ZStack {
                    Text("\(texture[upcChoice.texture1])")
                        .opacity(1)
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.2)
                        .cornerRadius(5)
                        .frame(width: 300, height: 25)
            }) {
                ForEach (0 ..< texture.count, id: \.self) { index in
                    Text(self.texture[index]).tag(index)
                }
                
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
            
                VStack {
                    HStack{
                    Text("Top Coat Texture 2")
                        .fontWeight(.bold)
                        TextureInfo()
                    }
                    Picker(selection: $upcChoice.texture2,
                        label: ZStack {
                            Text("\(texture2[upcChoice.texture2])")
                                .opacity(1)
                            Rectangle()
                                .fill(Color.gray)
                                .opacity(0.2)
                                .cornerRadius(5)
                                .frame(width: 300, height: 25)
                    }) {
                        ForEach (0 ..< texture2.count, id: \.self) { index in
                            Text(self.texture2[index]).tag(index)
                        }
                        
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                }
            
}

struct Texture_Previews: PreviewProvider {
    static var previews: some View {
        Texture()
    }
}
}
