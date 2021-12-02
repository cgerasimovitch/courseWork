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
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        addEverySubview()
        setupEverySubview()
        
       }
    
    required init?(coder: NSCoder) {
               super.init(coder: coder)
               
           }
    
    func addEverySubview(){
        contentView.addSubview(dateHeader)
    }
    
    func setupEverySubview(){
        dateHeaderSetup(labelHere: dateHeader)
        dateHeaderSetupLayout(labelHere: dateHeader)
    }

    func dateHeaderSetup(labelHere: UILabel){
        labelHere.text = "АКТИВНОСТЬ"
        labelHere.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        labelHere.textColor = .systemGray
    }
    
    
    func dateHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 216),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            labelHere.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelHere.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 7),
        ])
    }
}
