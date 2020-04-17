//
//  UIViewExtension.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/14.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
}
