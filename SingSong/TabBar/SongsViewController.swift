//
//  SongsViewController.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/04.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import UIKit
import SnapKit

final class SongsViewController: UIViewController {

    private let bgView = UIImageView(image: R.image.background())

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    private func initViews() {
        view.addSubviews(bgView)

        bgView.snp.makeConstraintsEqualToSuperview()

    }

}
