//
//  ProductMasterSheet.swift
//  ListTest
//
//  Created by Kane Davidson on 1/12/21.
//

import SwiftUI

class system : ObservableObject {
    @Published var Code : String = ""
    @Published var Name : String = ""
    @Published var ProductLine = ""
    @Published var Product1 = ""
    @Published var Product2 = ""
    @Published var Product3 = ""
    @Published var Product4 = ""
    @Published var ProductSize2 = ""
}

class coat : ObservableObject {
    
}

struct ProductMasterSheet: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProductMasterSheet_Previews: PreviewProvider {
    static var previews: some View {
        ProductMasterSheet()
    }
}
