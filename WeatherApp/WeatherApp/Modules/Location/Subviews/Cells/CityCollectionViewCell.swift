import UIKit
import RswiftResources

class CityCollectionViewCell: UICollectionViewCell {
    
    static let cityCellIdentifier = "CityCell"
    
    lazy var cityLabel: UILabel = {
        let cityLabel = UILabel()
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
        addSubview(cityLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview().inset(20)
        }
    }
    
    func fillCityLabel(city: String) {
        cityLabel.text = city
    }
    
}
