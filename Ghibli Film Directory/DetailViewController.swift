//
//  DetailViewController.swift
//  Ghibli Film Directory
//
//  Created by Ravneet Singh on 12/16/18.
//  Copyright © 2018 Ravneet Singh.  All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var originalTitle: UILabel!
    @IBOutlet weak var poster: UIImageView!

    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var overview: UILabel!


    let baseUrl = "https://image.tmdb.org/t/p/original"

    var detailItem: MovieService.Movie? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    func configureView() {
        if let detail = detailItem {
            if let title = movieTitle {
                title.text = detail.title

                originalTitle.text = detail.originalTitle
                releaseDate.text = detail.releaseDate
                rating.text = detail.voteAverage.description
                popularity.text = detail.popularity.description
                overview.text = detail.overview

                let bytes = try? Data(contentsOf: URL(string: "\(baseUrl)\(detail.posterPath)")!)
                poster.image = UIImage(data: bytes!)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openWiki" {
            let controller = segue.destination as! WebViewController
            controller.movieTitle = detailItem?.title
        }
    }


}

