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
        
        let request = BeersRequest(filter: [.abv(condition: .more, value: 1.2)])
        
        PunkAPI().get(request, queue: .main) { [weak self] beersResult in
            
            guard let strongSelf = self else { return }
            switch beersResult {
                
                case .success(let beers):
                    let string = beers.reduce(into: "", { (result, beer) in
                        
                        guard let name = beer.name else { return }
                        if result.isEmpty {
                            result = name
                            return
                        }
                        return result.append(contentsOf: ", \(name)")
                    })
                    
                    strongSelf.label.text = string.isEmpty ? "Not Found" : string
                
                case .failure(let error):
                    strongSelf.label.text = error.localizedDescription
            }
        }
    }
}
