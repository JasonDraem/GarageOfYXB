//
//  YXBMangerPendingTableViewCell.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/27.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBMangerPendingTableViewCell.h"

#define kYXBMangerPendingTableViewCellColor              [UIColor cyanColor]
#define kMaintenanceButtonRedValue          75
#define kMaintenanceButtonGreenValue        218
#define kMaintenanceButtonBlueValue         254
#define kMaintenanceButtonAlpha             1.0f
#define kMaintenanceButtonLayerBorderWidth  0.5f

@implementation YXBMangerPendingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.progressButton.layer.borderColor =  [XXYColor(kMaintenanceButtonRedValue, kMaintenanceButtonGreenValue, kMaintenanceButtonBlueValue, kMaintenanceButtonAlpha) CGColor];
    self.progressButton.layer.borderWidth = kMaintenanceButtonLayerBorderWidth;
    [self.progressButton setTitleColor:XXYColor(kMaintenanceButtonRedValue, kMaintenanceButtonGreenValue, kMaintenanceButtonBlueValue, kMaintenanceButtonAlpha) forState:UIControlStateNormal];
    //self.progressButton.enabled = NO;
    //
    [self.progressButton addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
}
/**
 *  clickAction
 */
- (void)clickButtonAction{
    if (self.cellDelegate && [self.cellDelegate respondsToSelector:@selector(clickPendingButtonHandler)]) {
        [self.cellDelegate clickPendingButtonHandler];
    }
}













- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
