//
//  SongLargeCell.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/19.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import UIKit
import Cosmos

class SongLargeCell: UITableViewCell, CellReusableXib {

    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var keyButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var coverView: UIImageView!
    @IBOutlet weak var cosmosView: CosmosView!

    override func awakeFromNib() {
        super.awakeFromNib()

        initViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func initViews() {
        selectionStyle = .none

        keyView.layer.cornerRadius = 10
        keyView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]

        nameView.layer.cornerRadius = 10
        nameView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]

        keyButton.layer.cornerRadius = 4
        keyButton.layer.shadowColor = UIColor.black.cgColor
        keyButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        keyButton.layer.shadowOpacity = 0.3
        keyButton.layer.shadowRadius = 3
        keyButton.isEnabled = false
    }

    func configure(title: String, artist: String, key: Int, rate: Double, cover: UIImage) {
        titleLabel.text = title
        artistLabel.text = artist
        keyButton.setTitle(key.description, for: .normal)
        cosmosView.rating = rate
        coverView.image = cover
    }

}
