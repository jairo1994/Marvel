//
//  UserViewModel.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import Foundation
import UIKit

class UserViewModel: UserViewModelProtocol {
    var options: SectionSettingModel
    
    init() {
        self.options = SectionSettingModel(options:
                                            [OptionSettingModel(name: "Language", settingType: .language, description: "Lorem ipsum", image: UIImage(named: "languages")),
                                             OptionSettingModel(name: "FAQs", settingType: .faqs, description: "Lorem ipsum", image: UIImage(named: "faq")),
                                             OptionSettingModel(name: "Rate us", settingType: .rateUs, description: "Lorem ipsum", image: UIImage(named: "rate")),
                                             OptionSettingModel(name: "Política de Privacidad", settingType: .privacy, description: "Lorem ipsum", image: UIImage(named: "contact")),
                                             OptionSettingModel(name: "Términos y condiciones", settingType: .legal, description: "Lorem ipsum", image: UIImage(named: "contact"))
                                            ])
    }
    
    func numberOfRows() -> Int {
        return options.options.count
    }
    
    func getSettingInfoBy(index: Int) -> OptionSettingModel {
        return options.options[index]
    }
}
