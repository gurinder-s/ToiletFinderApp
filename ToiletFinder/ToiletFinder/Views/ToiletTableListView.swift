import UIKit

/// A custom view that displays a list of toilets in a table view.
class ToiletTableListView: UIView, UITableViewDelegate,UITableViewDataSource {
    
    // MARK: - Properties
    
    private let tableView: UITableView
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        super.init(frame: frame)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    /// Sets up and configures the table view.
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear // Make the table view's background transparent
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.cellLayoutMarginsFollowReadableWidth = false
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        addSubview(tableView)
        
        layoutTableView()
        registerCells()
    }
    
    /// Lays out the table view using Auto Layout constraints.
    private func layoutTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    /// Registers the cell types with the table view.
    private func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "toiletCell")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of toilets
        // This should ideally be replaced with a dynamic value, e.g., an array count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toiletCell", for: indexPath)
        // Configure the cell with toilet data
        cell.textLabel?.text = "Toilet \(indexPath.row)"
        cell.textLabel?.textAlignment = .left
        cell.separatorInset = .zero
        cell.layoutMargins = .zero
        return cell
    }
    
    // MARK: - UITableViewDelegate
    // Implement UITableViewDelegate methods as necessary...
}
