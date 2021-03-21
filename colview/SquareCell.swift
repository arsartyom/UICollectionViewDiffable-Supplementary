//
//  SquareCell.swift
//  colview
//
//  Created by Artem Arslanov on 20.03.2021.
//  Copyright © 2021 Artem Arslanov. All rights reserved.
//

import UIKit

class SquareCell: UICollectionViewCell {
    static let identifier = "SquareCell "
    
    let label = UILabel()
    let cellView = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        contentView.addSubview(label)
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
        ])
        
    }
    
}
