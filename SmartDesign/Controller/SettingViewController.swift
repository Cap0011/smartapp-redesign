//
//  SettingViewController.swift
//  SmartDesign
//
//  Created by Jiyoung Park on 2022/07/10.
//

import UIKit

class SettingViewController: UIViewController {
    
    let tableView: UITableView = {
        let tv = UITableView()
        
        return tv
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "설정 화면"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()

    // 뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

// MARK: - TableView extension

extension SettingViewController: UITableViewDelegate {
    
}

extension SettingViewController: UITableViewDataSource {
    
    // cell의 개수(보통은 데이터의 개수)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // 각 셀에 대한 설정(분기 처리)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
