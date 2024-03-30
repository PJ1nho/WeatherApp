import UIKit

protocol SearchCityViewDelegate: AnyObject {
    func transferCityName(city: String)
}

final class SearchCityView: UIView {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Search here"
        textField.font = R.font.overpassRegular(size: 20)
        return textField
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
        addSubview(textField)
        setupConstraints()
    }
    
    private func setupConstraints() {
        textField.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview().inset(15)
        }
    }
}

extension SearchCityView: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let city = textField.text else { return false }
        delegate?.transferCityName(city: city.replacingOccurrences(of: " ", with: ""))
        textField.text = ""
        return true
    }
}
