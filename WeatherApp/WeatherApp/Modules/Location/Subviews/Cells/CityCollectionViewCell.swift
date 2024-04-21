import UIKit
import RswiftResources

protocol CityCollectionViewCellDelegate: AnyObject {
    func transferCellIndex(index: Int?)
}

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
    
    private lazy var deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        deleteButton.tintColor = R.color.locationListTextColor()
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return deleteButton
    }()
    
    weak var delegate: CityCollectionViewCellDelegate?
    var index: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubviews([imageView, cityLabel, deleteButton])
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
            make.top.bottom.equalToSuperview().inset(20)
            make.trailing.equalTo(deleteButton.snp.leading).inset(-15)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
    }
    
    func configure(city: String) {
        cityLabel.text = city
    }
    
    func getCityName() -> String? {
        guard let cityName = cityLabel.text else { return nil }
        return cityName
    }
    
    @objc private func deleteButtonTapped() {
        delegate?.transferCellIndex(index: index)
    }
}
