//
//  ViewController.swift
//  The Ligth
//
//  Created by Алексей Пасынков on 19.10.2020.
//

import UIKit

class ViewController: UIViewController {

    var isLightOn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWindow()
    }

    fileprivate func updateWindow() {
        view.backgroundColor = isLightOn ? .white : .black
    }
    
    @IBAction func buttonPressed() {
        isLightOn.toggle()
        updateWindow()
    }
    
}

