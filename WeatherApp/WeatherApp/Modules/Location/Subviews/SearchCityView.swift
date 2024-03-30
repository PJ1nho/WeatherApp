import UIKit

protocol SearchCityViewDelegate: AnyObject {
    func transferCityName(cityName: String)
}

final class SearchCityView: UIView {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Search here"
        textField.font = R.font.overpassRegular(size: 20)
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let searchButton = UIButton()
        searchButton.titleLabel?.font = R.font.overpassBold(size: 20)
        searchButton.setTitleColor(R.color.locationListTextColor(), for: .normal)
        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return searchButton
    }()
    
    weak var delegate: SearchCityViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 15
        addSubviews([textField, searchButton])
        setupConstraints()
    }
    
    private func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(15)
            make.trailing.equalTo(searchButton.snp.leading)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview().inset(15)
            make.width.equalTo(80)
        }
    }
    
    @objc private func searchButtonTapped() {
        guard let city = textField.text else { return }
        delegate?.transferCityName(cityName: city.replacingOccurrences(of: " ", with: ""))
        textField.text = ""
    }
}

extension SearchCityView: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let city = textField.text else { return false }
        delegate?.transferCityName(cityName: city.replacingOccurrences(of: " ", with: ""))
        textField.text = ""
        return true
    }
}
