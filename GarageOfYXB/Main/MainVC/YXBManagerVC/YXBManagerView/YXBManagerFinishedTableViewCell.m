//
//  YXBManagerFinishedTableViewCell.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/27.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBManagerFinishedTableViewCell.h"

#define kMaintenanceButtonRedValue          75
#define kMaintenanceButtonGreenValue        218
#define kMaintenanceButtonBlueValue         254
#define kMaintenanceButtonAlpha             1.0f
#define kMaintenanceButtonLayerBorderWidth  0.5f

@implementation YXBManagerFinishedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.maintenanceButton.layer.borderColor = [XXYColor(kMaintenanceButtonRedValue, kMaintenanceButtonGreenValue, kMaintenanceButtonBlueValue, kMaintenanceButtonAlpha) CGColor];
    self.maintenanceButton.layer.borderWidth = kMaintenanceButtonLayerBorderWidth;
    [self.maintenanceButton setTitleColor:XXYColor(kMaintenanceButtonRedValue, kMaintenanceButtonGreenValue, kMaintenanceButtonBlueValue, kMaintenanceButtonAlpha) forState:UIControlStateNormal];
    //self.maintenanceButton.enabled = NO;
    [self.maintenanceButton addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  clickAction
 */
- (void)clickButtonAction{
    if (self.finishedCellDelegate && [self.finishedCellDelegate respondsToSelector:@selector(clickFinishedButtonHandler)]) {
        [self.finishedCellDelegate clickFinishedButtonHandler];
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
