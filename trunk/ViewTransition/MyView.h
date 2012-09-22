//
//  MyView.h
//  ViewTransition
//
//  Created by Sagar R. Kothari on 09-04-28.
//  Copyright 2009 http://sugartin.info. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyView : UIViewController {
	IBOutlet UIView *placeholder, *view1, *view2;
	bool view1OnTop;
}
-(IBAction)transitionCurl:(id)sender;
-(IBAction)transitionFlip:(id)sender;
-(IBAction)transitionFade;
-(IBAction)transitionFlip2;

@end
