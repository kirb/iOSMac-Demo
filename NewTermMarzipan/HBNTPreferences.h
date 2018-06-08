//
//  HBNTPreferences.h
//  NewTerm
//
//  Created by Adam Demasi on 21/11/2015.
//  Copyright (c) 2015 HASHBANG Productions. All rights reserved.
//

@import Foundation;
//#import <Cephei/HBPreferences.h>

@class FontMetrics, VT100ColorMap;

@interface HBNTPreferences : NSObject

+ (instancetype)sharedInstance;

@property (strong, nonatomic, readonly) FontMetrics *fontMetrics;
@property (strong, nonatomic, readonly) VT100ColorMap *colorMap;

@end
