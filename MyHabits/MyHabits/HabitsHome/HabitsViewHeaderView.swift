//
//  HomeHeaderView.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

class HabitsViewHeaderView: UITableViewHeaderFooterView {

    let headerId = "HabitsViewHeaderView"
    let inspireHeader = UILabel()
    let inspireProgressHeader = UILabel()
    let inspireProgressView = UIProgressView()
   
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addEverySubview()
        setupEverySubview()
        
       }
    
    required init?(coder: NSCoder) {
               super.init(coder: coder)
               
           }
    
    func addEverySubview(){
        self.contentView.addSubview(inspireHeader)
        self.contentView.addSubview(inspireProgressView)
        self.contentView.addSubview(inspireProgressHeader)
    }
    
    func setupEverySubview(){
        inspireHeaderSetup(labelHere: inspireHeader)
        inspireHeaderSetupLayout(labelHere: inspireHeader)
        inspireProgressHeaderSetup(labelHere: inspireProgressHeader)
        inspireProgressHeaderSetupLayout(labelHere: inspireProgressHeader)
        progressbarSetup(hereProgressView: inspireProgressView)
        progressbarSetupLayout(hereProgressView: inspireProgressView)
    }
    
    
    // MARK: - Setup every subview
    func inspireHeaderSetup(labelHere: UILabel){
        labelHere.text = "Всё получится!"
        labelHere.font = UIFont(name: "SF Pro Display-Semibold", size: 20)
        labelHere.textColor = .systemGray2
    }
    
    
    func inspireHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 216),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelHere.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12)
        ])
    }
    
    func inspireProgressHeaderSetup(labelHere: UILabel){
        labelHere.text = "50%"
        labelHere.font = UIFont(name: "SF Pro Display-Semibold", size: 20)
        labelHere.textColor = .systemGray2
    }
    
    func inspireProgressHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 95),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelHere.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 12)
        ])
    }
    //https://www.uicolor.io/
    func progressbarSetup(hereProgressView: UIProgressView){

        hereProgressView.progressTintColor = UIColor(red: 0.63, green: 0.09, blue: 0.80, alpha: 1.00)
        hereProgressView.trackTintColor = .systemGray2
    }
    
    func progressbarSetupLayout(hereProgressView: UIProgressView){
        NSLayoutConstraint.activate([
            
            hereProgressView.heightAnchor.constraint(equalToConstant: 7),
            hereProgressView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            hereProgressView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            hereProgressView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 12)
        ])
    }

}
