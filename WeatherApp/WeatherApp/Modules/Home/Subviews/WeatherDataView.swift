import UIKit
import SnapKit
import RswiftResources

final class WeatherDataView: UIView {
    
    // MARK: - Private properties
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = R.font.overpassRegular(size: 17)
        return dateLabel
    }()
    
    private lazy var degreesLabel: UILabel = {
        let degreesLabel = UILabel()
        degreesLabel.font = R.font.overpassRegular(size: 80)
        return degreesLabel
    }()
    
    private lazy var weatherTypeLabel: UILabel = {
        let weatherTypeLabel = UILabel()
        weatherTypeLabel.font = R.font.overpassBold(size: 22)
        weatherTypeLabel.text = "Cloudy"
        return weatherTypeLabel
    }()
    
    private lazy var windLabel: UILabel = {
        let windLabel = UILabel()
        windLabel.font = R.font.overpassRegular(size: 20)
        return windLabel
    }()
    
    private lazy var humLabel: UILabel = {
        let humLabel = UILabel()
        humLabel.font = R.font.overpassRegular(size: 20)
        return humLabel
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupLabelsShadow()
        setupViews()
        setupConstraints()
    }
    
    private func setupLabelsShadow() {
        [dateLabel, degreesLabel, weatherTypeLabel, windLabel, humLabel].forEach { label in
            label.textColor = .white
            label.textAlignment = .center
            label.layer.shadowColor = R.color.textShadow()?.cgColor
            label.layer.shadowRadius = 1.0
            label.layer.shadowOpacity = 1.0
            label.layer.shadowOffset = CGSize(width: -2, height: 2)
            label.layer.masksToBounds = false
        }
    }
    
    private func setupViews() {
        backgroundColor = R.color.weatherDataBackground()
        layer.borderWidth = 1.85
        layer.borderColor = R.color.weatherDataBorder()?.cgColor
        layer.cornerRadius = 30
        addSubviews([stackView])
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(degreesLabel)
        stackView.addArrangedSubview(weatherTypeLabel)
        stackView.addArrangedSubview(windLabel)
        stackView.addArrangedSubview(humLabel)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(25)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        degreesLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        weatherTypeLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        windLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        humLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
    }
    
    func configure(model: WeatherData) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        dateLabel.text = "Today, \(dateFormatter.string(from: date))"
        degreesLabel.text = "\(Int(model.main.temp - 270))°"
        windLabel.text = "Wind | \(model.wind.speed) km/h"
        humLabel.text = "Hum | \(model.main.humidity) %"
    }
}
