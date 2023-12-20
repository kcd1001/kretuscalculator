//
//  PCoatSwitch.swift
//  Calculator
//
//  Created by Kane Davidson on 1/29/21.
//

import SwiftUI

struct PCoatSwitchUV: View {
    @EnvironmentObject var upcChoiceRC : sysChoices //Used for coat selections

    var body: some View {
        HStack{
            Text("EX-KUPCRCA6-EA")
                .font(.caption)
            Spacer()
            Text("UPC Part B - RC UV AP, 6 lbs")
                .font(.caption)
            Spacer()
            Text("\(upcChoiceRC.PCoatPtB)")
                .font(.caption)
           
        }
    }
}

struct PCoatSwitchUV_Previews: PreviewProvider {
    static var previews: some View {
        PCoatSwitch()
    }
}
