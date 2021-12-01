//
//  BeerTableViewCell.swift
//  HW2.11
//
//  Created by Никита Шинов on 01.12.2021.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var imageBeer: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    
    func configure (with beer: Beer) {
        
        beerName.text = beer.name
        ibuLabel.text = "IBU is: \(beer.ibu ?? 0)"
        abvLabel.text = "ABV is: \(beer.abv ?? 0)"
        
        NetworkManager.shared.fetchImage(from: beer.imageURL ?? "") { result in
            switch result {
                
            case .success(let image):
                self.imageBeer.image = UIImage(data: image)
            case .failure(let error):
                print (error)
            }
        }
    }
}
