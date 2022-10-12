//
//  ViewController.swift
//  RgbSliders
//
//  Created by Антон Лоскутов on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var saturationRedLable: UILabel!
    @IBOutlet var saturationGreenLable: UILabel!
    @IBOutlet var saturationBlueLable: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        setColor()
        setValue()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            saturationRedLable.text = string(from: sender)
        case greenSlider:
            saturationGreenLable.text = string(from: sender)
        default:
            saturationBlueLable.text = string(from: sender)
        }
    }
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    private func setValue() {
        saturationRedLable.text = string(from: redSlider)
        saturationGreenLable.text = string(from: greenSlider)
        saturationBlueLable.text = string(from: blueSlider)
    }
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
