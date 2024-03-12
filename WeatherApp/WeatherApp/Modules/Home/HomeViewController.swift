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

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        weatherDataView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(310)
        }
    }
}

