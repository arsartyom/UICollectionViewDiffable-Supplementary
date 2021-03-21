//
//  ViewController.swift
//  colview
//
//  Created by Artem Arslanov on 19.03.2021.
//  Copyright © 2021 Artem Arslanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UICollectionViewDelegate {
    
    enum Section{
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
        
        
        
        
    }
    func configureHierarchy(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemGray2
        collectionView.register(SquareCell.self, forCellWithReuseIdentifier: SquareCell.identifier)
        view.addSubview(collectionView)
    }
    
    func createLayout() -> UICollectionViewLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(55))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
    }
    
    func configureDataSource(){
        
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, identifier) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SquareCell.identifier, for: indexPath) as? SquareCell else {fatalError("Cannot create new cell")} 
            cell.label.text = "\(identifier)"
            cell.contentView.backgroundColor = .systemBlue
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.label.textAlignment = .center
            cell.label.font = UIFont.preferredFont(forTextStyle: .title1)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(1...100))
        dataSource.apply(snapshot)
    }
    
}
