//
//  ViewController.swift
//  PunkAPI
//
//  Created by acct<blob>=<NULL> on 02/17/2019.
//  Copyright (c) 2019 acct<blob>=<NULL>. All rights reserved.
//

import UIKit
import PunkAPI
import PromiseKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loadBeerAction(_ sender: Any) {
        
        let request = BeersRequest(filter: [.abv(condition: .more, value: 4.3)])
        
        PunkApi().get(request, queue: .main) { [weak self] beersResult in
            
            guard let self = self else { return }
            do {
                let beers = try beersResult.get()
                let string = beers.reduce(into: "", { (result, beer) in
                    
                    guard let name = beer.name else { return }
                    if result.isEmpty {
                        result = name
                        return
                    }
                    return result.append(contentsOf: ", \(name)")
                })
                self.label.text = string.isEmpty ? "Not Found" : string
                
            } catch let error {
                self.label.text = error.localizedDescription
            }
        }
    }
    
    @IBAction func loadRandomBeer(_ sender: Any) {
        
        let request = RandomBeerRequest()
        PunkApi().get(request)
            .done { [weak self] beers in
                self?.label.text = beers.first?.name
            }.catch { [weak self] error in
                self?.label.text = error.localizedDescription
        }
    }
}
