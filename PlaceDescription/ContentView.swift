//
//  ContentView.swift
//  PlaceDescription
//
//  Created by Joseph Lee on 2/1/21.
//

import SwiftUI

struct LabelTextField : View {
    var label: String
    @State var placeHolder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label).font(.headline)
            TextField("", text: $placeHolder)
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal, 15)
    }
}

struct ContentView: View {
    @State private var placeDescription = PlaceDescription(name: "Home", description: "Home", category: "residence", address: Address(title: "Joseph Lee", street: "1741 W Flamingo Dr", city: "Chandler", state: "AZ", country: "US", zipCode: "85286"), elevation: 1384.0, latitude: 33.27532, longitude: -111.87144)

    
    var body: some View {
        LabelTextField(label: "Name", placeHolder: placeDescription.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
