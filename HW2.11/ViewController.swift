//
//  ViewController.swift
//  HW2.11
//
//  Created by Никита Шинов on 01.12.2021.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let beersVC = segue.destination as? BeerTableViewController else { return }
        beersVC.fetchBeers()
    }

}


