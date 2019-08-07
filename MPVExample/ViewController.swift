//
//  ViewController.swift
//  MPVExample
//
//  Created by Oscar Odon on 06/08/2019.
//  Copyright © 2019 Oscar Odon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TrafficLightViewDelegate {
    
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())

    private lazy var redLightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTouchUpInsideRedButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var greenLightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTouchUpInsideGreenButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var yellowLightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.backgroundColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleTouchUpInsideYellowButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var trafficLigthStateLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.text = "Label"
        label.textAlignment = NSTextAlignment.center
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1.0
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
        
        buildViewHierarchy()
        constraintInit()
    }
    
    func buildViewHierarchy() {
        view.addSubview(redLightButton)
        view.addSubview(greenLightButton)
        view.addSubview(yellowLightButton)
        view.addSubview(trafficLigthStateLabel)
    }
    
    func constraintInit() {
        NSLayoutConstraint.activate([
            redLightButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            redLightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            greenLightButton.topAnchor.constraint(equalTo: redLightButton.bottomAnchor, constant: 20),
            greenLightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            yellowLightButton.topAnchor.constraint(equalTo: greenLightButton.bottomAnchor, constant: 20),
            yellowLightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            trafficLigthStateLabel.topAnchor.constraint(equalTo: yellowLightButton.bottomAnchor, constant: 20),
            trafficLigthStateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trafficLigthStateLabel.widthAnchor.constraint(equalToConstant: self.view.frame.size.width-12*2),
            trafficLigthStateLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    @objc func handleTouchUpInsideRedButton() {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Red")
        print("Red Button Pressed")
    }
    
    @objc func handleTouchUpInsideGreenButton() {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Green")
        print("Green Button Pressed")
    }
    
    @objc func handleTouchUpInsideYellowButton() {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Yellow")
        print("Yellow Button Pressed")
    }
    
    func displayTrafficLight(description: (String)) {
        trafficLigthStateLabel.text = description
    }

}

