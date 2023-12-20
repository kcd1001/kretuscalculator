//
//  ContactInfo.swift
//  Calculator
//
//  Created by Kane Davidson on 4/13/21.
//

import SwiftUI

struct ContactInfo: View {
    var body: some View {
        VStack {
            Text("1055 W. Struck Ave., Orange, CA 92867")
            Text("714.694.2061")
            Text("info@kretus.com")
        }
    }
}

struct ContactInfo_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfo()
    }
}
