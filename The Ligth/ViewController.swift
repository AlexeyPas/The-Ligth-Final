//
//  ViewController.swift
//  The Ligth
//
//  Created by Алексей Пасынков on 19.10.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override var prefersStatusBarHidden: Bool{
        return true
    }
    var isLightOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWindow()
    }

    fileprivate func updateWindow() {
        view.backgroundColor = isLightOn ? .white : .black
        label.text = isLightOn ? "Выключить" : "Включить"
        label.textAlignment = .center
        label.textColor = isLightOn ? .black : .white
        
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonPressed() {
        isLightOn.toggle()
        updateWindow()
        
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        
        if ((device?.hasTorch) != nil){
            do{
                try device?.lockForConfiguration()
                device?.torchMode = isLightOn ? .on : .off
                device?.unlockForConfiguration()
            }catch {
                print(error)
            }
        }
    }
    
}

