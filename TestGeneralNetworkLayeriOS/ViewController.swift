//
//  ViewController.swift
//  TestGeneralNetworkLayeriOS
//
//  Created by Vikash Anand on 15/08/20.
//

import UIKit
import GeneralNetwotkLayeriOS

class ViewController: UIViewController {

    private let sessionProvider = URLSessionProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPosts()
    }

    private func getPosts() {

        sessionProvider.request(type: [Post].self, service: PostService.all) { (result) in
            switch result {
            case let .success(posts):
                print(posts)
            case let .failure(error):
                print(error)
            }
        }
    }

}

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
}
