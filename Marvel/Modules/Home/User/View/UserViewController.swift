//
//  UserViewController.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel: UserViewModel
    private let identifier = "SettingsTableViewCell"

    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.separatorStyle = .none
    }
    
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configCell(option: viewModel.getSettingInfoBy(index: indexPath.item))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

}
