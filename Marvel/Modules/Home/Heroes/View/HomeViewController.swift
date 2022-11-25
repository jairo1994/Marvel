//
//  ViewController.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel = HomeViewModel()
    private let identifier = "HeroTableViewCell"
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect(), style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hero.isEnabled = true
        
        setupView()
        
        viewModel.loadData { [weak self] ready in
            guard let self = self else { return }
            if ready {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    func setupView(){
        view.addSubview(tableView)
        
        tableView.constraintToParent(parent: view)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? HeroTableViewCell else {
            return UITableViewCell()
        }
        
        let hero = viewModel.getHeroInfoBy(index: indexPath.section)
        
        cell.confiCell(hero)
        cell.imageHero.heroID = "\(hero.id)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getHeroDetailInfo(index: indexPath.section) { [weak self] hero in
            guard let hero = hero, let self = self else { return }
            let vm = HeroDetailViewModel(hero: hero)
            let vc = HeroDetailViewController(viewModel: vm)
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        return view
    }
}
