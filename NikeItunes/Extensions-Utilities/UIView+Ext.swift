//
//  UIView+Ext.swift
//  NikeItunes
//
//  Created by hui liu on 3/6/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

extension UIView {
    //pin to the edge
    func pin(to superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
}
