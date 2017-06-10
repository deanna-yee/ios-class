//
//  APIController.swift
//  UpcomingMovies
//
//  Created by Deanna Yee on 11/28/16.
//  Copyright © 2016 cisstudent. All rights reserved.
//

import Foundation
import UIKit

protocol APIControllerDelegate {
    func apiSucceededWithResults(results: NSArray)
    func apiFailedWithError(error: String)
}

class APIController: NSObject {
    
    var delegate: APIControllerDelegate?
    
    func getAPIResults(urlString:String){
        
        //The Url that will be called.
        let url = NSURL(string: urlString)
        //Create a request.
        let request = NSMutableURLRequest(URL:url!)
        //Sending Asynchronous request using NSURLSession.
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            do {
                //Check that we have received data
                guard let data = data else {
                    self.delegate?.apiFailedWithError("ERROR: no data")
                    return
                }
                //Call the JSON serialisation methdod to generate array of results.
                dispatch_async(dispatch_get_main_queue()){
                    self.generateResults(data)
                }
            }
        }.resume()
    }
    
    func generateResults(apiData: NSData){
        do {
            //Serialise the api data into a json object
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(apiData, options: .AllowFragments)
            //verify we can serialise the json object into a dictionary
            guard let jsonDictionary: NSDictionary = jsonResult as? NSDictionary else {
                self.delegate?.apiFailedWithError("ERROR: conversion from JSON failed")
                return
            }
            //Create an array of results
            print(jsonDictionary)
            let results: NSArray = jsonDictionary["results"] as! NSArray
            //Use the completion handler to pass the results
            self.delegate?.apiSucceededWithResults(results)
        }
        catch {
            self.delegate?.apiFailedWithError("ERROR: conversion from JSON failed")
        }
    }
}
