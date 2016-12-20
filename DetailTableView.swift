//
//  DetailTableViewCell.swift
//  LoadJSon
//
//  Created by Marco Almeida on 12/20/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

    import Foundation
    import UIKit

    class DetailTableView: UIViewController
    {
   
    @IBOutlet var teamName : UILabel!
    @IBOutlet var teamUrl : UILabel!
    var teamNameSague = String()
    var teamUrlSague = String()
    
    override func viewWillAppear(_ animated: Bool){
        self.teamName.text = self.teamNameSague
        self.teamUrl.text = self.teamUrlSague
    }

        
        
        
}
