//
//  File.swift
//  RxSpace
//
//  Created by Влад Бокин on 26.09.2022.
//

import Foundation
import RxSwift

class LoginViewModel {
    let emailTextFieldPublishSubject = PublishSubject<String>()
    let passwordTextFieldPublishSubject = PublishSubject<String>()
    
    let mailAdress: [String] = ["@yandex.ru", "@google.com"]
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(emailTextFieldPublishSubject.asObservable().startWith(""), passwordTextFieldPublishSubject.asObservable().startWith("")).map { email, password in
            print( )
            return email.contains(self.mailAdress) && password.count >= 7
            
        }.startWith(false)
    }
}

extension String {
    func contains(_ strings: [String]) -> Bool {
        strings.contains { contains($0) }
    }
}
