//
//  DetailViewController.swift
//  NikeItunes
//
//  Created by hui liu on 3/6/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var music: Music? {
        didSet {
            setUpImage(string: music?.artworkUrl100 ?? "")
            titleLabel.text = music?.name
            artistNameLabel.text = music?.artistName
            releaseDateLabel.text = music?.releaseDate
            genreLabel.text = music?.genres.map{$0.name}.joined(separator: " ")
            copyrightLabel.text = music?.copyright
        }
    }
    
    func setUpImage(string: String) {
        guard let url = URL(string: string) else {
            return
        }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.musicImage.image = UIImage(data: data)
            }
        }
    }
             
    private lazy var musicImage: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var copyrightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 50))
        button.setTitle("Open Itunes", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonAction(sender: UIButton?) {
        guard let music = music else { return }
        if let url = URL(string: music.url) {
            UIApplication.shared.open(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(musicImage)
        view.addSubview(titleLabel)
        view.addSubview(artistNameLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(genreLabel)
        view.addSubview(copyrightLabel)
        view.addSubview(button)
        
        view.backgroundColor  = UIColor.white
        
        musicImage.translatesAutoresizingMaskIntoConstraints = false
        musicImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        musicImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        musicImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        musicImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, artistNameLabel, releaseDateLabel, genreLabel, copyrightLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 2
        view.addSubview(stack)
        
        stack.topAnchor.constraint(equalTo: musicImage.bottomAnchor, constant: 10).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8).isActive = true
                
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
