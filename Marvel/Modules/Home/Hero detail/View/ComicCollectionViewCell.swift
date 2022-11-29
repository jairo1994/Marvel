//
//  ComicCollectionViewCell.swift
//  Marvel
//
//  Created by Jairo Lopez on 28/11/22.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {

    lazy var heroName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "dakdlkansda"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code+
        
    }
    
    func config(item: MSDetailItem?) {
        contentView.addSubview(heroName)
        
        NSLayoutConstraint.activate([heroName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     heroName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     heroName.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     heroName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                                     ])
        
        guard let item = item else {
            return
        }
        
        heroName.text = item.name
    }

}
