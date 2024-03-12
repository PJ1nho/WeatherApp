import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let weatherDataView = WeatherDataView()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.backgroundVectors()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .backgroundColor
        view.addSubview(backgroundImageView)
        view.addSubview(weatherDataView)
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        weatherDataView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(310)
        }
    }
}

