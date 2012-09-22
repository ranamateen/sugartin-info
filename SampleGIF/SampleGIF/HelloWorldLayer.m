//
//  HelloWorldLayer.m
//  SampleGIF
//
//  Created by Spark on 09/05/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)])   ) {
        
        // add all frames into cache
		CCSpriteFrameCache *frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [frameCache addSpriteFramesWithFile:@"CarAnimation.plist" 
                            textureFilename:@"CarAnimation.png"
         ];
        
        // add sprite-batch-node
        CCSpriteBatchNode *sbn = [CCSpriteBatchNode batchNodeWithFile:@"CarAnimation.png"];
        [self addChild:sbn];
        
        // add the sprite to center of screen.
        CCSprite *s = [CCSprite spriteWithSpriteFrameName:@"01.png"];
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        s.position=ccp(winSize.width/2,winSize.height/2); // center of the screen.
        [self addChild:s];
        
        // now code for applying action.
        NSMutableArray *ar=[NSMutableArray array];
        for (int i=0; i<20; i++) {
            NSString *strFrameName =[NSString stringWithFormat:@"%02i.png",i+1];
            CCSpriteFrame *frame = [frameCache spriteFrameByName:strFrameName];
            [ar addObject:frame];
        }
        
        // now create an animation using array of frames.
        CCAnimation *animation = [CCAnimation animationWithSpriteFrames:ar delay:0.2];
        
        // now create an animate-action using animation.
        CCAnimate *animate = [CCAnimate actionWithAnimation:animation];
        
        // now create infinity action using animate-action
        CCRepeatForever *repeatF = [CCRepeatForever actionWithAction:animate];
        
        // now apply this action to sprite.
        [s runAction:repeatF];
        
        // time to run. :)
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
