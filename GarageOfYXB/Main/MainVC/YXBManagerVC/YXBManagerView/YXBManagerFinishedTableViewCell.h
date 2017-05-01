//
//  YXBManagerFinishedTableViewCell.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/27.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXBManagerFinishedTableViewCellDelegate <NSObject>

- (void)clickFinishedButtonHandler;

@end

@interface YXBManagerFinishedTableViewCell : UITableViewCell
/* 车牌号 */
@property (weak, nonatomic) IBOutlet UILabel *carNumberLabel;
/* 拿车时间 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/* 维修详情 */
@property (weak, nonatomic) IBOutlet UIButton *maintenanceButton;

//构造协议
@property (nonatomic, weak) id<YXBManagerFinishedTableViewCellDelegate> finishedCellDelegate;




@end
