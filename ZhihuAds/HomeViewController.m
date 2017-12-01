//
//  HomeViewController.m
//  test2
//
//  Created by 柳麟喆 on 2017/11/30.
//  Copyright © 2017年 lzLiu. All rights reserved.
//

#import "HomeViewController.h"
#import "NewsTableViewCell.h"
#import "AdsTableViewCell.h"
#import "ContentViewController.h"

#define LLZRGBA(r, g, b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableview;

@end

@implementation HomeViewController{
    NSArray *themes;//话题
    NSArray *titles;//标题
    NSArray *contents;//内容
    NSArray *types;//类型【1代表正文，0代表广告】
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"仿知乎广告植入";
    //加载数据
    [self loadData];
    [self.view addSubview:self.tableview];
}
#pragma mark - *******加载数据*******
- (void)loadData{
    themes=@[@"教育",@"游戏",@"电脑",@"计算机",@"程序设计",@"广告",@"设计",@"装修",@"法律",@"iOS",@"android"];
    titles=@[@"如何教育？",@"有哪些好玩的游戏？",@"大一新生该买什么电脑？",@"计算机专业如何？",@"程序设计难吗？",@"荒野行动强势来袭",@"如何设计自己的卧室？",@"装修的一些小技巧",@"学法律难吗？",@"iOS入门难吗？",@"android11111111?"];
    contents=@[@"教育哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"有哪些好玩的游戏哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"买个球",@"难爆了",@"程序设计难吗？哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"荒野行动强势来袭",@"如何设计自己的卧室？请设计师过来帮你设计哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"装修的一些小技巧不懂哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"学法律难吗？哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"iOS入门难吗？哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"];
    types=@[@1,@1,@1,@1,@1,@0,@1,@1,@1,@1,@1];
}
#pragma mark - *******懒加载*******
-(UITableView *)tableview
{
    if(_tableview==nil)
    {
        _tableview=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        _tableview.backgroundColor=[UIColor whiteColor];
        //cell高度随内容自适应
        _tableview.estimatedRowHeight=100;//估算内容高度
        _tableview.rowHeight=UITableViewAutomaticDimension;
    }
    return _tableview;
}

#pragma mark - *******tableViewDelegate*******
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return themes.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 0)];
    return footerView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 0)];
    headerView.backgroundColor=LLZRGBA(240, 240, 240, 1.0);
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    初始化cell并指定其类型，也可自定义cell
    static NSString *newsID = @"NewsTableViewCell";
    NewsTableViewCell *cell = (NewsTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:newsID];
    static NSString *adsID = @"AdsTableViewCell";
    AdsTableViewCell *adscell = (AdsTableViewCell*)[tableView  dequeueReusableCellWithIdentifier:adsID];
    
    //如果是广告
    if ([types[indexPath.section]intValue]==0) {
        if(!adscell){
            adscell=[[[NSBundle mainBundle]loadNibNamed:adsID owner:nil options:nil]firstObject];
        }
        adscell.theme.text=[NSString stringWithFormat:@"%@:%@",themes[indexPath.section],titles[indexPath.section]];
        adscell.backgroundColor=[UIColor clearColor];
        adscell.selectionStyle=UITableViewCellSelectionStyleNone;
        self.tableview.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ads"]];
        return adscell;
    }else{
        if (!cell) {
            cell=[[[NSBundle mainBundle]loadNibNamed:newsID owner:nil options:nil]firstObject];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.theme.text=[NSString stringWithFormat:@"来自话题:%@",themes[indexPath.section]];
        cell.title.text=titles[indexPath.section];
        cell.content.text=contents[indexPath.section];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView cellForRowAtIndexPath:indexPath].selected=NO;
    ContentViewController *content=[[ContentViewController alloc]init];

    if ([types[indexPath.section]intValue]==0) {
        //广告图片
        UIImageView *maskView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ads"]];
        //获取tableviewcell相对父视图的位置
        CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
        CGRect location = [tableView convertRect:rectInTableView toView:[tableView superview]];
        [maskView setFrame:CGRectMake(location.origin.x, location.origin.y, location.size.width, location.size.height)];
        [self.view addSubview:maskView];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.navigationController.navigationBarHidden=YES;
           [maskView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        } completion:^(BOOL finished){
            sleep(1);
            [maskView removeFromSuperview];
            [self.navigationController pushViewController:content animated:YES];
        }];
    }else{
        [self.navigationController pushViewController:content animated:YES];
    }
    
}
//判断广告cell是否在屏幕上
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([types[indexPath.section]intValue]==0) {
        //移除广告背景图片
        self.tableview.backgroundView=nil;
    }
}

@end
