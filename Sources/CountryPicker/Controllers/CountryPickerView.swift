//
//  CountryPickerView.swift
//  
//
//  Created by Khawar Shah on 7.10.2022.
//

import UIKit

class CountryPickerView: UIView {
    
    let chooseCoutryLabel: UILabel = {
        let label  = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Chose your country"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let searchView: UIView = {
        let view  = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.1).cgColor
        view.backgroundColor = .lightGray.withAlphaComponent(0.1)
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let searchImageView: UIImageView = {
        let imageView  = UIImageView()
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "magnifyingglass")
        } else {
            // Fallback on earlier versions
        }
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let searchTextField: UITextField = {
        let textField  = UITextField()
        textField.placeholder = "Search"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let countryPickerTable: UITableView = {
        let tableVew  = UITableView()
        tableVew.separatorStyle = .none
        tableVew.translatesAutoresizingMaskIntoConstraints = false
        return tableVew
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
        setupViews()
    }
    
    func setupViews(){
        addSubview(chooseCoutryLabel)
        addSubview(searchView)
        searchView.addSubview(searchImageView)
        searchView.addSubview(searchTextField)
        addSubview(countryPickerTable)
        
        NSLayoutConstraint.activate([
            chooseCoutryLabel.topAnchor.constraint(equalTo: topAnchor),
            chooseCoutryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            chooseCoutryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            chooseCoutryLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: chooseCoutryLabel.bottomAnchor, constant: 16),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            searchView.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            searchImageView.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 8),
            searchImageView.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchImageView.widthAnchor.constraint(equalToConstant: 32),
            searchImageView.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: searchView.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 8),
            searchTextField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: searchView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            countryPickerTable.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 16),
            countryPickerTable.leadingAnchor.constraint(equalTo: leadingAnchor),
            countryPickerTable.trailingAnchor.constraint(equalTo: trailingAnchor),
            countryPickerTable.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
