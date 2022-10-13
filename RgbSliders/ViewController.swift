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
        initDelegatesTextFields()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            saturationRedLable.text = string(from: sender)
            redColorTF.text = string(from: sender)
        case greenSlider:
            saturationGreenLable.text = string(from: sender)
            greenColorTF.text = string(from: sender)
        default:
            saturationBlueLable.text = string(from: sender)
            blueColorTF.text = string(from: sender)
        }
    }
    
    @IBAction func doneBotton() {
        dismiss(animated: true)
        delegate.getColor(colorView.backgroundColor ?? .white)
    }
    
    private func initDelegatesTextFields() {
        redColorTF.delegate = self
        greenColorTF.delegate = self
        blueColorTF.delegate = self
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

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let value = Float(textField.text ?? ""), value >= 0, value <= 1 {
            switch textField {
            case redColorTF:
                redSlider.value = value
                saturationRedLable.text = string(from: redSlider)
            case greenColorTF:
                greenSlider.value = value
                saturationGreenLable.text = string(from: greenSlider)
            default:
                blueSlider.value = value
                saturationBlueLable.text = string(from: blueSlider)
            }
        }
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
