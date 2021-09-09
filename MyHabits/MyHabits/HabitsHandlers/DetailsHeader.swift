//
//  DetailsHeader.swift
//  MyHabits
//
//  Created by Admin on 9/9/21.
//

import UIKit

class DetailsHeader: UITableViewHeaderFooterView {

    
    let headerId = "DetailsHeader"
    let dateHeader = UILabel()
    
    
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
        self.contentView.addSubview(dateHeader)
    }
    
    func setupEverySubview(){
        dateHeaderSetup(labelHere: dateHeader)
        dateHeaderSetupLayout(labelHere: dateHeader)
    }

    func dateHeaderSetup(labelHere: UILabel){
        labelHere.text = "АКТИВНОСТЬ"
        labelHere.font = UIFont(name: "SF Pro Display-Semibold", size: 20)
        labelHere.textColor = .systemGray2
    }
    
    
    func dateHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 216),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 22),
            labelHere.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            labelHere.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 7),
        ])
    }
}
