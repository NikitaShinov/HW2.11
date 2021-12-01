//
//  BeerDetailsViewController.swift
//  HW2.11
//
//  Created by Никита Шинов on 01.12.2021.
//

import UIKit

class BeerDetailsViewController: UIViewController {
    
    @IBOutlet weak var beerLogoImage: UIImageView!
    @IBOutlet weak var beerDescription: UILabel!
    
    var beer: Beer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI () {
        title = beer.name
        beerDescription.text = beer.beerDescription
        
        DispatchQueue.global().async {
            guard let stringURL = self.beer.imageURL else { return }
            guard let url = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.beerLogoImage.image = UIImage(data: imageData)
            }
        }
    }
}
