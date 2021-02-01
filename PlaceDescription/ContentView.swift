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
            Text(label).font(.headline).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            Text(placeHolder)
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                .lineLimit(3)
        }
        .padding(.horizontal, 15)
    }
}

struct ContentView: View {
    @State private var placeDescription = PlaceDescription(name: "Home", description: "Home", category: "residence", address: Address(title: "Joseph Lee", street: "1741 W Flamingo Dr", city: "Chandler", state: "AZ", country: "US", zipCode: "85286"), elevation: 1384.0, latitude: 33.27532, longitude: -111.87144)

    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                LabelTextField(label: "Name", placeHolder: placeDescription.name)
                LabelTextField(label: "Description", placeHolder: placeDescription.description)
                LabelTextField(label: "Category", placeHolder: placeDescription.category)
                LabelTextField(label: "Address Title", placeHolder: placeDescription.address.title)
                LabelTextField(label: "Address", placeHolder: placeDescription.address.street + "\n" + placeDescription.address.city + ", " + placeDescription.address.state + " " + placeDescription.address.zipCode + "\n" + placeDescription.address.country)
                LabelTextField(label: "Elevation", placeHolder: String(format: "%.1f", placeDescription.elevation))
                LabelTextField(label: "Latitude", placeHolder: String(format: "%.6f", placeDescription.latitude))
                LabelTextField(label: "Longitude", placeHolder: String(format: "%.6f", placeDescription.longitude))
            }
            .listRowInsets(EdgeInsets())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 375, height: 1000))
    }
}
