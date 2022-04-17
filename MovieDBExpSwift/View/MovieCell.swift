//
//  MovieCell.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 16.04.2022.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var upcomingTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
