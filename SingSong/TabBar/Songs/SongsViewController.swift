//
//  SongsViewController.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/04.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import UIKit
import SingSongCore
import SnapKit

struct DummySong {
    public let title: String
    public let artist: String
    public let key: Int
    public let rate: Double
    public let cover: UIImage
}

final class SongsViewController: UIViewController {

    /// UI Parts
    private let bgView = UIImageView(image: R.image.background())
    private let tableView = UITableView()

    /// Propaties
    private let list: [DummySong] = [
        DummySong(title: "sample", artist: "sample", key: 0, rate: 1, cover: R.image.noImage()!),
        DummySong(title: "sample", artist: "sample", key: 0, rate: 1, cover: R.image.noImage()!),
        DummySong(title: "sample", artist: "sample", key: 0, rate: 1, cover: R.image.noImage()!),
        DummySong(title: "sample", artist: "sample", key: 0, rate: 1, cover: R.image.noImage()!),
        DummySong(title: "sample", artist: "sample", key: 0, rate: 1, cover: R.image.noImage()!),
        DummySong(title: "sample", artist: "sample", key: 0, rate: 1, cover: R.image.noImage()!),
        DummySong(title: "sample", artist: "sample", key: 0, rate: 1, cover: R.image.noImage()!),
        DummySong(title: "sample", artist: "sample", key: 0, rate: 1, cover: R.image.noImage()!),
        DummySong(title: "sample", artist: "sample", key: 0, rate: 1, cover: R.image.noImage()!)
    ]
    private enum Kind: String {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
    }
    private let kinds: [Kind] = [.small, .medium, .large]
    private var type: Kind = .large

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    private func initViews() {
        navigationController?.navigationBar.barTintColor = R.color.bgBlack()
        let navigationBackgroundView = self.navigationController?.navigationBar.subviews.first
        navigationBackgroundView?.alpha = 0.9
        navigationItem.title = "Songs"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Display",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(self.didTapDisplayButton))
        navigationItem.rightBarButtonItem?.tintColor = R.color.singSongGreen()

        tabBarController?.tabBar.barTintColor = R.color.bgBlack()
        tabBarController?.tabBar.alpha = 0.9

        view.addSubviews(bgView, tableView)

        bgView.snp.makeConstraintsEqualToSuperview()

        tableView.register(SongSmallCell.self,
                           SongMediumCell.self,
                           SongLargeCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraintsEqualToSuperview()
    }

    @objc
    private func didTapDisplayButton() {
        switch type {
        case .small:
            type = .medium
            tableView.reloadData()
        case .medium:
            type = .large
            tableView.reloadData()
        case .large:
            type = .small
            tableView.reloadData()
        }
    }
}

extension SongsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch type {
        case .small:
            let cell = tableView.dequeueReusableCell(for: indexPath, as: SongSmallCell.self)
            cell.configure(title: list[indexPath.row].title,
                           artist: list[indexPath.row].artist,
                           key: list[indexPath.row].key)
            return cell
        case .medium:
            let cell = tableView.dequeueReusableCell(for: indexPath, as: SongMediumCell.self)
            cell.delegate = self
            cell.configure(title: list[indexPath.row].title,
                           artist: list[indexPath.row].artist,
                           key: list[indexPath.row].key,
                           rate: list[indexPath.row].rate)
            return cell
        case .large:
            let cell = tableView.dequeueReusableCell(for: indexPath, as: SongLargeCell.self)
            cell.configure(title: list[indexPath.row].title,
                           artist: list[indexPath.row].artist,
                           key: list[indexPath.row].key,
                           rate: list[indexPath.row].rate,
                           cover: list[indexPath.row].cover)
            return cell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch type {
        case .small, .medium:
            return 75
        case .large:
            return 90
        }

    }

}

extension SongsViewController: UITableViewDelegate {

}

extension SongsViewController: SongsViewControllerDelegate {
    func didTouchCosmosView() {
        tableView.isScrollEnabled = false
    }

    func didFinishTouchCosmosView() {
        tableView.isScrollEnabled = true
    }

}
