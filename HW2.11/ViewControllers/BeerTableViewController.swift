//
//  BeerTableViewController.swift
//  HW2.11
//
//  Created by Никита Шинов on 01.12.2021.
//

import UIKit

class BeerTableViewController: UITableViewController {
    
    private var beers: [Beer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        NetworkManager.shared.fetchBeerWuthAlamofire(link) { result in
            switch result {
            case .success(let beers):
                self.beers = beers
                self.tableView.reloadData()
            case .failure(let error):
                print (error)
            }
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        beers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
        cell.configure(with: beers[indexPath.row])
        return cell
    }    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let beerDetailsVC = segue.destination as? BeerDetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let beer = beers[indexPath.row]
        beerDetailsVC.beer = beer
    }
}
