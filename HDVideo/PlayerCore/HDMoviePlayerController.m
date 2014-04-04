//
//  HDMoviePlayerController.m
//  HDVideo
//
//  Created by handy wang on 3/31/14.
//  Copyright (c) 2014 handy wang. All rights reserved.
//

#import "HDMoviePlayerController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "HDMovie.h"

@interface HDMoviePlayerController () {
    HDMovie *_currentMovie;
    MPMoviePlayerController *_player;
}
@end

@implementation HDMoviePlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[self playerView]];
}

#pragma mark - Public
- (void)play:(HDMovie *)movie {
    if (movie.url.length <= 0) {
        NSLog(@"Invalid movie with nil url.");
        return;
    }
    
    if (![_currentMovie.url isEqualToString:movie.url]) {
        _currentMovie = movie;
        _player.contentURL = nil;
        _player.movieSourceType = MPMovieSourceTypeStreaming;
        _player.contentURL = [NSURL URLWithString:_currentMovie.url];
        [_player play];
        NSLog(@"Preparing play video from %@", movie.url);
    }
}

#pragma mark - Private
- (UIView *)playerView {
    if (!_player) {
        _player = [[MPMoviePlayerController alloc] init];
        _player.view.userInteractionEnabled = NO;
        _player.shouldAutoplay = NO;
        _player.controlStyle = MPMovieControlStyleNone;
        _player.view.frame = self.view.bounds;
        _player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _player.view.clipsToBounds = YES;
        [self.view addSubview:_player.view];
    }
    return _player.view;
}
@end
