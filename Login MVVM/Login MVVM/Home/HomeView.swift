//
//  HomeView.swift
//  Login MVVM
//
//  Created by Damian on 28/2/23.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    private let messageLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Bienvenido! Acabas de probar un login realizado gracias a un video del canal SwiftBeta."
        label.font = .systemFont(ofSize: 40, weight: .bold, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints =  false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
}

