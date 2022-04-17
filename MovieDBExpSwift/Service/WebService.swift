//
//  WebService.swift
//  MovieDBExpSwift
//
//  Created by Semih Kalaycı on 17.04.2022.
//

import Foundation
 


class WebService{
    func getNowPlayingData(url: URL, completion: @escaping(MovieModel?)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Bir şeyler yanlış")
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                do{
                    
                    if let movieDict = try JSONSerialization.jsonObject(with: data, options: [] ) as? [String:Any]{
                        let movieList = MovieModel(dict: movieDict)
                        print(movieList)
                        
                        completion(movieList)

                    }
                    
                    
            
 
               /* let movieList = try? JSONDecoder().decode(MovieModel.self, from: data)
                    print("DATAA---------")
                    print(movieList)
                    print(response)
                    
                    if let movieList = movieList {
                        completion(movieList)
                    }*/
                } catch{
                    print("kötü gitti \(error.localizedDescription)")

                }
                
              
            }
            
            
            
            
           /* guard let data = data, error == nil else {
                print("bir şeyler yanlış gitti ----------------------")
                return
            }
            
            var result: MovieModel?
            do{
                result = try JSONDecoder().decode(MovieModel.self, from: data)
            }catch{
                print("kötü gitti \(error.localizedDescription)")
            }
            guard let json = result else{
                return
            }
            print(json)
*/
            
            
            
        }.resume()
    }
}

