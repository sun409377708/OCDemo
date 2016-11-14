//
//  JQVisitorView.h
//  SinaOCPractice
//
//  Created by maoge on 16/11/14.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VisitorLoginViewDelegate <NSObject>

@optional
- (void)visitorWillLogin;
- (void)visitorWillRegistor;

@end

@interface JQVisitorView : UIView

@property (nonatomic, weak) id<VisitorLoginViewDelegate> delegate;

- (void)loadVisitorViewWithImage:(NSString *)image andContent:(NSString *)content;

@end
