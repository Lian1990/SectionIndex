//
//  IndexAnimation.m
//  SectionIndex
//
//  Created by LIAN on 16/1/19.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import "IndexAnimation.h"

@implementation IndexAnimation

@synthesize indexArray =_indexArray;
@synthesize showLabel = _showLabel;

-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        _indexArray = [NSArray arrayWithArray:array];
        self.backgroundColor = [UIColor clearColor];
        
        _showLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 10)];
        _showLabel.textAlignment = NSTextAlignmentCenter;
        _showLabel.textColor = [UIColor orangeColor];
        _showLabel.layer.borderWidth = 1.0f;
        _showLabel.hidden = YES;
        _showLabel.layer.borderColor = [UIColor orangeColor].CGColor;
        [self addSubview:_showLabel];
    }
    return self;
}

-(void)moveIndex:(NSInteger )index withString:(NSString *)string
{
    _timeCount = 0;
    _showLabel.hidden = NO;
    float height = self.frame.size.height;
    float everyH;
    if (_indexArray.count >10 && _indexArray.count < 18) {
        everyH = 25;
    }
    else if (_indexArray.count < 11)
    {
        everyH = 30;
    }
    else {
        everyH = height / 27;
    }
    NSInteger count = _indexArray.count;
    CGRect frame = _showLabel.frame;
    frame.size.height = everyH;
    //偶数
    if (count %2 == 0) {
        if (index < count/2) {
            frame.origin.y = height/2 - (count/2 - index)*everyH;
        }
        else
        {
            frame.origin.y = height/2 + (index - count/2)*everyH;
        }
       
    }
    //奇数
    else
    {
        count -= 1;
        
        if (index < count/2) {
            frame.origin.y = (height-everyH)/2 - (count/2 - index)*everyH;
        }
        else if(index > count /2)
        {
            frame.origin.y = (height+everyH)/2 + (index - count/2)*everyH;
        }
        else if (index == count/2)
        {
            frame.origin.y = (height - everyH)/2;
        }
        
    }
    
    _showLabel.frame = frame;
    _showLabel.text = [NSString stringWithFormat:@"%@",string];
    if (!_timer) {
        _timer =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeGoing) userInfo:nil repeats:YES];
    }
    else
    {
        _timeCount = 0;
        [_timer invalidate];
        _timer =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeGoing) userInfo:nil repeats:YES];
    }
    

}
-(void)timeGoing
{
    _timeCount ++;
    if (_timeCount > 2) {
        [_timer invalidate];
        _timeCount = 0;
        _showLabel.hidden = YES;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
