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


import UIKit

class Address {
    
    // MARK: Properties
    
    var title: String
    var street: String
    var city: String
    var state: String
    var country: String
    var zipCode: String
    
    
    // MARK: Initialization
    init(title: String, street: String, city: String, state: String, country: String, zipCode: String) {
        self.title = title
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.zipCode = zipCode
    }
}

class PlaceDescription {
    
    // MARK: Properties
    
    var name: String
    var description: String
    var category: String
    var address: Address
    var elevation: Float
    var latitude: Float
    var longitude: Float
    
    // MARK: Initialization
    init(name: String, description: String, category: String, address: Address, elevation: Float, latitude: Float, longitude: Float) {
        self.name = name
        self.description = description
        self.category = category
        self.address = address
        self.elevation = elevation
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
