//
//  ViewController.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 16.04.2022.
//

import UIKit
import ImageSlideshow

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var inputArray = [AFURLSource]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        inputArray.append(AFURLSource(urlString: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg")!)
        inputArray.append(AFURLSource(urlString: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/x747ZvF0CcYYTTpPRCoUrxA2cYy.jpg")!)
    
        
        let imageSlideShow = ImageSlideshow(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 250))
        imageSlideShow.backgroundColor = UIColor.white
        imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        imageSlideShow.setImageInputs(inputArray)
        self.view.addSubview(imageSlideShow)
        //self.view.bringSubviewToFront(T##view: UIView##UIView) //önde gösterilmek istenirse bir şey
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        return cell
    }
    
    


}

