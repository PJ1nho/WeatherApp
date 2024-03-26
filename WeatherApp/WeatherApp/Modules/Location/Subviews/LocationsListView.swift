import UIKit

final class LocationsListView: UIView {
    
    private var cityItems = [String]()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.layer.cornerRadius = 20
        collectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: CityCollectionViewCell.cityCellIdentifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(collectionView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    func fillCityItems(cities: [String]) {
        cityItems = cities
        collectionView.reloadData()
    }
}

extension LocationsListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cityItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cityCell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.cityCellIdentifier, for: indexPath) as? CityCollectionViewCell
        cityCell?.backgroundColor = .white
        cityCell?.layer.cornerRadius = 20
        cityCell?.layer.borderWidth = 1
        cityCell?.layer.borderColor = R.color.locationListTextColor()?.cgColor
        cityCell?.cityLabel.textColor = R.color.locationListTextColor()
        cityCell?.fillCityLabel(city: cityItems[indexPath.row])
        return cityCell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 70)
    }
}
