//
//  ViewController.swift
//  Mastagram
//
//  Created by Madeline on 2/7/24.
//

import SnapKit
import UIKit

// MARK: MainView
class ViewController: BaseViewController {

    let feedTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureHeirarchy() {
        view.addSubview(feedTableView)
    }
    override func configureLayout() {
        
        feedTableView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        feedTableView.register(MainHeaderTableViewCell.self, forCellReuseIdentifier: "MainHeaderTableViewCell")
        feedTableView.backgroundColor = .black
        feedTableView.reloadData()
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainHeaderTableViewCell", for: indexPath) as! MainHeaderTableViewCell
            
            cell.callBackMehtod = { [weak self] in
                let vc = ProfileEditViewController()
                vc.modalPresentationStyle = .fullScreen
                self!.present(vc, animated: true)
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            
            return 44
        } else {
            
            return 300
        }
    }
}
