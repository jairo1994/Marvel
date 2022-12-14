//
//  HeroTableViewCell.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var shadow: UIView!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow.shadow()
        shadow.layer.cornerRadius = 10
        shadow.layer.masksToBounds = false
        shadow.clipsToBounds = false
        contentView.layer.masksToBounds = false
        contentView.clipsToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func confiCell(_ hero: HeroModel){
        imageHero.kf.setImage(with: hero.url())
        nameLbl.text = hero.name
        nameLbl.text = hero.description
        
    }
    
}
