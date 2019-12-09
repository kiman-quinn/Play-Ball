//
//  TermsViewController.swift
//  PlayBall
//
//  Created by Kim-An Quinn on 12/9/19.
//  Copyright © 2019 Kim-An Quinn. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var termList = [Definition]()
    
    var abrev = ["AB", "PA", "BB", "QPA", "K", "H", "1B", "2B", "3B", "HR", "BA", "XBH", "OBP", "SLG", "QPA"]
    var term = ["At Bats", "Plate Appearances", "Base On Balls", "Quality Plate Appearance", "Strikeout", "Hits", "Single", "Double", "Triple", "Homerun", "Batting Average", "Extra Base Hit", "On Base Percentage", "Slugging Percentage", "Quality Plate Appearances Percentage"]
    var def = ["Plate appearances excluding walks, sacrifice, and hit by pitch", "Total amount of times going up to bat", "Walk after 4 balls", "Can result in an out, but plate appearance makes opposing pitcher work hard or benefits the team as a whole", "Strike out either looking or swinging", "Unplayable ball by the defense resulting batter reaching on base", "Hit reaching first base", "Hit reaching second base", "Hit reaching third base", "Hit reaching all four bases", "Percentage of hits per at bats", "Total extra base hits", "Percentage of reaching bases per plate appearance", "Total bases reached weighted per at bat", "Percentage of plate appearance per inning"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createTerms()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"{
            let destination = segue.destination as! TermDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow
            destination.abbreviation = termList[selectedIndexPath!.row].abbreviation
            destination.term = termList[selectedIndexPath!.row].term
            destination.definition = termList[selectedIndexPath!.row].def
        }else{
            if let selectedPath = tableView.indexPathForSelectedRow{
                tableView.deselectRow(at: selectedPath, animated: true)
            }
        }
    }
    
    func createTerms (){
        for index in 0..<15{
            termList.append(Definition(abbreviation: abrev[index], term: term[index], def: def[index]))
        }
    }

}
extension TermsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return termList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = termList[indexPath.row].abbreviation
        return cell
    }
    
    
}
