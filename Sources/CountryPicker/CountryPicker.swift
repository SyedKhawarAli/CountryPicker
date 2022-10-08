import UIKit
public struct CountryPicker {
    
    public var delegate: CountryPickerViewDelegate?
    
    public init() {
        
    }
    
    public func showCountriesList(from viewController: UIViewController, selectedCountry: Country?) {
        let countryViewController = CountryPickerViewController()
        countryViewController.selectedCountry = selectedCountry
        countryViewController.onCountrySelection = { country in
            delegate?.countryPicker(self, didSelectCountry: country)
        }
        if let viewController = viewController as? UINavigationController {
            viewController.pushViewController(countryViewController, animated: true)
        } else {
            let navigationVC = UINavigationController(rootViewController: countryViewController)
            viewController.modalPresentationStyle = .fullScreen
            viewController.present(navigationVC, animated: true)
        }
    }
}
