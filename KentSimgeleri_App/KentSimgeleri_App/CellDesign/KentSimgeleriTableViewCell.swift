//
//  KentSimgeleriTableViewCell.swift
//  KentSimgeleri_App
//
//  Created by Taha Turan on 26.04.2023.
//

import UIKit

class KentSimgeleriTableViewCell: UITableViewCell {
    
    @IBOutlet weak var kentImageView: UIImageView!
    
    @IBOutlet weak var kentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
