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

#import "KKProgressToolbar.h"

@interface KKProgressToolbar ()

@property(nonatomic, copy) KKProgressToolbarCompletionHandler showHandler;
@property(nonatomic, copy) KKProgressToolbarCompletionHandler hideHandler;

@end

@implementation KKProgressToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        UIBarButtonItem *activityIndicatorItem = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicator];
        
        self.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, 200, 20)];
        self.statusLabel.font = [UIFont boldSystemFontOfSize:14.0];
        self.statusLabel.backgroundColor = [UIColor clearColor];
        self.statusLabel.textColor = [UIColor whiteColor];
        self.statusLabel.shadowColor = [UIColor blackColor];
        self.statusLabel.shadowOffset = CGSizeMake(0, -1);
        self.statusLabel.textAlignment = UITextAlignmentCenter;
        
        self.progressBar = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 25, 200, 10)];
        
        UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        [statusView addSubview:self.statusLabel];
        [statusView addSubview:self.progressBar];
        
        UIBarButtonItem *statusItem = [[UIBarButtonItem alloc] initWithCustomView:statusView];
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        self.stopButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(didCancelButtonPressed:)];
        
        [self setBackgroundImage:nil
              forToolbarPosition:UIToolbarPositionAny
                      barMetrics:UIBarMetricsDefault];
        
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        self.translucent = YES;
        self.barStyle = UIBarStyleBlackTranslucent;
        self.items = @[activityIndicatorItem, flexSpace, statusItem, flexSpace, self.stopButtonItem];
        
    }
    return self;
}

- (void)show:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    self.showHandler = completion;
    
    self.stopButtonItem.enabled = YES;
    [self.activityIndicator startAnimating];

    [UIView animateWithDuration:0.4 animations:^{
        self.frame = CGRectMake(0, self.superview.bounds.size.height - 44, self.superview.bounds.size.width, 44);
    } completion:^(BOOL finished) {
        if (self.showHandler!=nil) {
            self.showHandler(YES);
        }
        self.showHandler = nil;
    }];
    
}

- (void)hide:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    self.hideHandler = completion;
    
    self.stopButtonItem.enabled = NO;
    [self.activityIndicator stopAnimating];
    
    [UIView animateWithDuration:0.4 delay:1.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.frame = CGRectMake(0, self.superview.bounds.size.height, self.superview.bounds.size.width, 44);
    } completion:^(BOOL finished) {
        if (self.hideHandler!=nil) {
            self.hideHandler(YES);
        }
        self.hideHandler = nil;
    }];
    
}

- (void)didCancelButtonPressed:(id*)sender {
    if ([_actionDelegate respondsToSelector:@selector(didCancelButtonPressed:)]) {
        [_actionDelegate performSelector:@selector(didCancelButtonPressed:) withObject:self];
    }
}



@end
