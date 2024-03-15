//
//  HomeViewController.swift
//  Verregular
//
//  Created by ozinchenko.dev on 14/03/2024.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Verregular".uppercased()
        label.font = .boldSystemFont(ofSize: 28)
        
        return label
    }()
    //MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private Methods
}

