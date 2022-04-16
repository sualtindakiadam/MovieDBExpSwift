//
//  NowPlayingModel.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 17.04.2022.
//

import Foundation

struct MovieModel{
    
    //var dates: Array<Date>?
    var dates: [Dates]?
    var page: Int?
    //var results: Array<AnyObject>?
    var results: [Results]?
    var total_pages: Int?
    var total_results: Int?
    
   /* init(dates: Array<Date>?,page: Int?,results: Array<AnyObject>?,total_pages: Int?,total_results: Int?){
        self.dates = dates
        self.page = page
        self.results = results
        self.total_pages = total_pages
        self.total_results = total_results
    }*/
    
}

struct Dates {
    var maximum : Date?
    var minimum : Date?
}

struct Results  : Identifiable {
    var modelId = UUID()
    var adult : Bool?
    var backdrop_path : String?
    var genre_ids: Array<Int>?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: Date?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int?
}

