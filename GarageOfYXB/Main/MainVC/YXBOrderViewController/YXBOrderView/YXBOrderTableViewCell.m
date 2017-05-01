//
//  YXBOrderTableViewCell.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/25.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBOrderTableViewCell.h"

@implementation YXBOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.TotalView.layer.borderColor = [[UIColor greenColor] CGColor];
    self.TotalView.layer.borderWidth = 1.0f;
    self.statusLabel.layer.borderColor = [[UIColor grayColor] CGColor];
    self.statusLabel.layer.borderWidth = 0.5f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
