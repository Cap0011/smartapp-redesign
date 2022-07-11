//
//  ProfileViewController.swift
//  SmartDesign
//
//  Created by Jiyoung Park on 2022/07/10.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 화면"
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
