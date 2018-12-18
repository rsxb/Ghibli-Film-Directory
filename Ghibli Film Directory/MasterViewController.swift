//
//  MasterViewController.swift
//  Ghibli Film Directory
//
//  This app is developed as an educational project.  Certain materials are included under the fair use exemption of the U.S. Copyright Law and have been prepared according to the multimedia fair use guidelines and are restricted from further use.
//
//  Movie data attributed to TMDb, The Movie Database.
//
//  Created by Ravneet Singh on 12/16/18.
//  Copyright © 2018 Ravneet Singh.  All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    // base url for images
    let baseUrl = "https://image.tmdb.org/t/p/w92"

    var movies = [MovieService.Movie]()

    func populateMovies() {
        let json = try? Data(contentsOf: URL(string: "https://api.themoviedb.org/4/discover/movie?api_key=68e6eaafcf08f3b6df1f24ebbd150d7b&with_companies=10342")!)

        movies = try! JSONDecoder().decode(MovieService.self, from: json!).results
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        populateMovies()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let movie = movies[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = movie
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let movie = movies[indexPath.row]
        cell.textLabel!.text = movie.title
        cell.detailTextLabel!.text = movie.originalTitle

        if let view = cell.imageView {
            // style the cell
            view.contentMode = .scaleAspectFit
            view.clipsToBounds = true

            // add image to cell
            let bytes = try? Data(contentsOf: URL(string: "\(baseUrl)\(movie.posterPath)")!)
            view.image = UIImage(data: bytes!)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }


}

