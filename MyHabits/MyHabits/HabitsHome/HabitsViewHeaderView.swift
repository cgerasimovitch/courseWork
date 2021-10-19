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
    let whiteView = UIView()
    lazy var store = HabitsStore.shared
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .clear
        backgroundView = UIView(frame: self.bounds)
        backgroundView!.backgroundColor = UIColor(white: 0, alpha: 0)
        addEverySubview()
        setupEverySubview()

       }
    
    required init?(coder: NSCoder) {
               super.init(coder: coder)
               
           }
    
    func addEverySubview(){
        contentView.addSubview(whiteView)
        whiteView.addSubview(inspireHeader)
        whiteView.addSubview(inspireProgressHeader)
        whiteView.addSubview(inspireProgressView)
    }
    
    func setupEverySubview(){
        setupWhiteView(viewHere: whiteView)
        inspireHeaderSetup(labelHere: inspireHeader)
        inspireHeaderSetupLayout(labelHere: inspireHeader)
        inspireProgressHeaderSetup(labelHere: inspireProgressHeader)
        inspireProgressHeaderSetupLayout(labelHere: inspireProgressHeader)
        progressviewSetup(hereProgressView: inspireProgressView)
        progressviewSetupLayout(hereProgressView: inspireProgressView)
    }
    
    func setupWhiteView(viewHere: UIView){
        viewHere.backgroundColor = .white
        viewHere.layer.cornerRadius = 10
        viewHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewHere.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            viewHere.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            viewHere.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            viewHere.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
    }
    
    // MARK: - Setup every subview
    func inspireHeaderSetup(labelHere: UILabel){
        labelHere.text = "Всё получится!"
        labelHere.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
        labelHere.textColor = .systemGray
    }
    
    
    func inspireHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 216),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 10),
            labelHere.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 12)
        ])
    }
    
    func inspireProgressHeaderSetup(labelHere: UILabel){
        
        labelHere.textAlignment = .right
        labelHere.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        labelHere.textColor = .systemGray
    }
    
    func inspireProgressHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 95),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.bottomAnchor.constraint(equalTo: inspireHeader.bottomAnchor),
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
            hereProgressView.heightAnchor.constraint(equalToConstant: 10),
            hereProgressView.topAnchor.constraint(equalTo: inspireHeader.bottomAnchor, constant: 10),
            hereProgressView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -15),
            hereProgressView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 12),
            hereProgressView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -12)
        ])
    }
    
}
