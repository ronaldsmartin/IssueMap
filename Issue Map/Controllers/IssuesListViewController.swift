//
//  IssuesListViewController.swift
//  Issue Map
//
//  Created by Ronald Martin on 12/9/16.
//  Copyright © 2016 Ronald Martin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya_ObjectMapper

class IssuesListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let reuseID = "Issue Cell"
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindTableData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func bindTableData() {
        bitbucketAPI.request(.issues)
            .mapObject(IssueAPIResult.self)
            .map { $0.issues }
            .bindTo(tableView.rx.items(cellIdentifier: reuseID)) {
                row, item, cell in
                cell.textLabel?.text = item.title
                cell.detailTextLabel?.text = item.content
        }
        .addDisposableTo(disposeBag)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
