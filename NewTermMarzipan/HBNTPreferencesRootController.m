//
//  HBNTPreferencesRootController.m
//  NewTerm
//
//  Created by Adam Demasi on 30/10/2015.
//  Copyright (c) 2015 HASHBANG Productions. All rights reserved.
//

#import "HBNTPreferencesRootController.h"
//#import "../prefs/HBNTPreferencesRootListController.h"
//#import <Preferences/PSSpecifier.h>
//#include <objc/runtime.h>

@implementation HBNTPreferencesRootController

#pragma mark - UIViewController

- (void)loadView {
	[super loadView];

	self.title = @"Preferences!";
}

- (UIStatusBarStyle)preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}

@end
