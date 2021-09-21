//
//  DetailsCellTableViewCell.swift
//  MyHabits
//
//  Created by Admin on 9/9/21.
//

import UIKit

class DetailsCellTableViewCell: UITableViewCell {

    static let cellId = "DetailsCellTableViewCell"
    //MARK: - Subviews list
    var datecellTitle = UILabel()
    let checkMarkMarkLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addEverySubview()
        setupEverySubview()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func addEverySubview(){
        self.contentView.addSubview(datecellTitle)
        self.contentView.addSubview(checkMarkMarkLabel)
    }
    
    func setupEverySubview(){
        titleSetup(labelHere: datecellTitle)
        titleSetupLayout(labelHere: datecellTitle)
        checkmarkMarkSetup(labelhere: checkMarkMarkLabel)
        checkmarkMarkSetupLayout(labelHere: checkMarkMarkLabel)
    }
    
    func titleSetup(labelHere: UILabel){
        labelHere.text = "Собирать тестовые сборки"
        labelHere.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        labelHere.textColor = .black
    }
    func titleSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 220),
            labelHere.heightAnchor.constraint(equalToConstant: 22),
            labelHere.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 11),
            labelHere.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            labelHere.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -11)
            
        ])
    }

    func checkmarkMarkSetup(labelhere: UILabel){
        labelhere.text = "✓"
        labelhere.textColor = .purple
        labelhere.textAlignment = .center
        
    }
    
    func checkmarkMarkSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 33),
            labelHere.heightAnchor.constraint(equalToConstant: 33),
            labelHere.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -14),
            labelHere.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
            
        ])
    }
}
