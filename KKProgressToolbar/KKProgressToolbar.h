//
// Copyright 2011-2012 Adar Porat (https://github.com/aporat)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <UIKit/UIKit.h>

typedef void(^KKProgressToolbarCompletionHandler)(BOOL success);

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
    
	id <KKProgressToolbarDelegate> __weak _actionDelegate;
    
    UIBarButtonItem* _stopButtonItem;
	UIActivityIndicatorView* _activityIndicator;
	UILabel* _statusLabel;
	UIProgressView* _progressBar;
}

@property (nonatomic, strong) UIBarButtonItem *stopButtonItem;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIProgressView *progressBar;

@property (nonatomic, weak) id <KKProgressToolbarDelegate> actionDelegate;

- (void)show:(BOOL)animated completion:(void (^)(BOOL finished))completion;
- (void)hide:(BOOL)animated completion:(void (^)(BOOL finished))completion;

@end
