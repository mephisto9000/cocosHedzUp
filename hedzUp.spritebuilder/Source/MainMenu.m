//
//  MainMenu.m
//  hedzUp
//
//  Created by Mus Bai on 03.08.14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "MainMenu.h"

@implementation MainMenu

-(void) startGamePressed
{
    CCLOG(@"startGame pressed");
    
    CCScene *menuScene = [CCBReader loadAsScene:@"GameInit"];
    //[[CCDirector sharedDirector] replaceScene:menuScene];
    [[CCDirector sharedDirector] replaceScene:menuScene withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:0.3f]];
}


-(void) settingsPressed
{
    CCLOG(@"settings pressed");
    
}

-(void) infoPressed
{
    CCLOG(@"info pressed");
}

-(void) howToPlayPressed
{
    CCLOG(@"how to play pressed");
}

-(void) feedbackPressed
{
    CCLOG(@"feedback pressed");
}

-(void) setTheCardPressed
{
    CCLOG(@"setTheCard pressed");
}

@end
