//
//  tableViewCell.swift
//  SaveTestProjekt
//
//  Created by Olekssandr on 04/07/2024.
//

import UIKit

class tableViewCell: UITableViewCell{
    
    let contactImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person1")
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
 
    var nameLable: UILabel = {
        var nameLable = UILabel()
        nameLable.font = UIFont.systemFont(ofSize: 16)
            //nameLable.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
        nameLable.lineBreakMode = NSLineBreakMode.byWordWrapping
        nameLable.numberOfLines = 0
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        return nameLable
    }()
   
    let phoneLable: UILabel = {
        var phoneLable = UILabel()
        phoneLable.numberOfLines = 0
        phoneLable.font = UIFont.systemFont(ofSize: 16)
        phoneLable.translatesAutoresizingMaskIntoConstraints = false
        return phoneLable
    }()
    let dateLable: UILabel = {
        var dateLable = UILabel()
        dateLable.numberOfLines = 0
        dateLable.font = UIFont.systemFont(ofSize: 16)
        dateLable.translatesAutoresizingMaskIntoConstraints = false
        return dateLable
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstrain()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupConstrain(){
        self.addSubview(contactImageView)
        NSLayoutConstraint.activate([
            contactImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            contactImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            contactImageView.heightAnchor.constraint(equalToConstant: 70),
            contactImageView.widthAnchor.constraint(equalToConstant: 70),
            contactImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
        ])
        self.addSubview(nameLable)
        NSLayoutConstraint.activate([
            nameLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            nameLable.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            nameLable.heightAnchor.constraint(equalToConstant: 20)
        ])
        self.addSubview(phoneLable)
        NSLayoutConstraint.activate([
            phoneLable.topAnchor.constraint(equalTo: self.nameLable.bottomAnchor, constant: 0),
            phoneLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            phoneLable.heightAnchor.constraint(equalToConstant: 20)
        ])
        self.addSubview(dateLable)
        NSLayoutConstraint.activate([
            dateLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            dateLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            dateLable.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

        
