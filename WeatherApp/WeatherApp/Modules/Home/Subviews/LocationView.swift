import UIKit
import RswiftResources
import SnapKit

final class LocationView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var locationImageView: UIImageView = {
        let locationImageView = UIImageView()
        locationImageView.image = R.image.locationIcon()
        return locationImageView
    }()
    
    private lazy var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = R.font.overpassBold(size: 23)
        locationLabel.textColor = .white
        locationLabel.textAlignment = .left
        locationLabel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        locationLabel.layer.shadowRadius = 1.0
        locationLabel.layer.shadowOpacity = 1.0
        locationLabel.layer.shadowOffset = CGSize(width: -2, height: 2)
        locationLabel.layer.masksToBounds = false
        locationLabel.textAlignment = .center
        locationLabel.text = "Surabaya"
        return locationLabel
    }()
    
    private lazy var changeLocationButton: UIButton = {
        let changeLocationButton = UIButton()
        changeLocationButton.setImage(R.image.changeLocationIcon(), for: .normal)
        changeLocationButton.addTarget(self, action: #selector(changeLocationButtonTapped), for: .touchUpInside)
        return changeLocationButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func changeLocationButtonTapped() {
        
    }
    
    private func setupViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(locationImageView)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(changeLocationButton)
    }
    
    private func setupConstarints() {
        stackView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        locationImageView.snp.makeConstraints { make in
            make.width.equalTo(23)
        }
    }
}
