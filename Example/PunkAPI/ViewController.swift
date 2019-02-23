//
//  ViewController.swift
//  PunkAPI
//
//  Created by acct<blob>=<NULL> on 02/17/2019.
//  Copyright (c) 2019 acct<blob>=<NULL>. All rights reserved.
//

import UIKit
import PunkAPI

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func loadBeerAction(_ sender: Any) {
        
        PunkAPI().get(BeerRequest(id: 6), queue: .main) { [weak self] beersResult in
            
            guard let strongSelf = self else { return }
            switch beersResult {
                
                case .success(let beers):
                    strongSelf.label.text = beers.first?.name ?? "Not Found"
                
                case .failure(let error):
                    strongSelf.label.text = error.localizedDescription
            }
        }
    }
}
