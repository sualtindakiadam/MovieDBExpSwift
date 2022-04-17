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
    
    private var movieListViewModel: MovieListVM!
    
    var inputArray = [AFURLSource]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
        inputArray.append(AFURLSource(urlString: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg")!)
        inputArray.append(AFURLSource(urlString: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/x747ZvF0CcYYTTpPRCoUrxA2cYy.jpg")!)
        



        let imageSlideShow = ImageSlideshow(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 250))
        imageSlideShow.backgroundColor = UIColor.white
        imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        imageSlideShow.setImageInputs(inputArray)
        self.view.addSubview(imageSlideShow)
        //self.view.bringSubviewToFront(T##view: UIView##UIView) //önde gösterilmek istenirse bir şey
        
        
    }
    func getData(){
        
        //let url = URL(string : "https://api.themoviedb.org/3/movie/now_playing?api_key=8180ce56cfb81eb8a3b34550731c7a24&language=en-US&page=1")
        let url = URL(string : "https://api.themoviedb.org/3/movie/upcoming?api_key=8180ce56cfb81eb8a3b34550731c7a24&language=en-US&page=1")

        
        WebService().getNowPlayingData(url: url!) { (movies) in
            if let movies = movies?.results {
                
                self.movieListViewModel = MovieListVM(movieList: movies)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                //print(nowPlayings)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListViewModel == nil ? 0 : self.movieListViewModel.numberOfRowsInSection()
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let upcomingMovie = self.movieListViewModel.movieAtIndex(indexPath.row)
        cell.upcomingTitle.text = upcomingMovie.name
        return cell
    }
    
    


}

