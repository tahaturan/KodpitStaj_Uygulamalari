//
//  CryptoTableViewCell.swift
//  CryptoAppMVVM
//
//  Created by Taha Turan on 12.05.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
