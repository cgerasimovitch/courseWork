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
    var screenNameContainer = ""
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewDidLoad()
        title = screenNameContainer
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(dismissViewController))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveItem))
    }
    
    override func viewWillLayoutSubviews() {
        addEverySubview()
        setupEverySubview()
    }
    
    @objc func dismissViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveItem(){
        
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
        itemNameTextFieldSetup(textFieldHere: itemNameTextField)
        itemNameTextFieldSetupLayout(textFieldHere: itemNameTextField)
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
            labelHere.widthAnchor.constraint(equalToConstant: 60),
            labelHere.heightAnchor.constraint(equalToConstant: 18),
            labelHere.topAnchor.constraint(equalTo: itemNameTextField.bottomAnchor, constant: 15),
            labelHere.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }
    
    func itemColorViewSetup(viewHere: UIView){
        viewHere.backgroundColor = UIColor(red: 1.00, green: 0.62, blue: 0.31, alpha: 1.00)
        viewHere.layer.cornerRadius = 15

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
            labelHere.widthAnchor.constraint(equalToConstant: 60),
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
