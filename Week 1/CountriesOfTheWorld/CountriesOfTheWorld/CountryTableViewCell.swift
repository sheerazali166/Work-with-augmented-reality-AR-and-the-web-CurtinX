//
//  CountryTableViewCell.swift
//  CountriesOfTheWorld
//
//  Created by Sheeraz on 8/13/24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    func update(with country: Country) {
        
        flagLabel.text = country.flag
        nameLabel.text = country.name
        regionLabel.text = country.region
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
