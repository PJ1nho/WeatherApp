import UIKit

protocol LocationListViewControllerDelegate: AnyObject {
    func transferCityName(city: String)
}

final class LocationListViewController: UIViewController {
    
    private let searchCityView = SearchCityView()
    private let locationListView = LocationsListView()
    
    weak var delegate: LocationListViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        searchCityView.delegate = self
    }
    
    private func setupUI() {
        setupGradientLayer()
        view.addSubview(searchCityView)
        view.addSubview(locationListView)
        setupConstraints()
    }
    
    private func setupGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        guard let firstColor = R.color.gradientFirst()?.cgColor,
              let secondColor = R.color.gradientSecond()?.cgColor else { return }
        gradient.colors = [firstColor, secondColor]
        view.layer.addSublayer(gradient)
    }
    
    private func setupConstraints() {
        searchCityView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(15)
            make.height.equalTo(50)
        }
        
        locationListView.snp.makeConstraints { make in
            make.top.equalTo(searchCityView.snp.bottom).inset(-15)
            make.leading.trailing.bottom.equalToSuperview().inset(15)
        }
    }
}

extension LocationListViewController: SearchCityViewDelegate {
    func transferCityName(city: String) {
        delegate?.transferCityName(city: city)
        dismiss(animated: true)
    }
}
