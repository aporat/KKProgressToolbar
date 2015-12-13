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

typedef void(^KKProgressToolbarCompletionHandler)(BOOL finished);

@class KKProgressToolbar;

@protocol KKProgressToolbarDelegate <NSObject>

@optional

/**
 * called when the user cancels the action
 */
- (void)didCancelButtonPressed:(KKProgressToolbar * _Nonnull)toolbar;

@end

@interface KKProgressToolbar : UIToolbar {
@private
  
  id <KKProgressToolbarDelegate> __weak _actionDelegate;
  
  UIBarButtonItem *_stopButtonItem;
  UIActivityIndicatorView *_activityIndicator;
  UILabel *_statusLabel;
  UIProgressView *_progressBar;
}

@property (nonatomic, strong, nullable) UIBarButtonItem *stopButtonItem;
@property (nonatomic, strong, nullable) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong, nullable) UILabel *titleLabel;
@property (nonatomic, strong, nullable) UIProgressView *progressBar;

@property (nonatomic, weak, nullable) id <KKProgressToolbarDelegate> actionDelegate;

- (void)show:(BOOL)animated completion:(void (^ _Nullable)(BOOL finished))completion;
- (void)hide:(BOOL)animated completion:(void (^ _Nullable)(BOOL finished))completion;

@end
