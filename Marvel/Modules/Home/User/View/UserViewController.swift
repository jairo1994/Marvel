//
//  UserViewController.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import UIKit
import SwiftMessages

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
        let optionSelected = viewModel.getSettingInfoBy(index: indexPath.item)
        
        switch optionSelected.settingType {
        case .language:
            Messages.showMessage(theme: .success, title: "Opción de idioma", body: "Esta es una opción de ejemplo para cambiar el idioma dentro de la app")
        case .faqs:
            openUrl(url: "https://www.fintonic.mx/es-MX/soporte-ayuda/")
        case .privacy:
            openUrl(url: "https://www.fintonic.mx/es-MX/proteccion-de-datos/")
        case .legal:
            openUrl(url: "https://www.fintonic.mx/es-MX/terminos-legales/")
        case .rateUs:
            Messages.showMessage(theme: .warning, title: "Opción para calificar", body: "Esta es una opción de ejemplo para calificar la aplicación ⭐️⭐️⭐️⭐️⭐️")
        }
    }
    

}
