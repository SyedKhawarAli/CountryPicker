//
//  CountryPickerViewController.swift
//  
//
//  Created by Khawar Shah on 7.10.2022.
//

import UIKit

public protocol CountryPickerViewDelegate {
    /// Called when the user selects a country from the list.
    func countryPicker(_ countryPicker: CountryPicker, didSelectCountry country: Country)
}

public final class CountryPickerViewController: UIViewController {

    // MARK: - Outlets
    
    var countryPickerView = CountryPickerView()
    
    // MARK: - Instance variables
    
    var countriesData: [Country] = Utils.countries()
    var countriesSearchData: [Country] = Utils.countries()
    var onCountrySelection: ((Country)->())?
    var selectedCountry: Country?
    
    // MARK: - Override methods
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        updateSelectedCountry()
    }
    
    //MARK: - Private Methods
    
    private func setupViews(){
        view.addSubview(countryPickerView)
        countryPickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryPickerView.topAnchor.constraint(equalTo: view.topAnchor),
            countryPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countryPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countryPickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        countryPickerView.countryPickerTable.register(CountryPickerTableViewCell.self, forCellReuseIdentifier: String(describing: CountryPickerTableViewCell.self))
        countryPickerView.countryPickerTable.delegate = self
        countryPickerView.countryPickerTable.dataSource = self
        countryPickerView.searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)),
                                  for: .editingChanged)
    }
    
    private func updateSelectedCountry(){
        guard let selectedCountry = selectedCountry else { return }
        for (index, country) in countriesData.enumerated() {
            countriesData[index].isSelected = selectedCountry.isoCode == country.isoCode
        }
        countriesSearchData = countriesData
        countryPickerView.countryPickerTable.reloadData()
    }
    
    // MARK: - Actions
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        let searchText = textField.text!
        if searchText == "" {
            countriesSearchData = countriesData
        } else {
            countriesSearchData = countriesData.filter({ (result) -> Bool in
                return result.name.range(of: searchText, options: .caseInsensitive) != nil
            })
        }
        countryPickerView.countryPickerTable.reloadData()
    }
    
}

extension CountryPickerViewController: UITableViewDelegate, UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesSearchData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryPickerTableViewCell = tableView.dequeueReusableCell()
        cell.updateUIWith(country: countriesSearchData[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onCountrySelection?(countriesSearchData[indexPath.row])
        for (index, country) in countriesSearchData.enumerated() {
            countriesSearchData[index].isSelected = country.isoCode == countriesSearchData[indexPath.row].isoCode
        }
        tableView.reloadData()
        dismiss(animated: true)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

extension UITableView {
    ///usage: let cell: CustomTableViewCell = tableView.dequeueReusableCell()
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self)) as! T
    }
}
