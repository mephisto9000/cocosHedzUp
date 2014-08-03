//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene


-(id)init {
    if ((self = [super init])) {
        
        [self scheduleOnce:@selector(play) delay:3];

    }
    return self;
}


-(void) play {
    //CCLOG(@"play button pressed");
    
    CCScene *menuScene = [CCBReader loadAsScene:@"MainMenu"];
    //[[CCDirector sharedDirector] replaceScene:menuScene];
    
    //CCTransitionDirectionRight
    [[CCDirector sharedDirector] replaceScene:menuScene withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:0.3f]];
    //[[CCDirector sharedDirector] replaceScene: [CCShrinkGrowTransition transitionWithDuration:0.5 scene: menuScene]];
}



@end
