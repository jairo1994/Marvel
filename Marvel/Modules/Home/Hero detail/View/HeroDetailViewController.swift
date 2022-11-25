//
//  HeroDetailViewController.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import UIKit
import Kingfisher
import UIImageColors

class HeroDetailViewController: UIViewController {
    private let viewModel: HeroDetailViewModel
    
    lazy var imageHero: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var heroName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    init(viewModel: HeroDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        hero.isEnabled = true
        imageHero.heroID = "\(viewModel.hero.id)"
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupView(){
        heroName.text = viewModel.hero.name
        imageHero.kf.setImage(with: viewModel.hero.url())
        imageHero.image?.getColors { colors in
            self.bottomView.backgroundColor = colors?.detail
            self.heroName.textColor = colors?.background
            self.navigationController?.navigationBar.tintColor = colors?.secondary
        }
        
        view.addSubview(imageHero)
        view.addSubview(bottomView)
        view.addSubview(heroName)
        
        NSLayoutConstraint.activate([imageHero.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     imageHero.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
                                     imageHero.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                                     imageHero.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
                                    
                                     bottomView.topAnchor.constraint(equalTo: imageHero.centerYAnchor),
                                     bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                    
                                     heroName.topAnchor.constraint(equalTo: imageHero.bottomAnchor, constant: 16),
                                     heroName.leadingAnchor.constraint(equalTo: imageHero.leadingAnchor),
                                     heroName.trailingAnchor.constraint(equalTo: imageHero.trailingAnchor)
                                    ])
        
        view.bringSubviewToFront(imageHero)
        
       
    }
}
