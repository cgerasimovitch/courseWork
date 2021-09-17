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
    var inspireProgressHeader = UILabel()
    var inspireProgressView = UIProgressView()
    lazy var store = HabitsStore.shared
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 10
        addEverySubview()
        setupEverySubview()

       }
    
    required init?(coder: NSCoder) {
               super.init(coder: coder)
               
           }
    
    func addEverySubview(){
        self.contentView.addSubview(inspireHeader)
        self.contentView.addSubview(inspireProgressHeader)
        self.contentView.addSubview(inspireProgressView)
    }
    
    func setupEverySubview(){
        inspireHeaderSetup(labelHere: inspireHeader)
        inspireHeaderSetupLayout(labelHere: inspireHeader)
        inspireProgressHeaderSetup(labelHere: inspireProgressHeader)
        inspireProgressHeaderSetupLayout(labelHere: inspireProgressHeader)
        progressviewSetup(hereProgressView: inspireProgressView)
        progressviewSetupLayout(hereProgressView: inspireProgressView)
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
        
        labelHere.textAlignment = .right
        labelHere.font = UIFont(name: "SF Pro Display-Semibold", size: 20)
        labelHere.textColor = .systemGray2
    }
    
    func inspireProgressHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 95),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            labelHere.trailingAnchor.constraint(equalTo: inspireProgressView.trailingAnchor)
        ])
    }
    func progressviewSetup(hereProgressView: UIProgressView){

        hereProgressView.progressTintColor = UIColor(red: 0.63, green: 0.09, blue: 0.80, alpha: 1.00)
        hereProgressView.trackTintColor = UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)
        
    }
    
    func progressviewSetupLayout(hereProgressView: UIProgressView){
        hereProgressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hereProgressView.heightAnchor.constraint(equalToConstant: 7),
            hereProgressView.topAnchor.constraint(equalTo: inspireHeader.bottomAnchor, constant: 10),
            hereProgressView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            hereProgressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            hereProgressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)
        ])
    }
    
}
