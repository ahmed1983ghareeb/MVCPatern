//
//  RegisterViewController.swift
//  MVCPatern
//
//  Created by Ahmed Ghareeb on 2019-06-03.
//  Copyright © 2019 Ahmed Ghareeb. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    @IBOutlet weak var confirmTextField: UITextField!
    
    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        
        statusLabel.text = ""
        
        if let user = userDao?.getUserByUserName(username: userNameTextField.text!){
            statusLabel.text = "user \(user.username!) already esist "
        }else if (passwordTextField.text != confirmTextField.text){
            statusLabel.text = "password do not match"
            print("password do not match")
            passwordTextField.text = ""
            confirmTextField.text = ""
        }else{
            let user = User(context: userDao!.getManagedContext()!)
            user.username = userNameTextField.text!
            user.password = passwordTextField.text!
            _ = userDao?.saveUser(user: user)
        }
    }
    
}
