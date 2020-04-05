//
//  MainTabBarController.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/05.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initTabBar()
    }

    func initTabBar() {
        let vc = ViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let nvc = UINavigationController(rootViewController: vc)

        // Green tab
        let vc2 = ViewController2()
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        let nvc2 = UINavigationController(rootViewController: vc2)

        // Tabs
        setViewControllers([nvc, nvc2], animated: false)
    }

}
