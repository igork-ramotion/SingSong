//
//  SongMediumCell.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/19.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import UIKit
import Cosmos

protocol SongsViewControllerDelegate: class {
    func didTouchCosmosView()
    func didFinishTouchCosmosView()
}

final class SongMediumCell: UITableViewCell, CellReusableXib {

    /// UI Parts
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var keyButton: UIButton!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var cosmosView: CosmosView!

    /// Propaties
    weak var delegate: SongsViewControllerDelegate?

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

        cosmosView.didTouchCosmos = { _ in self.delegate?.didTouchCosmosView() }
        cosmosView.didFinishTouchingCosmos = { _ in self.delegate?.didFinishTouchCosmosView() }
    }

    func configure(title: String, artist: String, key: Int, rate: Double) {
        songTitleLabel.text = title
        artistLabel.text = artist
        keyButton.setTitle(key.description, for: .normal)
        cosmosView.rating = rate
    }

}
