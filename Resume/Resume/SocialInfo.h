//
//  SocialInfo.h
//  Resume
//
//  Created by Ian MacLeod on 2/1/14.
//  Copyright (c) 2014 Jane Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocialInfo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) UIImage  *icon;

+ (NSArray *)allSocialInfo;

@end
