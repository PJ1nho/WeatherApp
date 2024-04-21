import UIKit

final class DaysCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Static Properties
    
    static let daysCellIdentifier = "daysCellIdentifier"
    
    // MARK: - Private Properties
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = R.font.overpassRegular(size: 13)
        return dateLabel
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = R.font.overpassRegular(size: 13)
        return timeLabel
    }()
    
    private lazy var tempLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.font = R.font.overpassBold(size: 17)
        return tempLabel
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabelsShadow()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupLabelsShadow() {
        [dateLabel, timeLabel, tempLabel].forEach { label in
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
        addSubview(stackView)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(tempLabel)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview().inset(15)
        }
    }
    
    // MARK: - Public Methods
    
    func configure(model: DailyModel) {
        dateLabel.text = model.date
        timeLabel.text = model.time
        tempLabel.text = model.temp + "°"
    }
}
