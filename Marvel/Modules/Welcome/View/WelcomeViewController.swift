//
//  WelcomeViewController.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import UIKit
import FSPagerView
import UIImageColors

class WelcomeViewController: UIViewController, FSPagerViewDelegate, FSPagerViewDataSource {
    @IBOutlet weak var stepTitleLbl: UILabel!
    @IBOutlet weak var stepDescriptionLbl: UILabel!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var topAnchor: NSLayoutConstraint!
    @IBOutlet weak var bottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            pagerView.dataSource = self
            pagerView.delegate = self
        }
    }
    
    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            pageControl.numberOfPages = viewModel.numberOfRows()
            pageControl.contentHorizontalAlignment = .center
            pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    private var viewModel: WelcomeViewModel
    
    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
    }

    @IBAction func skip(_ sender: Any) {
        Session.user = UserModel(shouldSeeWelcomeView: false)
        self.navigationController?.pushViewController(TabBarHomeViewController(), animated: true)
    }
}

extension WelcomeViewController {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return viewModel.numberOfRows()
    }
        
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        updateCellInfo(cell: cell, index: index)
        return cell
    }
    
    func pagerViewDidEndDecelerating(_ pagerView: FSPagerView) {
        let currentIndex = pagerView.currentIndex
        guard let cell = pagerView.cellForItem(at: currentIndex) else {
            return
        }
            
        updateCellInfo(cell: cell, index: currentIndex)
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            
            self.stepTitleLbl.alpha = 0
            self.stepDescriptionLbl.alpha = 0
            self.skipBtn.alpha = 0
        }
    }
    
    func updateCellInfo(cell: FSPagerViewCell, index: Int){
        self.pageControl.currentPage = index
        let step = viewModel.getInfoBy(index: index)
        
        if let image = UIImage(named: step.image) {
            cell.imageView?.image = image
            image.getColors { colors in
                guard let colors = colors else { return }
                self.stepTitleLbl.textColor = colors.secondary
                self.stepDescriptionLbl.textColor = colors.detail
                self.skipBtn.tintColor = colors.secondary
                self.skipBtn.backgroundColor = colors.background
            }
        }
        
        stepTitleLbl.text = step.title
        stepDescriptionLbl.text = step.description
        
        
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let self = self else { return }
            
            self.stepTitleLbl.alpha = 1
            self.stepDescriptionLbl.alpha = 1
            self.skipBtn.alpha = 1
                  
            guard index == self.viewModel.numberOfRows()-1 else {
                self.bottomAnchor.priority = .required
                self.topAnchor.priority = .defaultLow
                return
            }
            
            self.bottomAnchor.priority = .defaultLow
            self.topAnchor.priority = .required
            
        }
        
        
    }
}
