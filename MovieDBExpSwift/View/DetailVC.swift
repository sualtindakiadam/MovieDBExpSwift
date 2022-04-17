//
//  DetailVC.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 18.04.2022.
//

import UIKit
import ImageSlideshow

class DetailVC: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var detailTitleLable: UILabel!
    @IBOutlet weak var detailIMDBScoreLabel: UILabel!
    
    
    var selectedMovieDescription = ""
    var selectedMovieImageURL = ""
    
    var selectedMovieTitle = ""
    var selectedMovieIMDBScore = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTextLabel.text = selectedMovieDescription
        detailTitleLable.text = selectedMovieTitle
        detailIMDBScoreLabel.text = selectedMovieIMDBScore



        
        var imageString = "https://image.tmdb.org/t/p/w300_and_h450_bestv2" + (selectedMovieImageURL ?? "")
        var imageURL = URL(string : imageString)
        
        if let imageData = try? Data(contentsOf: imageURL!) {
            if let loadedImage = UIImage(data: imageData) {
                detailImageView.image = loadedImage
                detailImageView.contentMode = UIViewContentMode.redraw
                
            }
        }

       
    }
    



}




