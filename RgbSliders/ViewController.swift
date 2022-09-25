//
//  ViewController.swift
//  RgbSliders
//
//  Created by Антон Лоскутов on 23.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var background: UIView!
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var saturationRedLable: UILabel!
    @IBOutlet var saturationGreenLable: UILabel!
    @IBOutlet var saturationBlueLable: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        setupSaturationLabel()
    }
    
    @IBAction func sliderAction() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        saturationRedLable.text = String(format: "%.2f", redSlider.value)
        saturationGreenLable.text = String(format: "%.2f", greenSlider.value)
        saturationBlueLable.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setupSaturationLabel() {
        saturationRedLable.text = redSlider.value.formatted()
        saturationGreenLable.text = greenSlider.value.formatted()
        saturationBlueLable.text = blueSlider.value.formatted()
    }
}

