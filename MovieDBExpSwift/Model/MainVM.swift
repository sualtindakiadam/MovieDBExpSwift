//
//  MainVM.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 17.04.2022.
//

import Foundation

struct MovieListVM {
    var movieList : [Results]
    
    func numberOfRowsInSection() ->Int {
        return self.movieList.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieVM{
        let nowPlaying = self.movieList[index]
        return MovieVM(upComingPlaying: nowPlaying)
    }
    
    
}


struct MovieVM {
    var upComingPlaying : Results
    
    var name : String? {
        return upComingPlaying.title
    }
    var description : String? {
        return upComingPlaying.overview
    }
    var image : String? {
        return upComingPlaying.poster_path
    }
}
