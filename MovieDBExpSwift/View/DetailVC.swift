//
//  DetailVC.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 18.04.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTextLabel: UILabel!
    
    var selectedMovieDescription = ""
    var selectedMovieImageURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTextLabel.text = selectedMovieDescription

       
    }
    



}
