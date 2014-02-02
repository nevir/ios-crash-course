//
//  SocialInfo.m
//  Resume
//
//  Created by Ian MacLeod on 2/1/14.
//  Copyright (c) 2014 Jane Developer. All rights reserved.
//

#import "SocialInfo.h"

@implementation SocialInfo

+ (SocialInfo *)socialInfoWithTitle:(NSString *)title iconNamed:(NSString *)iconName url:(NSString *)url
{
    SocialInfo *info = [self new];
    info.title = title;
    info.icon = [UIImage imageNamed:iconName];
    info.url = url;

    return info;
}

+ (NSArray *)allSocialInfo
{
    static NSArray *all;
    if (!all)
    {
        all = @[
                [self socialInfoWithTitle:@"Bēhance"
                                iconNamed:@"BehanceIcon"
                                      url:@"http://behance.net/janedev"],

                [self socialInfoWithTitle:@"DeviantArt"
                                iconNamed:@"DeviantArtIcon"
                                      url:@"http://janedeveloper.deviantart.com/"],

                [self socialInfoWithTitle:@"Dribble"
                                iconNamed:@"DribbleIcon"
                                      url:@"http://dribbble.com/janedev"],

                [self socialInfoWithTitle:@"Facebook"
                                iconNamed:@"FacebookIcon"
                                      url:@"http://facebook.com/jane.dev.75"],

                [self socialInfoWithTitle:@"GitHub"
                                iconNamed:@"GitHubIcon"
                                      url:@"http://github.com/janedev"],

                [self socialInfoWithTitle:@"Google+"
                                iconNamed:@"GooglePlusIcon"
                                      url:@"http://plus.google.com/107153662642475014992"],

                [self socialInfoWithTitle:@"LinkedIn"
                                iconNamed:@"LinkedInIcon"
                                      url:@"http://linkedin.com/pub/jane-developer/8b/343/b7a/"],
                
                [self socialInfoWithTitle:@"Twitter" 
                                iconNamed:@"TwitterIcon" 
                                      url:@"http://twitter.com/janedevv"],
                ];
    }

    return all;
}

@end
