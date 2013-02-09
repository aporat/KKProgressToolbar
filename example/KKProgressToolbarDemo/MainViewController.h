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

#import "KKProgressToolbar.h"

@interface MainViewController : UIViewController <KKProgressToolbarDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@property (strong, nonatomic) KKProgressToolbar *statusToolbar;

- (IBAction)startUILoading;
- (IBAction)stopUILoading;

@end
