//
//  ActivityCollectionDataSource.swift
//  Treat
//
//  Created by Marina Martin on 15/05/24.
//

import UIKit

class ActivityCollectionDataSource: NSObject, UICollectionViewDataSource {
    //private var activities: [Activity]
    private var activities: [String]
    private var title: [String]
    //MARK: missing other activity data
    
    init(activities: [String], title: [String]) {
        self.activities = activities
        self.title = title
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        else{
            fatalError("Failed to dequeue")
        }
        
        cell.configData(title: activities[indexPath.row], description: activities[indexPath.row])
        
        return cell
    }
}
