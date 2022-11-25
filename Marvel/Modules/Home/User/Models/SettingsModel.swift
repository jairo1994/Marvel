//
//  SettingsModel.swift
//  Marvel
//
//  Created by Jairo Lopez on 25/11/22.
//

import Foundation
import UIKit

struct SectionSettingModel {
    var options: [OptionSettingModel]
}

struct OptionSettingModel {
    var name: String
    var settingType: Settings
    var description: String
    var image: UIImage?
}
