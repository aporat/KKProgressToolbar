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

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	CGRect statusToolbarFrame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 44);
	self.statusToolbar = [[KKProgressToolbar alloc] initWithFrame:statusToolbarFrame];
	self.statusToolbar.actionDelegate = self;
	[self.view addSubview:self.statusToolbar];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissModalViewControllerAnimated:YES];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (IBAction)showInfo:(id)sender
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:controller animated:YES];
    } else {
        if (!self.flipsidePopoverController) {
            FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
            controller.delegate = self;
            
            self.flipsidePopoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
        }
        if ([self.flipsidePopoverController isPopoverVisible]) {
            [self.flipsidePopoverController dismissPopoverAnimated:YES];
        } else {
            [self.flipsidePopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        }
    }
}

- (void)didCancelButtonPressed:(KKProgressToolbar *)toolbar {
    [self stopUILoading];
}


- (IBAction)startUILoading  {
    
    [self showToolbar:YES];
    self.statusToolbar.statusLabel.text = @"Loading from server...";
}


- (IBAction)stopUILoading {
    [self showToolbar:NO];
    
}

- (void)showToolbar:(BOOL)show
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.4];
	if (show) {
		self.statusToolbar.stopButtonItem.enabled = YES;
		[self.statusToolbar.activityIndicator startAnimating];
	} else {
		[self.statusToolbar.activityIndicator stopAnimating];
	}
    
	CGRect statusToolbarFrame = CGRectMake(0, self.view.bounds.size.height - ((show) ? 44 : 0), self.view.bounds.size.width, 44);
	if (show) {
		self.statusToolbar.frame = statusToolbarFrame;
	} else {
		double delayInSeconds = 1.5;
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
			[UIView beginAnimations:nil context:nil];
			[UIView setAnimationDuration:0.4];
			self.statusToolbar.frame = statusToolbarFrame;
			[UIView commitAnimations];
		});
	}
	[UIView commitAnimations];
}


@end
