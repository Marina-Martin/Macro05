//
//  ViewController.swift
//  Treat
//
//  Created by Marina Martin on 13/05/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: variables
    
    var collectionViewDelegate: CollectionViewDelegate = CollectionViewDelegate()
    var collectionViewDataSource: UICollectionViewDataSource?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var activities: [Activity]?
    private let activitiesTest: [String] = ["Atividade 1", "Atividade 2"]
    
    // MARK: Components
    
    private let colectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let colectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        colectionView.backgroundColor = .clear
        
        colectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        colectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return colectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = UIColor(named: "AppBlack")
        
        setNavigationBar()
                
        collectionViewDataSource = ActivityCollectionDataSource(activities: activitiesTest, title: activitiesTest)
        
        setConstraints()
        
        colectionView.delegate = collectionViewDelegate
        colectionView.dataSource = collectionViewDataSource
    }
    
    // MARK: - Setup
    
    func setNavigationBar(){
        navigationItem.title = "Suas Atividades"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AppWhite") ?? .white, NSAttributedString.Key.font: UIFont(name: "RadioCanada-Regular_bold", size: 32)!]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AppWhite") ?? .white, NSAttributedString.Key.font: UIFont(name: "RadioCanada-Regular_bold", size: 32)!]
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: (UIImage(systemName: "plus.circle.fill")), style: .plain, target: nil, action: nil),
            UIBarButtonItem(image: (UIImage(systemName: "line.3.horizontal.decrease.circle")), style: .plain, target: nil, action: nil),
        ]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func setConstraints(){
        view.addSubview(colectionView)
        NSLayoutConstraint.activate([
            colectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            colectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            colectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            colectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

#Preview(){
    return ViewController()
}

