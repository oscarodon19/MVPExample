//
//  TrafficLightService.swift
//  MPVExample
//
//  Created by Oscar Odon on 06/08/2019.
//  Copyright © 2019 Oscar Odon. All rights reserved.
//

import Foundation

class TrafficLightService {
    func getTrafficLight(colorName: (String), callback:(TrafficLight?) -> Void) {
        
        let trafficLights = [TrafficLight(colorName: "Red", description: "Stop"),TrafficLight(colorName: "Green", description: "Go"),TrafficLight(colorName: "Yellow", description: "About to change to red")]
        
        if let foundTrafficLight = trafficLights.first(where: {$0.colorName == colorName}) {
            callback(foundTrafficLight)
        } else {
            callback(nil)
        }
        
    }
}
