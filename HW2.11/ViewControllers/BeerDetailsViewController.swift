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
        
        NetworkManager.shared.fetchImage(from: beer.imageURL ?? "") { result in
            switch result {
            case .success(let image):
                self.beerLogoImage.image = UIImage(data: image)
            case .failure(let error):
                print (error.localizedDescription)
            }
        }
    }
}
