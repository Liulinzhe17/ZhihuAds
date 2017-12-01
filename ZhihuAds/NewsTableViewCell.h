//
//  NewsTableViewCell.h
//  test2
//
//  Created by 柳麟喆 on 2017/11/30.
//  Copyright © 2017年 lzLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *theme;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *content;

@end
