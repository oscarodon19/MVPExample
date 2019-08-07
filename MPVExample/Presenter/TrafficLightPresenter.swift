//
//  TrafficLightPresenter.swift
//  MPVExample
//
//  Created by Oscar Odon on 06/08/2019.
//  Copyright © 2019 Oscar Odon. All rights reserved.
//

import Foundation

class TrafficLightPresenter {
    private let trafficLightService: TrafficLightService
    weak private var trafficLightViewDelegate: TrafficLightViewDelegate?
    
    init(trafficLightService: TrafficLightService) {
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate: TrafficLightViewDelegate) {
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    func trafficLightColorSelected(colorName: (String)) {
        trafficLightService.getTrafficLight(colorName: colorName) { [weak self] trafficLight in
            
            if let trafficLight = trafficLight {
                self?.trafficLightViewDelegate?.displayTrafficLight(description: trafficLight.description)
            }
            
        }
    }
}
