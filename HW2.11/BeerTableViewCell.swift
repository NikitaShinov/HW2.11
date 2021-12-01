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
        
        DispatchQueue.global().async {
            guard let stringUrl = beer.imageURL else { return }
            guard let url = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageBeer.image = UIImage(data: imageData)
            }
        }
    }
}
