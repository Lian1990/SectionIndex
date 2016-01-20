//
//  ViewController.m
//  SectionIndex
//
//  Created by LIAN on 16/1/18.
//  Copyright (c) 2016年 com.Alice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize table = _table;
@synthesize dataArr = _dataArr;
@synthesize hearderDic = _hearderDic;
@synthesize keysArr = _keysArr;
@synthesize contentArr = _contentArr;
@synthesize iAnimation = _iAnimation;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _keysArr = [[NSArray alloc]init];
    _hearderDic = [[NSMutableDictionary alloc]init];
    _contentArr = [[NSMutableArray alloc]init];
    
    _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.sectionIndexColor = [UIColor redColor];//索引颜色
//    _table.sectionIndexBackgroundColor = [UIColor grayColor];//索引栏背景色
//    _table.sectionIndexTrackingBackgroundColor = [UIColor greenColor];//点击索引栏的颜色
    [self.view addSubview:_table];
    [self initData];
    
}
-(void)initData
{
    _dataArr = [NSArray arrayWithObjects:@"ass",@"cede",@"cefrfrfgt",@"dede",@"tiani",@"qihinn",@"add",@"bdx",@"dedefrft",@"defrefsfth",@"errf",@"yyyh",@"frftgyy", nil];
    //内容排序
    NSArray *resultArr = [_dataArr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    NSLog(@"=== resultArr %@",resultArr);
    
    //获取首字母索引
    NSString *key = @"";
    for (int i = 0; i < [resultArr count] ; i ++) {
        NSString *everyData = [resultArr objectAtIndex:i];
        NSString *everyFirst = [[everyData substringToIndex:1]uppercaseString];
        
        if ([key compare:everyFirst] == NSOrderedSame ) {
            [_contentArr addObject:everyData];
        }
        else
        {
            key = everyFirst;
            NSLog(@"--------首字母 %@",everyFirst);
            _contentArr = [[NSMutableArray alloc]init];
            [_contentArr addObject:everyData];
            [_hearderDic setObject:_contentArr forKey:key];
            NSLog(@"+++++++++++ _contentArr= %@",_contentArr);
        }
    }
    
    // --- 字典的key是无序的,要进行排序操作
    NSArray *keys = [_hearderDic allKeys];
    NSLog(@"排序前 is keys == %@",keys);
    
    NSArray *reArr = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2)
                      {
                          return [obj1 compare:obj2 options:NSNumericSearch];
                      }];
    
    _keysArr = [NSArray arrayWithArray:reArr];
    NSLog(@"排序后的 keys is %@",_keysArr);
    
    [_table reloadData];
    _iAnimation = [[IndexAnimation alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width -80, 30, 30, [UIScreen mainScreen].bounds.size.height - 60) withArray:_keysArr];
    [self.view addSubview:_iAnimation];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    NSArray *arr = [_hearderDic valueForKey:[_keysArr objectAtIndex:indexPath.section]];
    cell.textLabel.text = [arr objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [_hearderDic valueForKey:[_keysArr objectAtIndex:section]];
    return arr.count;
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    
    [_iAnimation moveIndex:index withString:title];
    return index;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    NSArray *keys = [_hearderDic allKeys];
//    return keys.count;
    return _hearderDic.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_keysArr objectAtIndex:section];
}
/**
 *  右侧索引
 */
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keysArr;
}

//==========
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
