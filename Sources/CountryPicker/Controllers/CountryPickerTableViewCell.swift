//
//  CountryPickerTableViewCell.swift
//  
//
//  Created by Khawar Shah on 8.10.2022.
//

import UIKit

class CountryPickerTableViewCell: UITableViewCell {
    let countryFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let countryNameWithPhoneCode: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let isSelectedImageView: UIImageView = {
        let imageView = UIImageView()
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "checkmark")
        } else {
            imageView.image = UIImage(named: "checkmark")
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Internal methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(containerView)
        containerView.addSubview(countryFlagImageView)
        containerView.addSubview(countryNameWithPhoneCode)
        containerView.addSubview(isSelectedImageView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            countryFlagImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            countryFlagImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            countryFlagImageView.heightAnchor.constraint(equalToConstant: 32),
            countryFlagImageView.widthAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            countryNameWithPhoneCode.leadingAnchor.constraint(equalTo: countryFlagImageView.trailingAnchor, constant: 8),
            countryNameWithPhoneCode.topAnchor.constraint(equalTo: containerView.topAnchor),
            countryNameWithPhoneCode.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            countryNameWithPhoneCode.trailingAnchor.constraint(equalTo: isSelectedImageView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            isSelectedImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            isSelectedImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            isSelectedImageView.widthAnchor.constraint(equalToConstant: 20),
            isSelectedImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func updateUIWith(country: Country) {
        countryFlagImageView.image = country.flag
        countryNameWithPhoneCode.text = "\(country.name) (+\(country.phoneCode))"
        isSelectedImageView.isHidden = !country.isSelected
        if #available(iOS 15.0, *) {
            containerView.layer.borderColor = country.isSelected ? UIColor.tintColor.cgColor : UIColor.lightGray.cgColor
        } else {
            containerView.layer.borderColor = country.isSelected ? UIColor.systemBlue.cgColor : UIColor.lightGray.cgColor
        }
    }
}
