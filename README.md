# KKProgressToolbar

KKProgressToolbar is an iOS toolbar library

![](https://github.com/aporat/KKProgressToolbar/raw/master/screenshots/iphone-1.png) 
&nbsp;&nbsp;&nbsp;
![](https://github.com/aporat/KKProgressToolbar/raw/master/screenshots/ipad-1.png) 


## Requirements
* Xcode 4.5 or higher
* Apple LLVM compiler
* iOS 5.0 or higher
* ARC


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
platform :ios, '5.0'
pod 'KKProgressToolbar', :head
```

Install into your Xcode project:

``` bash
$ pod install
```

Add `#include "KKProgressToolbar.h"` to the top of classes that will use it.


## Example Usage

### Showing and Hiding the toolbar


``` objective-c

- (void)viewDidLoad
{
    [super viewDidLoad];

	CGRect statusToolbarFrame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 44);
	self.statusToolbar = [[KKProgressToolbar alloc] initWithFrame:statusToolbarFrame];
	self.statusToolbar.actionDelegate = self;
	[self.view addSubview:self.statusToolbar];
    
}

- (void)didCancelButtonPressed:(KKProgressToolbar *)toolbar {
    [self stopUILoading];
}


- (IBAction)startUILoading  {
    
    self.statusToolbar.statusLabel.text = @"Loading from server...";
    [self.statusToolbar show:YES completion:^(BOOL finished) {
        
    }];
    
}


- (IBAction)stopUILoading {
    [self.statusToolbar hide:YES completion:^(BOOL finished) {
        
    }];
```