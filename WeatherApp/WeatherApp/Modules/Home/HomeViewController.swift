import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupGradientLayer()
        setupViews()
        setupConstraints()
    }
    
    private func setupGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [
            UIColor(red: 0.416, green: 0.733, blue: 0.867, alpha: 1).cgColor,
            UIColor(red: 0.365, green: 0.573, blue: 0.957, alpha: 1).cgColor
        ]
        view.layer.addSublayer(gradient)
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(weatherImageView)
        view.addSubview(locationView)
        view.addSubview(weatherDataView)
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
}

