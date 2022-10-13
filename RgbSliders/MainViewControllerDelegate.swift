//
//  MainViewController.swift
//  RgbSliders
//
//  Created by Антон Лоскутов on 13.10.2022.
//

import UIKit

protocol ViewControllerDelegate {
    func getColor(_ color: UIColor)
}

class MainViewControllerDelegate: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? ViewController else { return }
        settingsVC.mainViewColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewControllerDelegate: ViewControllerDelegate {
    func getColor(_ background: UIColor) {
        view.backgroundColor = background
    }
}

