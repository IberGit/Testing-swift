//
//  LoginViewModel.swift
//  Login MVVM
//
//  Created by Damian on 28/2/23.
//

import Foundation
import Combine

class LoginViewModel {
    @Published var email = ""
    @Published var password = ""
    @Published var isEnabled = false
    @Published var showLoading = false
    @Published var errorMessage = ""
    @Published var userModel: User?
    
    var cancellables = Set<AnyCancellable>()
    
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
        formValidation()
    }
    
    func formValidation() {
        Publishers.CombineLatest($email, $password)
            .filter{email, password in
                return email.count > 5 && password.count > 5
            }
            .sink { value in
                self.isEnabled = true
                print("Email: \(value)")
            }.store(in: &cancellables)
    }
    
    @MainActor
    func userLogin(withEmail email: String, password: String){
        showLoading = true
        errorMessage = ""
        Task{
            do {
                userModel = try await apiClient.login(withEmail: email, password: password)
            } catch let error as BackendError {
                errorMessage = error.rawValue
            }
            showLoading = false
        }
    }
}
