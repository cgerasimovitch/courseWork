//
//  CreationViewController.swift
//  MyHabits
//
//  Created by Admin on 8/19/21.
//

import UIKit

class HabitItemViewController: UIViewController {

    let itemNameHeader = UILabel()
    let itemNameTextField = UITextField()
    let itemColorHeader = UILabel()
    let itemColorView = UIView()
    let itemTimeHeader = UILabel()
    let itemCurrentTimeLabel = UILabel()
    let itemcalendar = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        addEverySubview()
        setupEverySubview()
    }
    
    func addEverySubview() {
        self.view.addSubview(itemNameHeader)
        self.view.addSubview(itemNameTextField)
        self.view.addSubview(itemColorHeader)
        self.view.addSubview(itemColorView)
        self.view.addSubview(itemTimeHeader)
        self.view.addSubview(itemCurrentTimeLabel)
        self.view.addSubview(itemcalendar)
    }
    
    func setupEverySubview() {
        itemNameHeaderSetup(labelHere: itemNameHeader)
        itemNameHeaderSetupLayout(labelHere: itemNameHeader)
        itemNameTextViewSetup(textFieldHere: itemNameTextField)
        itemNameTextViewSetupLayout(textFieldHere: itemNameTextField)
        itemColorHeaderSetup(labelHere: itemColorHeader)
        itemColorHeaderSetupLayout(labelHere: itemColorHeader)
        itemColorViewSetup(viewHere: itemColorView)
        itemColorViewSetupLayout(viewHere: itemColorView)
        itemTimeHeaderSetup(labelHere: itemTimeHeader)
        itemTimeHeaderSetupLayout(labelHere: itemTimeHeader)
        itemCurrentTimeLabelSetup(labelHere: itemCurrentTimeLabel)
        itemCurrentTimeLabelSetupLayout(labelHere: itemCurrentTimeLabel)
        itemDataPickerSetup(dataPickerHere: itemcalendar)
        itemDataPickerSetupLayout(dataPickerHere: itemcalendar)
    }
    // MARK: - Setup every subview
    func itemNameHeaderSetup(labelHere: UILabel){
        labelHere.text = "НАЗВАНИЕ"
    }
    
    func itemNameHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 100),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 21),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemNameTextFieldSetup(textFieldHere: UITextField){
        textFieldHere.placeholder = "Бегать по утрам, спать 8 часов и т.п."
    }
    
    func itemNameTextFieldSetupLayout(textFieldHere: UITextField){
        textFieldHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFieldHere.widthAnchor.constraint(equalToConstant: 295),
            textFieldHere.heightAnchor.constraint(equalToConstant: 22),
            textFieldHere.topAnchor.constraint(equalTo: itemNameHeader.bottomAnchor, constant: 7),
            textFieldHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
    }
    
    func itemColorHeaderSetup(labelHere: UILabel){
        labelHere.text = "ЦВЕТ"
    }
    
    func itemColorHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 36),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: itemNameTextView.bottomAnchor, constant: 15),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemColorViewSetup(viewHere: UIView){
        
    }
    
    func itemColorViewSetupLayout(viewHere: UIView){
        viewHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewHere.widthAnchor.constraint(equalToConstant: 30),
            viewHere.heightAnchor.constraint(equalToConstant: 30),
            viewHere.topAnchor.constraint(equalTo: itemColorHeader.bottomAnchor, constant: 7),
            viewHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemTimeHeaderSetup(labelHere: UILabel){
        labelHere.text = "ВРЕМЯ"
    }
    func itemTimeHeaderSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 47),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: itemColorView.bottomAnchor, constant: 15),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemCurrentTimeLabelSetup(labelHere: UILabel){
        
    }
    func itemCurrentTimeLabelSetupLayout(labelHere: UILabel){
        labelHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelHere.widthAnchor.constraint(equalToConstant: 194),
            labelHere.heightAnchor.constraint(equalToConstant: 22),
            labelHere.topAnchor.constraint(equalTo: itemTimeHeader.bottomAnchor, constant: 7),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    func itemDataPickerSetup(dataPickerHere: UIDatePicker){
        dataPickerHere.datePickerMode = .time
    }
    func itemDataPickerSetupLayout(dataPickerHere: UIDatePicker){
        dataPickerHere.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataPickerHere.heightAnchor.constraint(equalToConstant: 216),
            dataPickerHere.topAnchor.constraint(equalTo: itemCurrentTimeLabel.bottomAnchor, constant: 15),
            dataPickerHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            dataPickerHere.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    
    // MARK: - Navigation

    

}
