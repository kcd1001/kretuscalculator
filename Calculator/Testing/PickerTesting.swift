//
//  PickerTesting.swift
//  ListTest
//
//  Created by Kane Davidson on 1/6/21.
//

import SwiftUI

struct PickerTesting: View {
    
    var body: some View {
        Image("UPCImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 250.0, height: 250.0, alignment: .center)
                .clipShape(Circle())
            
}
}
struct PickerTesting_Previews: PreviewProvider {
    static var previews: some View {
        PickerTesting()
    }
}
