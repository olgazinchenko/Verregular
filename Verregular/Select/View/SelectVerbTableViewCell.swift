//
//  SelectVerbTableViewCell.swift
//  Verregular
//
//  Created by ozinchenko.dev on 16/03/2024.
//

import UIKit
import SnapKit

final class SelectVerbTableViewCell: UITableViewCell {
    enum State {
        case select, unselect
        
        var image: UIImage {
            switch self {
            case .select:
                return UIImage.checkmark
            case .unselect:
                return UIImage(systemName: "circlebadge") ?? UIImage.add
            }
        }
    }
    
    // MARK: - GUI Variables
    private lazy var checkboxImageView: UIImageView = {
        let view = UIImageView()
        
        view.image = State.unselect.image
        view.contentMode = .center
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .center
        view.spacing = 5
        
        return view
    }()
    
    private lazy var infinitiveView: UIView = UIView()
    
    private lazy var infinitiveLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var transtationLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var pastLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var participleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - Initialization
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, 
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    // MARK: - Methods
    func configure(with verb: Verb, isSelected: Bool) {
        infinitiveLabel.text = verb.infinitive
        transtationLabel.text = verb.translation
        pastLabel.text = verb.pastSimple
        participleLabel.text = verb.participle
        
        checkboxImageView.image = isSelected ? State.select.image : State.unselect.image
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        selectionStyle = .none
        
        infinitiveView.addSubviews([infinitiveLabel, transtationLabel])
        stackView.addArrangedSubviews([infinitiveView, pastLabel, participleLabel])
        addSubviews([checkboxImageView, stackView])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        checkboxImageView.snp.makeConstraints{make in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        infinitiveLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        transtationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(infinitiveLabel.snp.bottom).offset(0)
        }
        
        infinitiveView.snp.makeConstraints { make in
            make.height.equalTo(69)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(checkboxImageView.snp.trailing).offset(5)
            make.top.bottom.right.equalToSuperview()
        }
    }
}
