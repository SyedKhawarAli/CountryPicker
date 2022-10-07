//
//  ViewController.swift
//  Example-iOS
//
//  Created by Khawar Shah on 7.10.2022.
//

import UIKit
import CountryPicker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(CountryPicker.init().text)
    }
}

