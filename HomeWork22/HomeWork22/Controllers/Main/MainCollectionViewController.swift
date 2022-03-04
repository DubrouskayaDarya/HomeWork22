//
//  MainCollectionViewController.swift
//  HomeWork22
//
//  Created by Дарья Дубровская on 27.02.22.
//

import UIKit

enum Actions: String, CaseIterable {
    case downloadImage = "Download Images"
    case users = "Users"
}

private let reuseIdentifier = "CollectionCell"
private let reuseIdentifier2 = "UsersCell"

class MainCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    private let actions = Actions.allCases

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.labelCollectionCell.text = actions[indexPath.item].rawValue
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.item]

        switch action {
        case .downloadImage:
            performSegue(withIdentifier: "ShowImage", sender: self)
        case .users:
            performSegue(withIdentifier: "showUsers", sender: self)
        }

        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showUsers" {
                let coursesVC = segue.destination as! UsersTableViewController
                coursesVC.fetchData()
            }
        }
    }
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 20), height: 80)
    }
}
