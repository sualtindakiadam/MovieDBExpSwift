//
//  ViewController.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 16.04.2022.
//

import UIKit
import ImageSlideshow

class MainVC: UIViewController {
    var inputArray = [AFURLSource]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputArray.append(AFURLSource(urlString: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg")!)
        inputArray.append(AFURLSource(urlString: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/x747ZvF0CcYYTTpPRCoUrxA2cYy.jpg")!)
    
        
        let imageSlideShow = ImageSlideshow(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 0.35))
        imageSlideShow.backgroundColor = UIColor.white
        imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        imageSlideShow.setImageInputs(inputArray)
        self.view.addSubview(imageSlideShow)
        
        
    }
    
    


}

