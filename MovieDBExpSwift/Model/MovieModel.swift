//
//  NowPlayingModel.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 17.04.2022.
//

import Foundation

struct MovieModel : Codable {

   var dates : Dates?
    var page : Int?
    var results : [Results]?
    var total_pages : Int?
    var total_results : Int?

    /*let currency : String
    let price : String*/
    
    init(dict : [String:Any]){
        /*guard let dates = dict["dates"] as? Dates else { return nil }
        guard let page = dict["page"] as? Int else { return nil }
        guard let results = dict["results"] as? [Results] else { return nil }
        guard let total_pages = dict["total_pages"] as? Int else { return nil }
        guard let total_results = dict["total_results"] as? Int else { return nil }
*/
        
        //dates = dict["dates"] as? Dates
        dates = Dates(dict: dict["dates"] as? [String : Any] )

        page = dict["page"] as? Int
        //results = Results(dict: dict["results"] as? [String : Any])
        
        
        if let results = dict["results"] as? [[String : Any]]{
            
            self.results = [Results]()
            results.forEach { result in
                let test = Results(dict: result as? [String : Any])
                self.results?.append(test)
                
            }
            
            
        }
        total_pages = dict["total_pages"] as? Int
        total_results = dict["total_results"] as? Int

    }
    
    
}



struct Dates : Codable
{
    var maximum : String?
    var minimum : String?
    
    init(dict : [String:Any]?){

        maximum = dict?["maximum"] as? String
        minimum = dict?["minimum"] as? String


    }
    
    
}
struct Results  : Codable  {
    var adult : Bool?
    var backdrop_path : String?
    var genre_ids : [Int]?
    var id : Int?
    var original_language : String?
    var original_title : String?
    var overview : String?
    var popularity : Int?
    var poster_path : String?
    var release_date : String?
    var title : String?
    var video : Bool?
    var vote_average : Float?
    var vote_count : Int?
    
    
    init(dict : [String:Any]?){

        adult = dict?["adult"] as? Bool
        backdrop_path = dict?["maxibackdrop_pathmum"] as? String
        genre_ids = dict?["genre_ids"] as? [Int]
        id = dict?["id"] as? Int
        original_language = dict?["original_language"] as? String
        original_title = dict?["original_title"] as? String
        overview = dict?["overview"] as? String
        popularity = dict?["popularity"] as? Int
        poster_path = dict?["poster_path"] as? String
        release_date = dict?["release_date"] as? String
        title = dict?["title"] as? String
        video = dict?["video"] as? Bool
        vote_average = dict?["vote_average"] as? Float
        vote_count = dict?["vote_count"] as? Int


    }

}


