//
//  TVViewController.m
//  HDVideo
//
//  Created by handy wang on 3/31/14.
//  Copyright (c) 2014 handy wang. All rights reserved.
//

#import "TVViewController.h"
#import "HDMoviePlayerController.h"
#import "HDMovie.h"

static const CGFloat kWidthHeightRate = 16.0f/9.0f;

@interface TVViewController () {
    HDMoviePlayerController *_player;
}
@end

@implementation TVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HDMovie *movie = [[HDMovie alloc] init];
    movie.url = @"http://my.tv.sohu.com/ipad/66495107_4507574569273_98508318.m3u8?ch=my&cateCode=133104&plat=3&uid=95C014E5-1263-4F0B-931F-9C1291EEB2FB&pt=3&prod=app&pg=1";
    
    _player = [[HDMoviePlayerController alloc] init];
    CGFloat playerWidth = self.view.width;
    CGFloat playerHeight = 320.0f/kWidthHeightRate;
    _player.view.frame = CGRectMake(0, 0, playerWidth, playerHeight);
    [self.view addSubview:_player.view];
    
    [_player play:movie];
}

@end