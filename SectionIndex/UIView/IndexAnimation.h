//
//  IndexAnimation.h
//  SectionIndex
//
//  Created by LIAN on 16/1/19.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexAnimation : UIView
{
    NSInteger _timeCount;
    NSTimer  *_timer;
}

@property (strong,nonatomic) NSArray *indexArray;
@property (strong,nonatomic) UILabel *showLabel;



-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array;
-(void)moveIndex:(NSInteger )index withString:(NSString *)string;

@end
