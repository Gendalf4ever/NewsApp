//
//  Model.swift
//  NewsApp
//
//  Created by Master on 23.09.2021.
//

import Foundation

var articles: [Article] = []
var urlToData: URL{
    let path =  NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
      
     let urlPath = URL(fileURLWithPath: path)
    return urlPath
}
func loadNews(completionHandler: (()->Void)?) {
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c3a5a8d3fc2c4622a20c48c16fe89bb6")
    let session = URLSession(configuration: .default)
   let downloadTask = session.downloadTask(with: url!) { (urlFile, response, error) in
    if urlFile != nil {

    
        try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
        parseNews()
       completionHandler?()
        }
    }
    
    downloadTask.resume()
}

func parseNews(){
  
   let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return
    }
    
 
   let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    
   let rootDictionary = rootDictionaryAny as?  Dictionary<String, Any>
    if rootDictionary == nil {
         return
    }
    if let array = rootDictionary!["articles"] as?  [Dictionary<String, Any>] {
        
        var returnArray: [Article] = []
        
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }

        articles = returnArray
    }

}
