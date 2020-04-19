//
//  Entity.swift
//  SingSongCore
//
//  Created by Shota Ito on 2020/04/19.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import Foundation
import UIKit

/// NameSpace
public enum Entity {}

extension Entity {
    public struct Song {
        public let title: String
        public let artist: String
        public let cover: UIImage?
    }
}
