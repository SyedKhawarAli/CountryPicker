//
//  ViewController.swift
//  Example-iOS
//
//  Created by Khawar Shah on 7.10.2022.
//

import UIKit
import CountryPicker

class ViewController: UIViewController {

    var selectedCountry: Country?
    var countryPicker = CountryPicker()
    
    let showButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Countries", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPicker.delegate = self
        view.addSubview( showButton )
        showButton.addTarget(self, action: #selector(handleShowCounties), for: .touchUpInside)
        NSLayoutConstraint.activate([
            showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    func handleShowCounties(){
        countryPicker.showCountriesList(from: self, selectedCountry: selectedCountry)
    }
}

extension ViewController: CountryPickerViewDelegate {
    func countryPicker(_ countryPickerView: CountryPicker, didSelectCountry country: Country) {
        selectedCountry = country
    }
}

