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
    var elevation: Double
    var latitude: Double
    var longitude: Double
    
    init() {
        self.name = ""
        self.description = ""
        self.category = ""
        self.addressTitle = ""
        self.addressStreet = ""
        self.elevation = 0
        self.latitude = 0
        self.longitude = 0
    }
    
    convenience init(json: [String: Any]) {
        self.init()
        
        name = json["name"] as? String ?? ""
        description = json["description"] as? String ?? ""
        category = json["category"] as? String ?? ""
        addressTitle = json["address-title"] as? String ?? ""
        addressStreet = json["address-street"] as? String ?? ""
        elevation = json["elevation"] as? Double ?? 0
        latitude = json["latitude"] as? Double ?? 0
        longitude = json["longitude"] as? Double ?? 0
    }
    
    convenience init(jsonStr: String) {
        self.init()
        
        if let data: Data = jsonStr.data(using: String.Encoding.utf8) {
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                self.init(json: json)
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

var placeDescription = PlaceDescription()

struct ContentView: View {
    @State var jsonStr: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Enter JSON", text: $jsonStr)
                            .lineLimit(3)
                    }
                }
                
                Button(action: {
                    placeDescription = PlaceDescription(jsonStr: jsonStr)
                }, label: {
                    Text("Init PlaceDescription with JSON")
                        .frame(width: 300, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                .padding()
                
                NavigationLink(
                    destination: PlaceDescriptionView(),
                    label: {
                        DisplayPlaceDescriptionButton(color: .green)
                    })
            }
            .navigationTitle("Place Description JSON")
        }
    }
}

struct PlaceDescriptionView: View {
    var body: some View {
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
        .navigationTitle("PlaceDescription")
    }
}

struct DisplayPlaceDescriptionButton: View {
    let color: Color
    
    var body: some View {
        Text("Display PlaceDescription")
            .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
