//
//  DetailCollectionViewController.swift
//  EnemyLosses
//
//  Created by Алина on 19.07.2022.
//

import UIKit


class DetailCollectionViewController: UICollectionViewController {

    let data = EquipmentDetail.EquipmentDetail

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.showsVerticalScrollIndicator = false

    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            DayLossesViewController, let index =
            collectionView.indexPathsForSelectedItems?.first {
            destination.selectedEquipment = data[index.row]
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailCollectionViewCell

        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 5
        cell.layer.borderColor = CGColor(red: 64.0/255.0, green: 64.0/255.0, blue: 64.0/255.0, alpha: 0.5)
        cell.backgroundColor = .white
        cell.label.text = data[indexPath.row]
        return cell
    }
}
