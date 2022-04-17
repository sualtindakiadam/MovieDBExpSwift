//
//  NowPlayingMovieVM.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 17.04.2022.
//

import Foundation


struct NowPlayingMovieListVM {
    var nowPlayingMovieList : [Results]
    
    func comingNumberOfRowsInSection() ->Int {
        return self.nowPlayingMovieList.count
    }
    
    func movieAtIndex(_ index: Int) -> NowPlayingMovieVM{
        let nowPlaying = self.nowPlayingMovieList[index]
        return NowPlayingMovieVM(nowPlaying: nowPlaying)
    }
    
    
}


struct NowPlayingMovieVM {
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
