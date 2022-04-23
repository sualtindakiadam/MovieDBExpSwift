//
//  MovieCell.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 16.04.2022.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var upcomingTitle: UILabel!
    @IBOutlet weak var upcomingDescription: UILabel!
    @IBOutlet weak var upcomingImage: UIImageView!
    @IBOutlet weak var upcomingDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
