//
//  ViewController.swift
//  RgbSliders
//
//  Created by Антон Лоскутов on 23.09.2022.
//

import UIKit

//protocol



class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var saturationRedLable: UILabel!
    @IBOutlet var saturationGreenLable: UILabel!
    @IBOutlet var saturationBlueLable: UILabel!
    
    @IBOutlet var redColorTF: UITextField!
    @IBOutlet var greenColorTF: UITextField!
    @IBOutlet var blueColorTF: UITextField!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var delegate: ViewControllerDelegate!
    var mainViewColor: UIColor!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        setValue()
        setColor()
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
    
    @IBAction func doneBotton() {
        dismiss(animated: true)
        delegate.getColor(colorView.backgroundColor ?? .white)
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
        redSlider.value = Float(mainViewColor.red)
        greenSlider.value = Float(mainViewColor.green)
        blueSlider.value = Float(mainViewColor.blue)
        
        saturationRedLable.text = string(from: redSlider)
        saturationGreenLable.text = string(from: greenSlider)
        saturationBlueLable.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

extension UIColor {
    var red: CGFloat {
        CIColor(color: self).red
    }
    var green: CGFloat {
        CIColor(color: self).green
    }
    var blue: CGFloat {
        CIColor(color: self).blue
    }
}
