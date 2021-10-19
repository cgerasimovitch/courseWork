//
//  LaunchScreenViewController.swift
//  MyHabits
//
//  Created by Admin on 8/23/21.
//

import UIKit

class LaunchScreen1ViewController: UIViewController {
    let logoImageView = UIImageView()
    let appName = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        addEverySubview()
        setupEverySubview()
    }
    
    func addEverySubview(){
        view.addSubview(logoImageView)
        view.addSubview(appName)
    }

    func setupEverySubview(){
        logoImageSetup(imageViewHere: logoImageView)
        logoImageSetupLayout(imageViewHere: logoImageView)
        appNameHeaderSetup(labelHere: appName)
        appNameHeaderSetupLayout(labelHere: appName)
    }
   
    func logoImageSetup(imageViewHere: UIImageView){
        imageViewHere.image = UIImage(named: "AppIcon")
        imageViewHere.contentMode = .scaleAspectFit
    }
    
    func logoImageSetupLayout(imageViewHere: UIImageView){
        imageViewHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewHere.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageViewHere.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func appNameHeaderSetup(labelHere: UILabel){
        labelHere.text = "MyHabits"
        labelHere.textColor = UIColor(red: 0.63, green: 0.09, blue: 0.80, alpha: 1.00)}
    
    func appNameHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 88),
            labelHere.heightAnchor.constraint(equalToConstant: 24),
            labelHere.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelHere.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 76)
        ])
    }

}
