//
//  ViewController.swift
//  MVCPatern
//
//  Created by Ahmed Ghareeb on 2019-06-03.
//  Copyright © 2019 Ahmed Ghareeb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if userDao!.getAllUsers().isEmpty {
            let  user = User(context: userDao!.getManagedContext()!)
            user.username = "Ahmed"
            user.password = "123"
            _ = userDao?.saveUser(user: user)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let user = userDao?.getUserByUserName(username: userNameTextField.text!)
//
//
//    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       
        
        if identifier == "loginSegue"{
            if let user = userDao?.getUserByUserName(username: userNameTextField.text!){
                if (user.password == passwordTextField.text!){
                    return true
            }else{
                return false
            }
           
        }else{
                //performSegue
                performSegue(withIdentifier: "registerSegue", sender:self)
            return false
        }
        }else{
            return false
        }

}
    
}

