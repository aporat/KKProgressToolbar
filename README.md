# KKProgressToolbar

KKProgressToolbar is an iOS toolbar library

[![Build Status](https://github.com/aporat/KKProgressToolbar/workflows/Tests/badge.svg)](https://github.com/aporat/KKProgressToolbar/actions)
[![Cocoapods](https://img.shields.io/cocoapods/v/KKProgressToolbar.svg)](https://cocoapods.org/pods/SwifterSwift)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-11.4-blue.svg)](https://developer.apple.com/xcode)
[![MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)

![](https://github.com/aporat/KKProgressToolbar/raw/master/screenshots/iphone-1.png) 
&nbsp;&nbsp;&nbsp;
![](https://github.com/aporat/KKProgressToolbar/raw/master/screenshots/ipad-1.png) 


## Demo

build and run the `KKProgressToolbarExample` project in Xcode to see `KKProgressToolbar` in action.

## Installation

The recommended approach for installing SocialAccounts is via the [CocoaPods](http://cocoapods.org/) package manager, as it provides flexible dependency management and dead simple installation.

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Edit your Podfile and add `KKProgressToolbar`:

``` bash
$ edit Podfile
platform :ios, '12.0'

pod 'KKProgressToolbar'
```

Install into your Xcode project:

``` bash
$ pod install
```

Add `import KKProgressToolbar"` to the top of classes that will use it.


## Example Usage

### Showing and Hiding the toolbar


``` swift

class ViewController: UIViewController {
    
    lazy fileprivate var loadingToolbar: KKProgressToolbar = {
        let view = KKProgressToolbar()
        view.progressBar.barBorderColor = .black
        view.progressBar.barBackgroundColor = .black
        view.progressBar.barBorderWidth = 1
        view.progressBar.barFillColor = .white
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingToolbar.actionDelegate = self
        loadingToolbar.frame = CGRect(x: 0, y: view.bounds.size.height, width: view.bounds.size.width, height: 55)
        view.addSubview(loadingToolbar)
        
    }
    
    @IBAction func showToolbar(_ sender: Any) {
        loadingToolbar.show(true, completion: nil)
        loadingToolbar.text = NSLocalizedString("Loading...", comment: "")
        loadingToolbar.progressBar.progress = 0.5
    }
    
    @IBAction func hideToolbar(_ sender: Any) {
        loadingToolbar.hide(true, completion: nil)
    }
}

// MARK: - KKProgressToolbarDelegate
extension ViewController: KKProgressToolbarDelegate {
    func didCancelButtonPressed(_ toolbar: KKProgressToolbar) {
        
    }
}

```
