//
//  LoginService.swift
//  EmployeesApp
//
//  Created by WebIQ Stagiaire on 05-09-18.
//  Copyright © 2018 Lisa van der Goes. All rights reserved.
//

import Foundation

protocol LoginService {
    func loginCredentialsCheck(
        username: String,
        password: String,
        succeed: () -> Void,
        failed: (String) -> Void) -> Void
}
