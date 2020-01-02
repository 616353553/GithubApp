//
//  RepositoryTVCell.swift
//  assignment3
//
//  Created by Ningshuo Bai on 3/12/19.
//  Copyright © 2019 Ningshuo Bai. All rights reserved.
//

import UIKit

class RepositoryTVCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameLabel.text = nil
        self.ownerLabel.text = nil
        self.descriptionLabel.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.ownerLabel.text = nil
        self.descriptionLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
