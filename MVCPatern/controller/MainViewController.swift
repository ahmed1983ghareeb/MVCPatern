//
//  MainViewController.swift
//  MVCPatern
//
//  Created by Ahmed Ghareeb on 2019-06-03.
//  Copyright © 2019 Ahmed Ghareeb. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutBtnClicked(logoutSegue: UIStoryboardSegue){
//        unwind(for: logoutSegue, towards: logoutSegue.source)
        self.dismiss(animated: true, completion: nil)
    }
}

