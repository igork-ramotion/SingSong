//
//  UILayoutPriorityExtension.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/14.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import UIKit
import SnapKit

// SnapKit extension
extension ConstraintViewDSL {
    func makeConstraintsEqualToSuperview(insets: UIEdgeInsets, file: String = #file, line: UInt = #line) {
        makeConstraints { make in
            make.edges.equalToSuperview(file, line).inset(insets)
        }
    }
    func makeConstraintsEqualToSuperview(insets: CGFloat = 0, file: String = #file, line: UInt = #line) {
        makeConstraints { make in
            make.edges.equalToSuperview(file, line).inset(insets)
        }
    }
}
