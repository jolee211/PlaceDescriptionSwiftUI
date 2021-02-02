// Copyright 2021 David Lee
/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @author David Lee    mailto:dlee129@asu.edu
 * @version January 2021
 */

import SwiftUI

class PlaceDescription {
    
    var name: String
    var description: String
    var category: String
    var addressTitle: String
    var addressStreet: String
    var elevation: Float
    var latitude: Float
    var longitude: Float
    
    init(json: [String: Any]) {
        name = json["name"] as? String ?? ""
        description = json["description"] as? String ?? ""
        category = json["category"] as? String ?? ""
        addressTitle = json["address-title"] as? String ?? ""
        addressStreet = json["address-street"] as? String ?? ""
        elevation = json["elevation"] as? Float ?? 0
        latitude = json["latitude"] as? Float ?? 0
        longitude = json["longitude"] as? Float ?? 0
    }
    
    init(jsonStr: String) {
        self.name = ""
        self.description = ""
        self.category = ""
        self.addressTitle = ""
        self.addressStreet = ""
        self.elevation = 0
        self.latitude = 0
        self.longitude = 0
        
        if let data: Data = jsonStr.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)
            } catch let jsonErr {
                print("Error serializing JSON:", jsonErr)
            }
        }
    }
    
}

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
    @State private var placeDescription = PlaceDescription(jsonStr: "{\"name\": \"ASU-Poly\",\"description\": \"Home of ASU\'s Software Engineering Programs\", \"category\": \"School\", \"address-title\": \"ASU Software Engineering\", \"address-street\": \"7171 W Sonoran Arroyo Mall\\nPeralta Hall 230\\nMesa AZ 85212\", \"elevation\": 1384.0, \"latitude\": 33.306388, \"longitude\": -111.679121}")
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                LabelTextField(label: "Name", placeHolder: placeDescription.name)
                LabelTextField(label: "Description", placeHolder: placeDescription.description)
                LabelTextField(label: "Category", placeHolder: placeDescription.category)
                LabelTextField(label: "Address Title", placeHolder: placeDescription.addressTitle)
                LabelTextField(label: "Address Street", placeHolder: placeDescription.addressStreet)
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
