//
//  FirstViewController.swift
//  RxSpace
//
//  Created by Влад Бокин on 23.09.2022.
//

import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {

    let loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextFieldOutlet.becomeFirstResponder()
        
        emailTextFieldOutlet.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.emailTextFieldPublishSubject).disposed(by: disposeBag)
        PasswordTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.passwordTextFieldPublishSubject).disposed(by: disposeBag)
        loginViewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isValid().map{ $0 ? 1 : 0.1}.bind(to: loginButton.rx.alpha).disposed(by: disposeBag)
        
        loginButton.rx.tap
            .bind {
                print("button tapped")
            }
            .disposed(by: disposeBag)
    }
    
}


