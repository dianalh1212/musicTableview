//
//  MusicCellView.swift
//  NikeItunes
//
//  Created by hui liu on 3/6/20.
//  Copyright © 2020 hui liu. All rights reserved.
//

import UIKit

class MusicCellView: UITableViewCell {
    
    var music: Music? {
        didSet {
            setUpImage(string: music?.artworkUrl100 ?? "")
            musicTitleLabel.text = music?.name
            artistNameLabel.text = music?.artistName
        }
    }
    
    private lazy var musicTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var musicImage: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(musicImage)
        
        containerView.addSubview(musicTitleLabel)
        containerView.addSubview(artistNameLabel)
        contentView.addSubview(containerView)
        
        setUpImageContraints()
        setUpContainViewConstraints()
        setUpMusicNameLabelContraints()
        setUpMusicArtistNameLabelContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpContainViewConstraints() {
        containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: musicImage.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
    }
    
    func setUpImageContraints() {
        musicImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        musicImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        musicImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        musicImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setUpMusicNameLabelContraints() {
        musicTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        musicTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        musicTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    func setUpMusicArtistNameLabelContraints() {
        artistNameLabel.topAnchor.constraint(equalTo: musicTitleLabel.bottomAnchor).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
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
}


