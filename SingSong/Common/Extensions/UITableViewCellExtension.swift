//
//  UITableViewCellExtension.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/17.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import Foundation
import UIKit

private func defaultCellIdentifier<T: NSObject>(_ cellClass: T.Type) -> String {
    return String(describing: cellClass)
}

// MARK: - CellReusable
protocol CellReusable {
    static var cellIdentifier: String { get }
}

extension CellReusable where Self: UITableViewCell {
    static var cellIdentifier: String { return defaultCellIdentifier(self) }
}

// MARK: - CellReusableXib
protocol CellReusableXib: CellReusable {
    static var nibName: String { get }
    static var nibBundle: Bundle? { get }
}

extension CellReusableXib where Self: UITableViewCell {
    static var nibName: String { return cellIdentifier }
    static var nibBundle: Bundle? { return nil }
}

// MARK: - UITableView
private func cast<T, U>(_ object: T) -> U {
    guard let out = object as? U else {
        fatalError("\(object) cannot cast to \(U.self)")
    }
    return out
}

extension UITableView {
    func register(_ cellClasses: (UITableViewCell & CellReusable).Type...) {
        for cellClass in cellClasses {
            if let cellClass = cellClass as? CellReusableXib.Type {
                register(UINib(nibName: cellClass.nibName, bundle: cellClass.nibBundle),
                         forCellReuseIdentifier: cellClass.cellIdentifier)
            } else {
                register(cellClass, forCellReuseIdentifier: cellClass.cellIdentifier)
            }
        }
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: CellReusable {
        return dequeueReusableCell(for: indexPath, as: T.self)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, as cellClass: T.Type) -> T where T: CellReusable {
        return cast(dequeueReusableCell(withIdentifier: cellClass.cellIdentifier, for: indexPath))
    }
}
