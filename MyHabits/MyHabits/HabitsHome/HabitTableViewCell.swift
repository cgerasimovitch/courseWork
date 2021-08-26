//
//  HabitTableViewCell.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    static let cellId = "HabitTableViewCell"
    //MARK: - Subviews list
    let cellTitle = UILabel()
    let cellSubtitle = UILabel()
    let cellCounterTitle = UILabel()
    let checkMarkView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addEverySubview()
        setupEverySubview()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func addEverySubview(){
        self.addSubview(cellTitle)
        self.addSubview(cellSubtitle)
        self.addSubview(cellCounterTitle)
        self.addSubview(checkMarkView)
    }
    
    func setupEverySubview(){
        titleSetup(labelHere: cellTitle)
        titleSetupLayout(labelHere: cellTitle)
        subtitleSetup(labelHere: cellSubtitle)
        subtitleSetupLayout(labelHere: cellSubtitle)
        counterTitleSetup(labelHere: cellCounterTitle)
        counterTitleSetupLayout(labelHere: cellCounterTitle)
        checkmarkSetup(imageViewHere: checkMarkView)
        checkmarkSetupLayout(imageViewHere: checkMarkView)
    }
    
    
    // MARK: - Setup every subview
    func titleSetup(labelHere: UILabel){
        labelHere.text = "Собирать тестовые сборки"
    }
    func titleSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 220),
            labelHere.heightAnchor.constraint(equalToConstant: 22),
            labelHere.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            labelHere.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
    func subtitleSetup(labelHere: UILabel){
        labelHere.text = "Три раза в день"
        labelHere.textColor = .systemGray2
    }
    func subtitleSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 220),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 4),
            labelHere.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
    func counterTitleSetup(labelHere: UILabel){
        labelHere.text = "Cчётчик: 3"
        labelHere.textColor = .systemGray2
    }
    
    func counterTitleSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 188),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: cellSubtitle.bottomAnchor, constant: 30),
            labelHere.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            labelHere.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
    func checkmarkSetup(imageViewHere: UIImageView){
        imageViewHere.backgroundColor = UIColor(red: 1.00, green: 0.62, blue: 0.31, alpha: 1.00)
        imageViewHere.layer.cornerRadius = 19
    }
    
    func checkmarkSetupLayout(imageViewHere: UIImageView){
        imageViewHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewHere.widthAnchor.constraint(equalToConstant: 38),
            imageViewHere.heightAnchor.constraint(equalToConstant: 38),
            imageViewHere.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageViewHere.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25)
        ])
    }

}
