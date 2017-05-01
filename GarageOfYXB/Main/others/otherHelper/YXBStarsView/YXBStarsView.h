//
//  YXBStarsView.h
//  YXBCustomerSoftWare
//
//  Created by Jason_Xu on 16/9/24.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXBStarsView : UIView

/**
 *  星级评价一
 *
 *  @param leveal level
 */
- (void)setLeveal:(double)leveal;
/**
 *  星级评价二
 *
 *  @param level level
 */
- (void)setStartProgress:(double)level;
@end
