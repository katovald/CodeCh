//
//  WelcomeVC.swift
//  MovieClient
//
//  Created by  Jose Valdez. 
//

import UIKit

class WelcomeVC: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            
            let screen = MovieCatalogVC.loadFirstViewController()
            self.present(screen, animated: true, completion: nil)
        }
    }
}
