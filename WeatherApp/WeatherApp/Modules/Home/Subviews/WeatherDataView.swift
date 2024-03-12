import UIKit
import SnapKit
import RswiftResources

final class WeatherDataView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = R.font.overpassRegular(size: 17)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .center
        dateLabel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        dateLabel.layer.shadowRadius = 1.0
        dateLabel.layer.shadowOpacity = 1.0
        dateLabel.layer.shadowOffset = CGSize(width: -2, height: 2)
        dateLabel.layer.masksToBounds = false
        dateLabel.text = "Today, 12 September"
        return dateLabel
    }()
    
    private lazy var degreesLabel: UILabel = {
        let degreesLabel = UILabel()
        degreesLabel.font = R.font.overpassRegular(size: 93)
        degreesLabel.textColor = .white
        degreesLabel.textAlignment = .center
        degreesLabel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        degreesLabel.layer.shadowRadius = 7.0
        degreesLabel.layer.shadowOpacity = 4.0
        degreesLabel.layer.shadowOffset = CGSize(width: -5, height: 7)
        degreesLabel.layer.masksToBounds = false
        degreesLabel.text = "29°"
        return degreesLabel
    }()
    
    private lazy var weatherTypeLabel: UILabel = {
        let weatherTypeLabel = UILabel()
        weatherTypeLabel.font = R.font.overpassBold(size: 22)
        weatherTypeLabel.textColor = .white
        weatherTypeLabel.textAlignment = .center
        weatherTypeLabel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        weatherTypeLabel.layer.shadowRadius = 1.0
        weatherTypeLabel.layer.shadowOpacity = 1.0
        weatherTypeLabel.layer.shadowOffset = CGSize(width: -2, height: 2)
        weatherTypeLabel.layer.masksToBounds = false
        weatherTypeLabel.text = "Cloudy"
        return weatherTypeLabel
    }()
    
    private lazy var windLabel: UILabel = {
        let windLabel = UILabel()
        windLabel.font = R.font.overpassRegular(size: 20)
        windLabel.textColor = .white
        windLabel.textAlignment = .center
        windLabel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        windLabel.layer.shadowRadius = 1.0
        windLabel.layer.shadowOpacity = 1.0
        windLabel.layer.shadowOffset = CGSize(width: -2, height: 2)
        windLabel.layer.masksToBounds = false
        windLabel.text = "Wind | 10 km/h"
        return windLabel
    }()
    
    private lazy var humLabel: UILabel = {
        let humLabel = UILabel()
        humLabel.font = R.font.overpassRegular(size: 20)
        humLabel.textColor = .white
        humLabel.textAlignment = .center
        humLabel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        humLabel.layer.shadowRadius = 1.0
        humLabel.layer.shadowOpacity = 1.0
        humLabel.layer.shadowOffset = CGSize(width: -2, height: 2)
        humLabel.layer.masksToBounds = false
        humLabel.text = "Hum | 54 %"
        return humLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
