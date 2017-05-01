//
//  YXBMangerPendingTableViewCell.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/27.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXBMangerPendingTableViewCellDelegate <NSObject>

- (void)clickPendingButtonHandler;

@end

@interface YXBMangerPendingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *carNumberLabel;

@property (weak, nonatomic) IBOutlet UIButton *progressButton;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//构造协议
@property (nonatomic, weak) id <YXBMangerPendingTableViewCellDelegate>cellDelegate;
@end
