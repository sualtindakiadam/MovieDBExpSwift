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

    
    private var movieListViewModel: UpComingListVM!
    private var nowPlayigListViewModel: NowPlayingMovieListVM!

    
    var inputArray = [AFURLSource]()
    
    var chosenMovieDescription = ""
    var chosenMovieImageUrl = ""
    var chosenMovieTitle = ""
    var chosenMovieIMDBScore = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getUpcomingData()
        getNowPlayingData()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.initslideShow()
        }
    }
    func initslideShow (){
        let imageSlideShow = ImageSlideshow(frame: CGRect(x: 0, y:0, width: self.view.frame.width, height: 250))
        imageSlideShow.backgroundColor = UIColor.white
        imageSlideShow.contentScaleMode = UIViewContentMode.redraw
        imageSlideShow.setImageInputs(inputArray)
        self.view.addSubview(imageSlideShow)
    }

    func getNowPlayingData(){
        
        let url = URL(string : "https://api.themoviedb.org/3/movie/now_playing?api_key=8180ce56cfb81eb8a3b34550731c7a24&language=en-US&page=1")
  
        WebService().getNowPlayingData(url: url!) { [self] (nowPlayingMovies) in
            if let nowPlayingMovies = nowPlayingMovies?.results {
                
                self.nowPlayigListViewModel = NowPlayingMovieListVM(nowPlayingMovieList: nowPlayingMovies)
                
                for imageStr in  nowPlayingMovies{

                    var imageString = "https://image.tmdb.org/t/p/w300_and_h450_bestv2" + (imageStr.poster_path ?? "")
                    self.inputArray.append(AFURLSource(urlString: imageString)!)
 
                }

            }
        }
        
    }
    
    func getUpcomingData(){
        

        let url = URL(string : "https://api.themoviedb.org/3/movie/upcoming?api_key=8180ce56cfb81eb8a3b34550731c7a24&language=en-US&page=1")

        
        WebService().getNowPlayingData(url: url!) { (movies) in
            if let movies = movies?.results {
                
                self.movieListViewModel = UpComingListVM(movieList: movies)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                

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
        cell.upcomingDescription.text = upcomingMovie.description
        cell.upcomingDate.text = upcomingMovie.upComingPlaying.release_date
        var imageString = "https://image.tmdb.org/t/p/w300_and_h450_bestv2" + (upcomingMovie.image ?? "")
        var imageURL = URL(string : imageString)
        DispatchQueue.main.async { [weak self] in
                   if let imageData = try? Data(contentsOf: imageURL!) {
                       if let loadedImage = UIImage(data: imageData) {
                           cell.upcomingImage.image = loadedImage
                    
                       }
                   }
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choosenMovie = self.movieListViewModel.movieAtIndex(indexPath.row)

        chosenMovieDescription = choosenMovie.description!
        chosenMovieImageUrl = choosenMovie.image!
        chosenMovieTitle = choosenMovie.name!
        
        if  choosenMovie.imdbScore != nil {
            
            var imdbStr = NSString(format: "%.1f", choosenMovie.imdbScore!)
            chosenMovieIMDBScore =  "\(imdbStr)/10    \(choosenMovie.date!)"
        }else{
            chosenMovieIMDBScore =  "-  \(choosenMovie.date!)"
        }
        
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailVC
            destinationVC.selectedMovieDescription = chosenMovieDescription
            destinationVC.selectedMovieImageURL = chosenMovieImageUrl
            destinationVC.selectedMovieTitle = chosenMovieTitle
            destinationVC.selectedMovieIMDBScore = chosenMovieIMDBScore
            
        }
    }
    
    


}

