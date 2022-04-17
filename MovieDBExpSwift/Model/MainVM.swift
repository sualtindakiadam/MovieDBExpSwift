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
        return MovieVM(nowPlaying: nowPlaying)
    }
    
    
}


struct MovieVM {
    var nowPlaying : Results
    
    var name : String? {
        return nowPlaying.title
    }
    var description : String? {
        return nowPlaying.overview
    }
    var image : String? {
        return nowPlaying.poster_path
    }
}
