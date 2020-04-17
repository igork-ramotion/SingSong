//
//  SongSmallCell.swift
//  SingSong
//
//  Created by Shota Ito on 2020/04/14.
//  Copyright © 2020 Shota Ito. All rights reserved.
//

import UIKit

final class SongSmallCell: UITableViewCell {

    // UI Parts
    @IBOutlet weak var keyView: UIView!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var songTItleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func initViews() {
        keyLabel.layer.masksToBounds = false
        keyLabel.layer.cornerRadius = 4
        keyLabel.layer.shadowColor = UIColor.black.cgColor
        keyLabel.layer.shadowOffset = CGSize(width: 0, height: 3)
        keyLabel.layer.shadowRadius = 4
    }

}
