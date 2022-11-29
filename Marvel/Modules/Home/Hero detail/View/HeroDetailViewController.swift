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
    private let identifier = "ComicCollectionViewCell"
    
    lazy var imageHero: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.backgroundColor = .red
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
    
    lazy var comicLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Comis"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    lazy var seriesLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Series"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    private lazy var collection: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    
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
            self.comicLbl.textColor = colors?.background
            self.navigationController?.navigationBar.tintColor = colors?.secondary
            self.collection.backgroundColor = colors?.detail
        }
        
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.setCollectionViewLayout(layout, animated: true)
        collection.delegate = self
        collection.dataSource = self
        collection.register(ComicCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collection.showsHorizontalScrollIndicator = false
        
        view.addSubview(imageHero)
        view.addSubview(bottomView)
        bottomView.addSubview(heroName)
        bottomView.addSubview(comicLbl)
        view.addSubview(collection)
        
        NSLayoutConstraint.activate([imageHero.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     imageHero.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
                                     imageHero.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                                     imageHero.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
                                    
                                     bottomView.topAnchor.constraint(equalTo: imageHero.centerYAnchor),
                                     bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                    
                                     heroName.topAnchor.constraint(equalTo: imageHero.bottomAnchor, constant: 16),
                                     heroName.leadingAnchor.constraint(equalTo: imageHero.leadingAnchor),
                                     heroName.trailingAnchor.constraint(equalTo: imageHero.trailingAnchor),
                                     
                                     comicLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
                                     comicLbl.trailingAnchor.constraint(equalTo: heroName.trailingAnchor),
                                     comicLbl.topAnchor.constraint(equalTo: heroName.bottomAnchor, constant: 32),
                                     
                                     collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
                                     collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
                                     collection.topAnchor.constraint(equalTo: comicLbl.bottomAnchor, constant: 4),
                                     collection.heightAnchor.constraint(equalToConstant: 90)
                            ])
        
        view.bringSubviewToFront(imageHero)
        
    }
}

extension HeroDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.comicsNum()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ComicCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        cell.config(item: viewModel.getComicDataBy(index: indexPath.item))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height*2, height: collectionView.frame.height)
    }
}
