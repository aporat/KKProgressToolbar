//
// Copyright 2011-2012 Kosher Penguin LLC
// Created by Adar Porat (https://github.com/aporat) on 1/16/2012.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//		http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <UIKit/UIKit.h>

@class KKProgressToolbar;

@protocol KKProgressToolbarDelegate <NSObject>

@optional

/**
 * called when the user cancels the action
 */
- (void)didCancelButtonPressed:(KKProgressToolbar*)toolbar;

@end

@interface KKProgressToolbar : UIToolbar {
    @private
    
    // delegate which notified then the passcode is turned on/off
	id <KKProgressToolbarDelegate> __unsafe_unretained _actionDelegate;
    
    UIBarButtonItem* _stopButtonItem;
	UIActivityIndicatorView* _activityIndicator;
	UILabel* _statusLabel;
	UIProgressView* _progressBar;
}

@property (nonatomic, strong) UIBarButtonItem *stopButtonItem;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIProgressView *progressBar;

@property (nonatomic, unsafe_unretained) id <KKProgressToolbarDelegate> actionDelegate;

@end
