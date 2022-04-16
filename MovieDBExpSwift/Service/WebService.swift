//
//  WebService.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 17.04.2022.
//

import Foundation

class WebService{
    func getNowPlayingData(url: URL, completion: @escaping([MovieModel]?)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let movieList = try? JSONDecoder().decode([MovieModel].self, from: data)
                
                if let movieList = movieList {
                    completion(movieList)
                }
            }
        }.resume()
    }
}

