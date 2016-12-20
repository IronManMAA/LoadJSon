//
//  TableTableViewController.swift
//  LoadJSon
//
//  Created by Marco Almeida on 12/19/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    struct Team {
        var category = ""
        var name = ""
        var url = ""
    }
    var aTeamArray = [Team]()    // initialize an empty Array

    override func viewDidLoad() {
        super.viewDidLoad()

       
//        do { try.... } catch { let nserror = error as NSError print("Details of JSON parsing error:\n \(nserror)")}
        
        let path = Bundle.main.path(forResource: "sportTeams",ofType:"json")
        if let binaryData = NSData(contentsOfFile: path!) {
        do {
            let arrayOfDictionaries = try JSONSerialization.jsonObject(with: binaryData as Data, options: .allowFragments) as! [[String: Any]]
             // an Array of Dictionaries

            for aDictionary in arrayOfDictionaries {
                let NameT = aDictionary["name"] as! String
                let urlT = aDictionary["url"] as! String
                let categoryT = aDictionary["category"] as! String
                let anTeam = Team(category: categoryT, name: NameT, url: urlT)
                aTeamArray.append(anTeam)
            }
          }
          //else throw an error detailing what went wrong
          catch let error as NSError {
          print("Details of JSON parsing error:\n \(error)")
          }
        }
        
//print(aTeamArray.count)

        
    } // end of viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aTeamArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)

        let aTeam = aTeamArray[indexPath.row]
        cell.textLabel?.text = aTeam.name
        cell.detailTextLabel?.text = aTeam.url
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _ = tableView.cellForRow(at: indexPath as IndexPath) as UITableViewCell!
        
        
        // launch WebLink with the currentCell
        
        
        
    }
    
    var teamNameSague = String()
    var teamUrlSague = String()

    // Segue Controllers  ********************************************
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("Got up to here-4")
        if segue.identifier == "DetailTableViewSegue"
        {
            if let destinationVC = segue.destination as? DetailTableView {
                let path = tableView.indexPathForSelectedRow
                destinationVC.teamNameSague = String(aTeamArray[(path?.row)!].name)
                destinationVC.teamUrlSague = String(aTeamArray[(path?.row)!].url)
                
            }
        }
    }    //     End of Segue Controllers  ********************************************
    
 
    
    
    
    
    
    
    
    
 
}
