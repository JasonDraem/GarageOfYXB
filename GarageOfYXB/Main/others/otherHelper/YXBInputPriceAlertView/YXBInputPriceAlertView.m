//
//  YXBInputPriceAlertView.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/29.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBInputPriceAlertView.h"
#import "XXYSubViewsTool.h"
#import "YXBMBProgressHudTool.h"
#import <Masonry/Masonry.h>


#define kPriceAlertViewWidth        XXYScreenW / 1.5 * kViewWidthScale

@interface YXBInputPriceAlertView ()
// 蒙板
@property (nonatomic, strong) UIView *backgroundMask;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *grayView;

//控件
/* 取消按钮 */
@property (nonatomic, strong) UIButton *cancelButton;
/* 确定按钮 */
@property (nonatomic, strong) UIButton *sureButton;
/* 维修价格录入 */
@property (nonatomic, strong) UILabel *nameLabel;
/* 维修项目名称 */
@property (nonatomic, strong) UITextField *projectNameTF;
/* 维修价格 */
@property (nonatomic, strong) UITextField *priceTF;
/* 时间选择器 */

@end

static YXBInputPriceAlertView *priceAlertView = nil;

@implementation YXBInputPriceAlertView
- (instancetype)init{
    self = [super initWithFrame:XXYScreenBounds];
    if (self) {
        [self setupSubviews];
        [self keyboardNotification];
    }
    return self;
}

- (void)setupSubviews{
    //蒙板
    self.backgroundColor = [UIColor clearColor];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.backgroundMask = [[UIView alloc] initWithFrame:self.bounds];
    self.backgroundMask.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    self.backgroundMask.backgroundColor = [UIColor blackColor];
    self.backgroundMask.alpha = 0;
    [self addSubview:self.backgroundMask];
    
    //弹出框
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
    [self addSubview:self.contentView];
    
    //XXYSubViewsTool
    //取消按钮
    self.cancelButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"取消" tintColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] borderColor:[UIColor lightGrayColor].CGColor borderWidth:1.0f target:self selAction:@selector(clickCancelButtonAction)];
    [self.contentView addSubview:self.cancelButton];
    //完成按钮
    self.sureButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"完成" tintColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] borderColor:[UIColor lightGrayColor].CGColor borderWidth:1.0f target:self selAction:@selector(clickSureButtonAction)];
    
    [self.contentView addSubview:self.sureButton];
    //维修价格录入
    self.nameLabel = [XXYSubViewsTool xxyLabelWithText:@"维修价格录入" BackgroundColor:[UIColor whiteColor] textColor:[UIColor blackColor] textFont:15.0f];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.nameLabel];
    //维修项目名称
    self.projectNameTF = [XXYSubViewsTool xxyLoginTextFieldToolWithPlaceholder:@"维修项目名称" tag:20000];
    self.projectNameTF.layer.borderColor = [UIColor cyanColor].CGColor;
    self.projectNameTF.layer.borderWidth = 1.0f;
    [self.contentView addSubview:self.projectNameTF];
    //维修价格
    self.priceTF = [XXYSubViewsTool xxyLoginTextFieldToolWithPlaceholder:@"维修价格" tag:20001];
    self.priceTF.layer.borderColor = [UIColor cyanColor].CGColor;
    self.priceTF.layer.borderWidth = 1.0f;
    [self.contentView addSubview:self.priceTF];
    //时间选择器
    //布局
    [self layoutSubViewsHandler];
}

- (void)clickCancelButtonAction{
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    [self dismissAlertView];
}

- (void)clickSureButtonAction{
    if (self.resultBlock) {
        if (0 == self.projectNameTF.text.length || 0 == self.priceTF.text.length) {
            
            [[YXBMBProgressHudTool shareInstance] showMBProgressShowAddedTo:self hudBgColor:[UIColor blackColor] text:@"不可为空" textFont:12.0f textColor:[UIColor whiteColor] activityIndicatorColor:[UIColor whiteColor]];
            [[YXBMBProgressHudTool shareInstance] dismissMBProgress];
            return;
        }
        self.resultBlock(self.projectNameTF.text, self.priceTF.text);
        [self dismissAlertView];
    }
}

