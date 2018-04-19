//
//  JKLockView.h
//  LockView
//
//  Created by James on 2018/4/19.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKLockView;
@protocol JKLockViewDelegate <NSObject>
@optional
-(void)lockView:(JKLockView *)lockView didFinishPath:(NSString *)path;
@end
@interface JKLockView : UIView
@property(nonatomic,assign)IBOutlet id<JKLockViewDelegate> delegate;
@end
