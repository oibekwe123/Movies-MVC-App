//
//  MoviesTableViewController.swift
//  Movies MVC
//
//  Created by MAC on 2/25/19.
//  Copyright © 2019 okechukwu Ibekwe. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    private let client = MoviesAPIClient()
    
    var thisTableViewDataSource = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
 
        client.getFeed(from: .nowPlaying) { result in
            switch result {
            case .success(let movieFeedResult):
                
                guard let movieResults = movieFeedResult?.results else { return }
       
             var gender = Movie(title:"",poster_path:"",overview: "", backdrop_path:"",release_date:"")
     
                for i in 0 ..< movieResults.count {
                    if let myTitle = movieResults[i].title {
                        gender.title = myTitle
                    if let MyPoster_path = movieResults[i].poster_path {
                        gender.poster_path = MyPoster_path
                    }
                    
                    if let MyOverview = movieResults[i].overview {
                        gender.overview = MyOverview
                    }
                        if let MyBackdrop_path = movieResults[i].backdrop_path {
                            gender.backdrop_path = MyBackdrop_path
                    }
                         if let MyRelease_date = movieResults[i].release_date {
                            gender.release_date = MyRelease_date
                    }
                    
                    }
                
                         self.thisTableViewDataSource.append(gender)
                        self.tableView.reloadData()
                       print(self.thisTableViewDataSource.count)
                    }
                    //self.thisTableViewDataSource.append(gender)
                
                
            
               // self.thisTableViewDataSource.append(gender)
                //dump(movieResults)
                //dump(gender.title!)
                
               case.failure(let error):
               print("The error was: \(error)")

                }
            }
            
        }
    


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return thisTableViewDataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = thisTableViewDataSource[indexPath.row].title
        //cell.textLabel?.text = thisTableViewDataSource[indexPath.row].poster_path
        cell.detailTextLabel?.text = thisTableViewDataSource[indexPath.row].overview
//        cell.textLabel?.text = thisTableViewDataSource[indexPath.row].backdrop_path
//        cell.detailTextLabel?.text = thisTableViewDataSource[indexPath.row].release_date
//
        
        return cell
    }
    

    

}
