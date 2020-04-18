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

    /// UI Parts
    private let bgView = UIImageView(image: R.image.background())
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    private func initViews() {
        view.addSubviews(bgView, tableView)

        bgView.snp.makeConstraintsEqualToSuperview()

        tableView.register(SongSmallCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraintsEqualToSuperview()
    }
}

extension SongsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, as: SongSmallCell.self)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}

extension SongsViewController: UITableViewDelegate {

}
