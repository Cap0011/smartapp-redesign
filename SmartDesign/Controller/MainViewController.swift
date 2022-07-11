//
//  MainViewController.swift
//  SmartDesign
//
//  Created by Jiyoung Park on 2022/07/10.
//

import UIKit

class MainViewController: UIViewController {
    
    private var menuCollectionView: UICollectionView?
    
    private let menuTitleArray = ["월별 요금", "납부 현황", "자동 이체", "전기요금표", "FAQ", "고객센터"]
    private let menuTitleImage = [UIImage(systemName: "calendar"), UIImage(systemName: "shippingbox.fill"), UIImage(systemName: "dollarsign.circle"), UIImage(systemName: "newspaper"), UIImage(systemName: "questionmark.circle"), UIImage(systemName: "phone")]
    
    var payBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .black
        
        var titleAttr = AttributedString.init("6월 납부 요금")
        titleAttr.font = .systemFont(ofSize: 14.0, weight: .heavy)
        config.attributedTitle = titleAttr
        config.titlePadding = 5

        var subtitleAttr = AttributedString.init("13,000원")
        subtitleAttr.font = .systemFont(ofSize: 20.0, weight: .light)
        config.attributedSubtitle = subtitleAttr
        
        config.image = UIImage(systemName: "chevron.forward")
        config.imagePadding = 200
        config.imagePlacement = .trailing
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 30, bottom: 18, trailing: 19)
        
        let btn = UIButton(configuration: config)
        btn.layer.cornerRadius = 25
        btn.addTarget(self, action: #selector(moveToPayViewController), for: .touchUpInside)
        
        return btn
    }()
    
    var menuBtnConfig: UIButton.Configuration = {
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = UIColor(named: "myOrange")
        config.baseBackgroundColor = .white
        
        var titleAttr = AttributedString.init("월별 요금")
        titleAttr.font = .systemFont(ofSize: 14.0, weight: .semibold)
        config.attributedTitle = titleAttr
        
        config.image = UIImage(systemName: "calendar")
        config.imagePadding = 10
        config.imagePlacement = .top
        
        return config
    }()
    
    var monthsLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 6개월 요금 현황"
        label.font = .systemFont(ofSize: 22.0, weight: .semibold)
        return label
    }()
    
    var graphImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "graph")?.resizeImageTo(size: CGSize(width: 360, height: 200))
        return img
    }()

    // 뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 네비게이션 바
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(moveToSettingViewController))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(openMenuBar))
        
        // 납부하기 버튼
        view.addSubview(payBtn)
        payBtn.translatesAutoresizingMaskIntoConstraints = false
        payBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        payBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        // Set up CollectionView
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 25
        layout.minimumLineSpacing = 20
        menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let menuCollectionView = menuCollectionView else {
            return
        }
        menuCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        view.addSubview(menuCollectionView)
        menuCollectionView.frame = CGRect(x: 20, y: 200, width: 350, height: 220)
        
        // Text label
        view.addSubview(monthsLabel)
        monthsLabel.translatesAutoresizingMaskIntoConstraints = false
        monthsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        monthsLabel.topAnchor.constraint(equalTo: menuCollectionView.bottomAnchor, constant: 30).isActive = true
        
        // Graph image
        view.addSubview(graphImageView)
        graphImageView.translatesAutoresizingMaskIntoConstraints = false
        graphImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        graphImageView.topAnchor.constraint(equalTo: monthsLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    // 메뉴 바 열기
    @objc fileprivate func openMenuBar() {
        // open menu bar
    }
    
    // 설정 화면으로 이동
    @objc fileprivate func moveToSettingViewController() {
        if let navigationController = self.navigationController {
            navigationController.pushViewController(SettingViewController(), animated: true)
        }
    }
    
    // 납부 화면으로 이동
    @objc fileprivate func moveToPayViewController() {
        if let navigationController = self.navigationController {
            navigationController.pushViewController(PayViewController(), animated: true)
        }
    }
    
}

// MARK: - CollectionView

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuTitleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Set button
        let btn = UIButton(configuration: self.menuBtnConfig)
        btn.setTitle(self.menuTitleArray[indexPath.item], for: .normal)
        btn.setImage(self.menuTitleImage[indexPath.item], for: .normal)
        btn.frame.size = CGSize(width: 100, height: 100)
        btn.layer.shadowColor = UIColor.black.cgColor // 색깔
        btn.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        btn.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치 조정
        btn.layer.shadowRadius = 5 // 반경
        btn.layer.shadowOpacity = 0.3 // alpha값
        btn.addTarget(self, action: #selector(moveToPayViewController), for: .touchUpInside)
        
        cell.contentView.addSubview(btn)
        return cell
    }
}

// MARK: - UIImage extension
extension UIImage {
    
    func resizeImageTo(size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
