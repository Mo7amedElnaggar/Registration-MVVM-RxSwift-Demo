//
//  ShadowView.swift
//  Registration-MVVM-RxSwift-Demo
//
//  Created by Mohamed El-Naggar on 10/12/21.
//

import UIKit

class ShadowView: UIView {

    @IBInspectable var shadowColor: UIColor = .clear
    @IBInspectable var shadowRadius: CGFloat = 0.0
    @IBInspectable var shadowOffset: CGSize = .zero
    @IBInspectable var shadowOpacity: Float = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundCorners()
        applyingShadow()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners()
        applyingShadow()
    }
    
    func applyingShadow() {
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
    }
    
    func roundCorners() {
        self.layer.cornerRadius = 10
    }

}
