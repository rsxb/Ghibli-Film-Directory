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

    var detailItem: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let title = detailItem!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        let urlRequest = URLRequest(url: URL(string: "\(baseUrl)\(title)")!)
        webView.load(urlRequest)
    }

}
