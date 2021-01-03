//
//  HourlyTableViewCell.swift
//  RAINBW
//
//  Created by Tadreik Campbell on 2/18/20.
//  Copyright © 2020 Tadreik Campbell. All rights reserved.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.reloadData()
    }

}
