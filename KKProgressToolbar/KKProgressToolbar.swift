import UIKit
import GTProgressBar
import SnapKit

public protocol KKProgressToolbarDelegate: class {
    func didCancelButtonPressed(_ toolbar: KKProgressToolbar)
}

public final class KKProgressToolbar: UIView {
    
    fileprivate var didSetupConstraints = false
    
    // MARK: - Data
    weak public var actionDelegate: KKProgressToolbarDelegate?
    public var isShown = false
    
    public var text: String? {
        didSet {
            titleLabel.text = text
        }
    }
    
    // MARK: - UI Elements
    lazy fileprivate var stopButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "toolbar-stop"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didCancelButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - UI Elements
    lazy fileprivate var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.75
        
        return view
    }()
    
    lazy fileprivate var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 13)
        view.textColor = .white
        view.textAlignment = .center
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy public var progressBar: GTProgressBar = {
        let view = GTProgressBar()
        view.displayLabel = true
        view.font = UIFont.systemFont(ofSize: 13)
        view.labelTextColor = .white
        view.progressLabelInsetRight = 15
        view.barFillInset = 1
        
        return view
    }()
    
    // MARK: - UIView
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupSubviews()
    }
    
    override public func updateConstraints() {
        super.updateConstraints()
        
        if !didSetupConstraints {
            
            mainBackgroundView.snp.makeConstraints { make in
                make.edges.equalTo(self)
            }
            
            stopButton.snp.makeConstraints { make in
                make.centerY.equalTo(self)
                make.size.equalTo(25)
                make.trailing.equalTo(self).offset(-14)
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(self).offset(5)
                make.height.equalTo(16)
                make.centerX.equalTo(self)
            }
            
            progressBar.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(2)
                make.height.equalTo(12)
                make.leading.equalTo(self).offset(14)
                make.trailing.equalTo(stopButton.snp.leading).offset(-10)
            }
            
            didSetupConstraints = true
        }
    }
    
    fileprivate func setupSubviews() {
        addSubview(mainBackgroundView)
        addSubview(stopButton)
        addSubview(titleLabel)
        addSubview(progressBar)
        
        setNeedsUpdateConstraints()
    }
    
    public func show(_ animated: Bool, completion: (() -> Void)? = nil) {
        if !isShown {
            isShown = true
            
            stopButton.isEnabled = true
            
            if let superview = self.superview {
                self.frame = CGRect(x: 0, y: superview.bounds.size.height, width: superview.bounds.size.width, height: 55)
            }
            
            if animated {
                UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
                    if let superview = self.superview {
                        self.frame = CGRect(x: 0, y: superview.bounds.size.height - 55, width: superview.bounds.size.width, height: 55)
                    }
                }) { _ in
                    self.isHidden = false
                    completion?()
                }
            } else {
                if let superview = self.superview {
                    self.frame = CGRect(x: 0, y: superview.bounds.size.height - 55, width: superview.bounds.size.width, height: 55)
                    self.isHidden = false
                    completion?()
                }
            }
        } else {
            completion?()
        }
    }
    
    public func hide(_ animated: Bool, completion: (() -> Void)? = nil) {
        if isShown {
            isShown = false
            
            stopButton.isEnabled = false
            
            if animated {
                UIView.animate(withDuration: 0.4, delay: 1.0, options: [], animations: {
                    if let superview = self.superview {
                        self.frame = CGRect(x: 0, y: superview.bounds.size.height, width: superview.bounds.size.width, height: 55)
                    }
                }) { _ in
                    self.isHidden = true
                    completion?()
                }
            } else {
                if let superview = self.superview {
                    self.frame = CGRect(x: 0, y: superview.bounds.size.height, width: superview.bounds.size.width, height: 55)
                    self.isHidden = true
                    completion?()
                }
            }
        } else {
            completion?()
        }
    }
    
    @objc public func didCancelButtonPressed(_ sender: Any?) {
        actionDelegate?.didCancelButtonPressed(self)
    }
    
}
