//
//  AddSheetView.swift
//  Treat
//
//  Created by Marina Martin on 16/05/24.
//

import UIKit
import CoreData

class AddSheetView: UIViewController {
    
    // MARK: Variables
    
    // MARK: Components
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Nome da atividade"
        label.textColor = UIColor(named: "AppWhite")
        label.font = UIFont(name: "RadioCanada-Regular_bold", size: 20)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let nameField: UITextField = {
        let field = UITextField()
        
        field.backgroundColor = UIColor(named: "AppGray")
        field.layer.cornerRadius = 20
        field.textColor = UIColor.black
        
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Tipo da atividade"
        label.textColor = UIColor(named: "AppWhite")
        label.font = UIFont(name: "RadioCanada-Regular_bold", size: 20)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let activityStack = ActivitiesView()
    
    let descLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Descrição da atividade"
        label.textColor = UIColor(named: "AppWhite")
        label.font = UIFont(name: "RadioCanada-Regular_bold", size: 20)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let background: UIView = {
        let background = UIView()
        
        background.backgroundColor = UIColor(named: "AppGray")
        background.layer.cornerRadius = 20
        
        background.translatesAutoresizingMaskIntoConstraints = false
        
        return background
    }()
    
    let linkField: UITextField = {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(
            string: "Url",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppDarkGray") ?? .secondaryLabel]
        )
        field.textColor = UIColor.black
        field.layer.cornerRadius = 20
        
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let dividerView: UIView = {
        let divider = UIView()
        
        divider.backgroundColor = .secondarySystemFill
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        return divider
    }()
    
    let descField: UITextField = {
        let field = UITextField()
        
        field.attributedPlaceholder = NSAttributedString(
            string: "Notas",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppDarkGray") ?? .secondaryLabel]
        )
        field.textColor = UIColor.black
        field.layer.cornerRadius = 20
        
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Dia limite"
        label.textColor = UIColor(named: "AppWhite")
        label.font = UIFont(name: "RadioCanada-Regular_bold", size: 20)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        view.backgroundColor = UIColor(named: "AppBlack")
        
        setNavigationBar()
        
        setConstraints()
    }
    
    // MARK: Setup
    
    func setNavigationBar(){
        self.navigationItem.title = "Nova Atividade"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AppWhite") ?? .white, NSAttributedString.Key.font: UIFont(name: "RadioCanada-Regular_bold", size: 18)!]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(ViewDismiss))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(CreateActivity))
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: Constraints
    
    func setConstraints(){
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
        ])
        
        view.addSubview(nameField)
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            nameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            nameField.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: 44)
        ])
        
        view.addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 35),
            typeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
        ])
        
        view.addSubview(activityStack)
        NSLayoutConstraint.activate([
            activityStack.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 12),
            activityStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            activityStack.bottomAnchor.constraint(equalTo: activityStack.topAnchor, constant: 152)
        ])
        
        view.addSubview(descLabel)
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: activityStack.bottomAnchor, constant: 35),
            descLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22)
        ])
        
        view.addSubview(background)
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 10),
            background.bottomAnchor.constraint(equalTo: background.topAnchor, constant: 165),
            background.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 17),
            background.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -17)
        ])
        
        background.addSubview(linkField)
        NSLayoutConstraint.activate([
            linkField.topAnchor.constraint(equalTo: background.topAnchor, constant: 15),
            linkField.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10),
            linkField.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: 10),
            nameField.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: 44)
        ])
        
        background.addSubview(dividerView)
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: linkField.bottomAnchor, constant: 5),
            dividerView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 8),
            dividerView.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -8),
            dividerView.bottomAnchor.constraint(equalTo: dividerView.topAnchor, constant: 1)
        ])
        
        background.addSubview(descField)
        NSLayoutConstraint.activate([
            descField.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 8),
            descField.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 8),
            descField.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -8)
        ])
        
        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: background.bottomAnchor, constant: 35),
            dateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 27),
        ])
        
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 12),
            datePicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 27),
        ])
    }
    
    @objc func ViewDismiss(){
        navigationController?.dismiss(animated: true)
    }
    
    @objc func CreateActivity(){
//        //
//        let newActivity = Activity(context: self.context)
//        
//        //newActivity.category =
//        //etc...
//        
//        do{
//            try self.context.save()
//        }catch{
//            print("Error in data creation")
//        }
//        
//        self.fetchActivity()
    }
}

#Preview(){
    return AddSheetView()
}