#pragma mark - 显示提示框
- (void)showPriceAlertView{
    priceAlertView = self;
    priceAlertView.hidden = NO;
    //设置显示提示框显示动画
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backgroundMask.alpha = 0.4;
        [self setContentViewFrameY:CGRectGetHeight(self.bounds) - self.contentView.frame.size.height];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showPriceAlertViewWithCompleteAction:(CompleteBlock)completeBlock cancelBlock:(CancelBlock)cancelBlock{
    self.resultBlock = completeBlock;
    self.cancelBlock = cancelBlock;
    priceAlertView = self;
    priceAlertView.hidden = NO;
    //设置显示提示框显示动画
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backgroundMask.alpha = 0.4;
        [self setContentViewFrameY:CGRectGetHeight(self.bounds) - self.contentView.frame.size.height];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - 隐藏功能提示框
- (void)dismissAlertView{
    //设置隐藏功能提示框隐藏动画
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backgroundMask.alpha = 0;
        [self setContentViewFrameY:CGRectGetHeight(self.bounds)];
    } completion:^(BOOL finished) {
        priceAlertView.hidden = YES;
        priceAlertView = nil;
    }];
}

#pragma mark - 计算contenviewFrame_Y
- (void)setContentViewFrameY:(CGFloat)y{
    CGRect frame = self.contentView.frame;
    frame.origin.y = y;
    self.contentView.frame = frame;
}


#pragma mark - 布局
- (void)layoutSubViewsHandler{
    weakify(self)
    //弹框
    CGFloat alertViewWidth = XXYScreenW / 1.5 * kViewWidthScale;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weak_self.mas_centerX);
        make.bottom.mas_equalTo(weak_self.mas_bottom).with.offset(-(XXYScreenH/3));
        make.size.mas_equalTo(CGSizeMake(alertViewWidth, alertViewWidth));
    }];
    //取消
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.contentView.mas_top).with.offset(10);
        make.left.mas_equalTo(weak_self.contentView.mas_left).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(40, 20));
    }];
    //完成
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.cancelButton.mas_top);
        make.right.mas_equalTo(weak_self.contentView.mas_right).with.offset(-5);
        make.size.equalTo(weak_self.cancelButton);
    }];
    //价格录入
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.cancelButton.mas_bottom).with.offset(5);
        make.left.equalTo(weak_self.contentView.mas_left);
        make.right.equalTo(weak_self.contentView.mas_right);
        make.height.mas_equalTo(20 * kViewHeightScale);
    }];
    //维修项目名称
    [self.projectNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.nameLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(weak_self.contentView.mas_left).with.offset(20);
        make.right.mas_equalTo(weak_self.contentView.mas_right).with.offset(-20);
        make.height.mas_equalTo(50*kViewHeightScale);
    }];
    //维修价格
    [self.priceTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.projectNameTF.mas_bottom).with.offset(5);
        make.left.equalTo(weak_self.projectNameTF.mas_left);
        make.right.equalTo(weak_self.projectNameTF.mas_right);
        make.height.equalTo(weak_self.projectNameTF.mas_height);
    }];
    //时间选择器
    //
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.projectNameTF endEditing:YES];
    [self.priceTF endEditing:YES];
}

#pragma mark - 键盘监听
- (void)keyboardNotification{
    [XXYNotificationCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [XXYNotificationCenter addObserver:self selector:@selector(keyboardWillHiden:) name:UIKeyboardWillHideNotification object:nil];
}

/**
 *  键盘弹出
 *
 *  @param notification <#notification description#>
 */
- (void)keyboardWillShow:(NSNotification *)notification{
    //1.获取键盘的高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    
    CGFloat keyboardDuration =
    [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    //2.设置当前frame
//    CGRect frame = self.originalFrame;
//    frame.origin.y -= keyboardHeight;
//    self.crmLoginView.frame = frame;
    weakify(self)
    //更新约束
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weak_self.mas_bottom).with.offset(-keyboardHeight);
    }];
    //
    [UIView animateWithDuration:keyboardDuration animations:^{
        [weak_self.contentView layoutIfNeeded];
    }];
}
/**
 *  键盘隐藏事件
 *
 *  @param notificaiton <#notificaiton description#>
 */
- (void)keyboardWillHiden:(NSNotification *)notificaton{
    //self.crmLoginView.frame = self.originalFrame;
    //1.获取键盘的高度
    NSDictionary *userInfo = [notificaton userInfo];
    
    CGFloat keyboardDuration =
    [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    weakify(self)
    //更新约束
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weak_self.mas_bottom).with.offset(-(XXYScreenH/3));
    }];
    //
    [UIView animateWithDuration:keyboardDuration animations:^{
        [weak_self.contentView layoutIfNeeded];
    }];
}
/**
 *  控制器销毁移除通知
 */
-(void)dealloc {
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



















@end
