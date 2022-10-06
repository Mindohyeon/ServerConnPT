//
//  SignUpValidator.swift
//  ServerConnPT
//
//  Created by 민도현 on 2022/10/06.
//

import Foundation

class SignUpValidator {
    func isValidEmail(email: String) -> Bool {
        return email.count != 0
    }
}
