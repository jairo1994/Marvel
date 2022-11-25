//
//  ViewController.swift
//  Marvel
//
//  Created by Jairo Lopez on 24/11/22.
//

import UIKit

class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadData { ready in
            if ready {
                print("Info loaded successfully")
            }
        }
        
        
    }


}

