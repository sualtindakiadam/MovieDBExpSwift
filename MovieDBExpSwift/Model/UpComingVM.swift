//
//  MainVM.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 17.04.2022.
//

import Foundation

struct UpComingListVM {
    var movieList : [Results]
    
    func numberOfRowsInSection() ->Int {
        return self.movieList.count
    }
    
    func movieAtIndex(_ index: Int) -> UpComingVM{
        let nowPlaying = self.movieList[index]
        return UpComingVM(upComingPlaying: nowPlaying)
    }
    
    
}


struct UpComingVM {
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
    var date : String?{
        return upComingPlaying.release_date
    }
    var imdbScore : Float?{
        return upComingPlaying.vote_average
    }
}
