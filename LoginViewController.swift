//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Владислав Лазарев on 06/08/2019.
//  Copyright © 2019 Владислав Лазарев. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let login = "User"
    private let password = "Password"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -100
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
    }

    @IBAction func loginClick(_ sender: UIButton){
        if (loginTextField.text == login) && (passwordTextField.text == password) {
            performSegue(withIdentifier: "detailSegue", sender: nil)
        } else {
            showAlert(title: "Ошибочка", message: "Данные введены неверно")
        }
    }
    
    @IBAction func supportLogin(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            showAlert(title: "Подсказочка", message: "Попробуйте User")
        case 2:
            showAlert(title: "Подсказочка", message: "Попробуйте Password")
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        detailVC.text = login
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ок", style: .cancel) { (action) in
        }
        alert.addAction(alertOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch  textField {
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
