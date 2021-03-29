//
//  RoundButton.swift
//  AgriUber
//
//  Created by Nguyen Xuan Phu on 3/24/21.
//  Copyright © 2021 Nguyen Xuan Phu. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    var borderWidth: CGFloat = 1.0
    var borderColor = UIColor.white.cgColor

    @IBInspectable var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.black,for: .normal)
        }
    }

    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }

}
