//
//  BaseRequestConfig.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import XcodeConfig

enum RequestConfig {
    @XcodeConfig(key: "API_URL") static var apiURL: String
    @XcodeConfig(key: "PUBLIC_KEY") static var publicKey: String
    @XcodeConfig(key: "PRIVATE_KEY") static var privateKey: String
    @XcodeConfig(key: "PAGE_LIMIT") static var pageLimit: Int
}
