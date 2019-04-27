//
//  CollectionViewCell.swift
//  CamProject
//
//  Created by Deepashri Khawase on 27.04.19.
//  Copyright © 2019 Deep Yoga. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    func configurecell(image: UIImage){
        
        
        imageView.image = image
        
    }
}
