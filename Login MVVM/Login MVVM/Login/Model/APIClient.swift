//
//  APIClient.swift
//  Login MVVM
//
//  Created by Damian on 28/2/23.
//

import Foundation

enum BackendError: String, Error {
    case invalidEmail = "Comprueba el Email"
    case invalidPassword = "Comprueba tu password"
}

final class APIClient {
    func login(withEmail email: String, password: String) async throws -> User {
        //Simular petición HTTP y esperar 2 segundos
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
        return try simulateBackendLogic(email: email, password: password)
    }
}

func simulateBackendLogic(email: String, password: String) throws -> User{
    guard email == "prueba@login.com" else {
        print("El user no es correcto")
        throw BackendError.invalidEmail
    }
    guard password == "1234567890" else {
            print("El password no es correcto")
            throw BackendError.invalidPassword
    }
    print("Success")
    return .init(name: "Damian",
                 token: "token_123456789",
                 sessionStart: .now)
}
