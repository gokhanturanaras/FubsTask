//
//  StackView.swift
//  FubsTask
//
//  Created by Gökhan Aras on 12.06.2022.
//

import UIKit

class StackView: UIStackView {

    init(axis:NSLayoutConstraint.Axis = .vertical , distribution:UIStackView.Distribution = .fill, aligment:UIStackView.Alignment = .fill) {
        super.init(frame: .zero)
        self.distribution = distribution
        self.axis = axis
        self.alignment = alignment
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func addArrangedSubview(_ view: UIView) {
        super.addArrangedSubview(view)
    }
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            super.addArrangedSubview(view)
        }
        super.addArrangedSubview(UIView())
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

