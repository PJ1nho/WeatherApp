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
        dateLabel.text = "Today, 12 September"
        return dateLabel
    }()
    
    private lazy var degreesLabel: UILabel = {
        let degreesLabel = UILabel()
        degreesLabel.font = R.font.overpassRegular(size: 80)
        degreesLabel.text = "29°"
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
        windLabel.text = "Wind | 10 km/h"
        return windLabel
    }()
    
    private lazy var humLabel: UILabel = {
        let humLabel = UILabel()
        humLabel.font = R.font.overpassRegular(size: 20)
        humLabel.text = "Hum | 54 %"
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
            label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
            label.layer.shadowRadius = 1.0
            label.layer.shadowOpacity = 1.0
            label.layer.shadowOffset = CGSize(width: -2, height: 2)
            label.layer.masksToBounds = false
        }
    }
    
    private func setupViews() {
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        layer.borderWidth = 1.85
        layer.borderColor = UIColor(red: 0.753, green: 0.827, blue: 0.89, alpha: 1).cgColor
        layer.cornerRadius = 30
        addSubview(stackView)
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
}
