//
//  ViewController.swift
//  NikeItunes
//
//  Created by hui liu on 3/6/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class MusicListsVC: UIViewController {
    
    var tableView: UITableView = UITableView()
    let cellId = "cellId"
    
    var responseData: ResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        networkCall()
        
        view.backgroundColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.register(MusicCellView.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = 100
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func networkCall() {
        APICall.getMusics { (res) in
            DispatchQueue.main.async {
                self.responseData = res
                self.tableView.reloadData()
            }
        }
    }
}

extension MusicListsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let res = responseData else {
            return 1
        }
        return res.feed.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MusicCellView else { return UITableViewCell() }
        
        let curr = responseData?.feed.results[indexPath.row]
        cell.music = curr
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailVC()
        controller.music = responseData?.feed.results[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
