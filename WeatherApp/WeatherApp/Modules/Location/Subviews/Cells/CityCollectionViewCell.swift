import UIKit
import RswiftResources

class CityCollectionViewCell: UICollectionViewCell {
    
    static let cityCellIdentifier = "CityCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.lastLocation()
        return imageView
    }()
    
    private lazy var cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.textColor = R.color.locationListTextColor()
        cityLabel.font = R.font.overpassBold(size: 17)
        return cityLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubviews([imageView, cityLabel])
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).inset(-15)
            make.top.trailing.bottom.equalToSuperview().inset(20)
        }
    }
    
    func configure(city: String) {
        cityLabel.text = city
    }
    
    func getCityName() -> String? {
        guard let cityName = cityLabel.text else { return nil }
        return cityName
    }
}