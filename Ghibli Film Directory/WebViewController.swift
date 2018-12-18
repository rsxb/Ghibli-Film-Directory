//
//  WebViewController.swift
//  Ghibli Film Directory
//
//  Created by Ravneet Singh on 12/17/18.
//  Copyright © 2018 Ravneet Singh.  All rights reserved.
//

import UIKit
import WebKit
import Foundation

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!

    let baseUrl = "https://www.wikipedia.org/wiki/"

    var movieTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        let title = movieTitle!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let urlRequest = URLRequest(url: URL(string: "\(baseUrl)\(title!)")!)
        webView.load(urlRequest)
    }

}
