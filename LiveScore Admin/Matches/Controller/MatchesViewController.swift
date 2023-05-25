//
//  ScoreViewController.swift
//  LiveScore Admin
//
//  Created by Aruzhan Boranbay on 10.05.2023.
//

import UIKit
import SnapKit

class MatchesViewController: UIViewController {
    
    private lazy var buttonLive: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitle("LIVE", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        
        return button
    }()
    
    private lazy var buttonCallendar: UIButton = {
        let button = UIButton(type: .system)
        let iconImg = UIImage(systemName: "calendar")
        button.setImage(iconImg, for: .normal)
        button.layer.cornerRadius = 10
//        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        
        return button
    }()
    
    private lazy var dateSegmentControll: UISegmentedControl = {
        let segmentControll = UISegmentedControl(items: ["1", "2", "3", "4", "5"])
        segmentControll.selectedSegmentIndex = 2
        return segmentControll
    }()
    
    private lazy var gamesViewController: UITableView = {
        let tableView = UITableView()
        tableView.register(GamesTableViewCell.self, forCellReuseIdentifier: GamesTableViewCell.IDENTIFIER)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .orange
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationButton()
        
        setUpViews()
        setUpConstraints()
        
    }
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonLive, dateSegmentControll, buttonCallendar])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        
        return stackView
    }()

}

//MARK: - tableView DataSource
extension MatchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GamesTableViewCell.IDENTIFIER, for: indexPath) as! GamesTableViewCell
        return cell
    }
    
}

//MARK: - NavigaionBar
extension MatchesViewController {
    func setNavigationButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addButton
        addButton.tintColor = .orange
    }
    
    @objc func addTapped() {
        print("Add")
    }
}

//MARK: - setUpViews and setUpConstaints
extension MatchesViewController {
    func setUpViews(){
        view.addSubview(topStackView)
        view.addSubview(gamesViewController)
    }
    
    func setUpConstraints() {
        topStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
        
        gamesViewController.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
