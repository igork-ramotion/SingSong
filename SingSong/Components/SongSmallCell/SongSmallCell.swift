//
//  SongSmallCell.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/14.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import UIKit

final class SongSmallCell: UITableViewCell, CellReusableXib {

    /// UI Parts
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var keyButton: UIButton!
    @IBOutlet weak var songTItleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        initViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func initViews() {
        keyView.layer.cornerRadius = 10
        keyView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]

        nameView.layer.cornerRadius = 10
        nameView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]

        keyButton.layer.cornerRadius = 4
        keyButton.layer.shadowColor = UIColor.black.cgColor
        keyButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        keyButton.layer.shadowOpacity = 0.3
        keyButton.layer.shadowRadius = 3
    }

}
