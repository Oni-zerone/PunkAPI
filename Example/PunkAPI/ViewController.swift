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

    override func viewDidLoad() {
        super.viewDidLoad()

        PunkAPI().get(BeerRequest(id: 1), completion: { beers in
            print(beers)
        })
    }
}

