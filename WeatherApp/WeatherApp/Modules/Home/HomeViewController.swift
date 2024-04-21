import UIKit
import SnapKit
import Alamofire

final class HomeViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let weatherDataView = WeatherDataView()
    private let locationView = LocationView()
    private let locationVC = LocationListViewController()
    private let daysCollectionView = DaysCollectionView()
    private let lastCity = UserDefaults.standard.string(forKey: "lastCity")
    private let dateFormatter = DateFormatter()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.backgroundVectors()
        return imageView
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let weatherImageView = UIImageView()
        weatherImageView.image = R.image.weatherIcon()
        weatherImageView.contentMode = .scaleAspectFit
        return weatherImageView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchStartWeather()
        locationView.delegate = self
        locationVC.delegate = self
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupGradientLayer()
        view.addSubviews([backgroundImageView, weatherImageView, locationView, weatherDataView, daysCollectionView])
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
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        locationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(25)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(23)
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.top.equalTo(locationView.snp.bottom).inset(-30)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }
        
        weatherDataView.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(310)
        }
        
        daysCollectionView.snp.makeConstraints { make in
            make.top.equalTo(weatherDataView.snp.bottom).inset(-20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    private func fetchWeather(city: String) {
        NetworkService.shared.fetchWeather(city: city) { [weak self] result in
            switch result {
            case .success(let weatherData):
                self?.weatherDataView.configure(model: weatherData)
                self?.locationView.configure(city: weatherData.name)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchWeatherDays(city: String) {
        NetworkService.shared.fetchWeatherDay(city: city) { [weak self] result in
            switch result {
            case .success(let list):
                self?.daysCollectionView.configure(days: list.list.map {
                    DailyModel(date: self?.setupDate(date: $0.dateText) ?? "", 
                               time: self?.setupTime(date: $0.dateText) ?? "",
                               temp: "\(Int($0.main.temp) - 270)")
                })
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func saveLastCity(city: String) {
        UserDefaults.standard.setValue(city, forKey: "lastCity")
    }
    
    private func fetchStartWeather() {
        if let lastCity {
            fetchWeather(city: lastCity)
            fetchWeatherDays(city: lastCity)
        } else {
            fetchWeather(city: "Moscow")
            fetchWeatherDays(city: "Moscow")
        }
    }
    
    private func setupDate(date: String) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: date) else { return "" }
        dateFormatter.dateFormat = "dd.MM.yy"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    private func setupTime(date: String) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: date) else { return "" }
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: date)
        return timeString
    }
}

extension HomeViewController: LocationViewDelegate {
    func changeLocationButtonTapped() {
        present(locationVC, animated: true)
    }
}

extension HomeViewController: LocationListViewControllerDelegate {
    func transferCityName(city: String) {
        fetchWeather(city: city)
        fetchWeatherDays(city: city)
        saveLastCity(city: city)
    }
}
