//
//  GameInit.m
//  hedzUp
//
//  Created by Mus Bai on 03.08.14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameInit.h"

@implementation GameInit
{
    CCLabelTTF *_timerLabel;
    
    int seconds;
}


-(id)init {
    if ((self = [super init])) {
        [self schedule:@selector(fireTimer) interval:1];
        
        seconds = 5;
      
    }
    return self;
}


-(void) fireTimer
{
    if (seconds == 0)
    {
        [self unscheduleAllSelectors];
        CCScene *menuScene = [CCBReader loadAsScene:@"Game"];
        //[[CCDirector sharedDirector] replaceScene:menuScene];
        [[CCDirector sharedDirector] replaceScene:menuScene withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:0.3f]];
    }
        
    
    seconds--;
    [_timerLabel setString:[NSString stringWithFormat:@"%d", seconds]];
}

@end
