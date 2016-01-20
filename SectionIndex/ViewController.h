//
//  ViewController.h
//  SectionIndex
//
//  Created by LIAN on 16/1/18.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IndexAnimation.h"

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray *dataArr;
@property (strong,nonatomic) NSArray *keysArr;
@property (strong,nonatomic) NSMutableArray *contentArr;
@property (strong,nonatomic) NSMutableDictionary *hearderDic;

@property (strong,nonatomic) IndexAnimation *iAnimation;

@end

