//
//  RegisterButton.swift
//  Registration-MVVM-RxSwift-Demo
//
//  Created by Mohamed El-Naggar on 10/12/21.
//

import UIKit

class RegisterButton: UIButton {
    
    private let buttonColors: (activeColor: UIColor, inActiveColor: UIColor) = (#colorLiteral(red: 0.4375144541, green: 0.5226806998, blue: 0.9737557769, alpha: 1), #colorLiteral(red: 0.7571105134, green: 0.8260247718, blue: 0.8586261334, alpha: 1))
    
    var isActive: Bool = false {
        didSet { isActive ? activeButton() : inActiveButton() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundCorners()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners()
    }

    private func activeButton() {
        self.backgroundColor = buttonColors.activeColor
        self.isEnabled = true
    }
    
    private func inActiveButton() {
        self.backgroundColor = buttonColors.inActiveColor
        self.isEnabled = false
    }
    
    private func roundCorners() {
        self.layer.cornerRadius = 10
    }
}
