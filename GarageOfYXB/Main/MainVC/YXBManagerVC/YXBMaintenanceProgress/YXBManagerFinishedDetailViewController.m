//
//  YXBManagerFinishedDetailViewController.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBManagerFinishedDetailViewController.h"
#import "YXBManagerFinishedView.h"
#import "YXBMBProgressHudTool.h"
#import "XXYPicScrollView.h"
#import "XXYPicScrollViewManager.h"

#import <SDWebImage/SDImageCache.h>

@interface YXBManagerFinishedDetailViewController ()<YXBManagerFinishedViewDelegate>
@property (nonatomic, strong) YXBManagerFinishedView *finishedView;
@property (nonatomic, strong) UIView *scView;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) XXYPicScrollView *picScrollView;
@end

@implementation YXBManagerFinishedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.finishedView];
    [self initPicScrollView];
}

- (YXBManagerFinishedView *)finishedView{
    if (!_finishedView) {
        _finishedView = [[YXBManagerFinishedView alloc] initWithFrame:self.view.bounds];
        _finishedView.delegate = self;
        self.scView = _finishedView.scrollViewView;
    }
    return _finishedView;
}

- (NSMutableArray *)imageArray{
    if (!_imageArray) {
//        _imageArray = [[NSMutableArray alloc] initWithObjects:
//                       @"http://p1.qqyou.com/pic/UploadPic/2013-3/19/2013031923222781617.jpg",
//                       @"http://cdn.duitang.com/uploads/item/201409/27/20140927192649_NxVKT.thumb.700_0.png",
//                       @"http://img4.duitang.com/uploads/item/201409/27/20140927192458_GcRxV.jpeg",
//                       @"http://cdn.duitang.com/uploads/item/201304/20/20130420192413_TeRRP.thumb.700_0.jpeg", nil];
        _imageArray = [[NSMutableArray alloc] initWithObjects:@"01.jpg", @"02.jpg", @"03.jpg", nil];
    }
    return _imageArray;
}

- (void)initPicScrollView{
    CGFloat height = self.view.frame.size.height / 4;
        self.picScrollView = [XXYPicScrollView picScrollViewWithFrame:CGRectMake(0, 0, XXYScreenW - 30, height) WithImageUrls:self.imageArray];
#warning 网络加载
    //[[XXYPicScrollViewManager shareManager] setDownloadImageRepeatCount:1];
//    [[XXYPicScrollViewManager shareManager]setDownLoadImageError:^(NSError *error, NSString *url) {
//        NSLog(@"%@", error);
//    }];
    //
    [self.picScrollView setImageViewDidTapAtIndex:^(NSInteger index) {
        NSLog(@"%zd", index);
    }];
    //
    [self.scView addSubview:self.picScrollView];
}

#pragma mark - YXBManagerFinishedViewDelegate
//播放语音
- (void)playRecoredHandler{
    [[YXBMBProgressHudTool shareInstance] showMBProgressShowAddedTo:self.view text:@"暂时无法播放"];
    [[YXBMBProgressHudTool shareInstance] dismissMBProgress];
}
//拨打电话
- (void)callPhoneHandler{
    [[YXBMBProgressHudTool shareInstance] showMBProgressShowAddedTo:self.view text:@"暂时无法拨打"];
    [[YXBMBProgressHudTool shareInstance] dismissMBProgress];
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
