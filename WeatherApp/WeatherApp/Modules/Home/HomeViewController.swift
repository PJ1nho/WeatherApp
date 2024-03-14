import UIKit
import SnapKit
import Alamofire

class HomeViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let weatherDataView = WeatherDataView()
    private let locationView = LocationView()
    
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
        makeRequest(city: "Moscow", apiKey: "a71d347f74fafa9fcd2c403639de58c0")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupGradientLayer()
        view.addSubviews([backgroundImageView, weatherImageView, locationView, weatherDataView])
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
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(200)
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
    }
    
    private func makeRequest(city: String, apiKey: String) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)", method: .get).responseDecodable(of: WeatherData.self) { [weak self] response in
            switch response.result {
            case .success(let success):
                self?.weatherDataView.configure(model: success)
                self?.locationView.configure(city: success.name)
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
}

