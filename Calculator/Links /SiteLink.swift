//
//  SiteLink.swift
//  ListTest
//
//  Created by Kane Davidson on 11/25/20.
//

import SwiftUI

struct SiteLink: View {
    var body: some View {
        Link("See system specs", destination: URL(string: "http://www.kretus.com/upc-1-coat/")!)
    }
}

struct SiteLink_Previews: PreviewProvider {
    static var previews: some View {
        SiteLink()
    }
}
