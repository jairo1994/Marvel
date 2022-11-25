//
//  SettingsTableViewCell.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var optionNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(option: OptionSettingModel) {
        optionImage.image = option.image
        optionImage.backgroundColor = .white
        optionNameLbl.text = option.name
        
        
        shadowView.shadow()
        shadowView.layer.cornerRadius = 8
    }
}
