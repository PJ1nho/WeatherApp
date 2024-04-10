import UIKit

final class DaysCollectionView: UIView {
    
    // MARK: - Public Properties
    
    private var daysCollectionViewItems = [DailyModel]()

    private lazy var daysCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let daysCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        daysCollectionView.delegate = self
        daysCollectionView.dataSource = self
        daysCollectionView.register(DaysCollectionViewCell.self, forCellWithReuseIdentifier: DaysCollectionViewCell.daysCellIdentifier)
        daysCollectionView.backgroundColor = .clear
        daysCollectionView.showsHorizontalScrollIndicator = false
        return daysCollectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        backgroundColor = .clear
        addSubview(daysCollectionView)
    }
    
    private func setupConstraints() {
        daysCollectionView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Public Methods
    
    func configure(days: [DailyModel]) {
        daysCollectionViewItems = days
        daysCollectionView.reloadData()
    }
}

    // MARK: - UICollectionViewDelegate&UICollectionViewDataSource&UICollectionViewDelegateFlowLayout

extension DaysCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        daysCollectionViewItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let daysCell = collectionView.dequeueReusableCell(withReuseIdentifier: DaysCollectionViewCell.daysCellIdentifier, for: indexPath) as? DaysCollectionViewCell
        daysCell?.layer.cornerRadius = 20
        daysCell?.layer.borderWidth = 1
        daysCell?.layer.borderColor = R.color.weatherDataBorder()?.cgColor
        daysCell?.configure(model: daysCollectionViewItems[indexPath.row])
        return daysCell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
