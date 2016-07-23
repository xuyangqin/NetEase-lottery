//
//  MMGuideController.m
//  网易彩票
//
//  Created by ios on 16/6/24.
//  Copyright © 2016年 itcast. All rights reserved.
//
#import "MMGuideController.h"
#import "MMGuideCell.h"
@interface MMGuideController ()
//保存背景图片
@property (nonatomic, strong) NSArray<UIImage *>*bgImgAry;
//波浪线
@property (nonatomic, weak) UIImageView *blView;
//大图片
@property (nonatomic, weak) UIImageView *bigView;
//大文字
@property (nonatomic, weak) UIImageView *largeTxtView;
//小文字
@property (nonatomic, weak) UIImageView *smallTxtView;
//记录页码
@property (nonatomic, assign) CGFloat pageNumber;
@end

@implementation MMGuideController

static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init {
    
    // 1.创建流水布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    // 1.2 设置大小
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    // 1.3 调整滚动方向 水平滚动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 1.4 调整间距
    flowLayout.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.设置背景
    self.collectionView.backgroundColor = [UIColor redColor];
    //2.设置分页效果
    self.collectionView.pagingEnabled = YES;
    //3.关闭弹簧效果
    self.collectionView.bounces = NO;
    //4.去掉底部的线
    self.collectionView.showsHorizontalScrollIndicator = NO;
     //注册
    [self.collectionView registerClass:[MMGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self setupUI];
}
- (void)setupUI{
  //设置图片
    //波浪线
    UIImageView *blView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    blView.x = -200;
    [self.collectionView addSubview:blView];
    //大图片
    UIImageView *bigView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:bigView];
    //文字一
    UIImageView *largeTxtView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largeTxtView.y = self.collectionView.height * 0.7;
    [self.collectionView addSubview:largeTxtView];
    //文字二
    UIImageView *smallTxtView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallTxtView.y = self.collectionView.height * 0.8;
    [self.collectionView addSubview:smallTxtView];
    //赋值
    self.blView = blView;
    self.bigView = bigView;
    self.largeTxtView = largeTxtView;
    self.smallTxtView = smallTxtView;
}
#pragma mark -代理方法
//给每张背景设置图片
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取当前的偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat idx = offsetX / self.collectionView.width;
    //图片加载方向
    if (self.pageNumber < offsetX) {
        //向左滑动
        self.bigView.x = offsetX + self.collectionView.width;
        self.smallTxtView.x = offsetX + self.collectionView.width;
    }else if (self.pageNumber == offsetX){
      //返回
        return;
    }else{
       //向右滑动
        self.bigView.x = offsetX - self.collectionView.width;
        self.smallTxtView.x = offsetX - self.collectionView.width;
    }
    self.pageNumber = idx;
    //切换图片
    // 拼接图片名称
    NSString *adImgName = [NSString stringWithFormat:@"guide%@", @(idx + 1)];
    NSString *largeTxtImgName = [NSString stringWithFormat:@"guideLargeText%@", @(idx + 1)];
    NSString *smallTxtImgName = [NSString stringWithFormat:@"guideSmallText%@", @(idx + 1)];
    
    // 切换图片
    self.bigView.image = [UIImage imageNamed:adImgName];
    self.largeTxtView.image = [UIImage imageNamed:largeTxtImgName];
    self.smallTxtView.image = [UIImage imageNamed:smallTxtImgName];
    
//动画
    [UIView animateWithDuration:0.5 animations:^{
        self.bigView.x = offsetX;
        self.largeTxtView.x = offsetX;
        self.smallTxtView.x = offsetX;
    }];
}

#pragma mark -懒加载
- (NSArray *)bgImgAry{
    if (_bgImgAry == nil) {
        _bgImgAry = @[
                      [UIImage imageNamed:@"guide1Background"],
                      [UIImage imageNamed:@"guide2Background"],
                      [UIImage imageNamed:@"guide3Background"],
                      [UIImage imageNamed:@"guide4Background"],
                      ];
    }
    return  _bgImgAry;
}
#pragma mark <UICollectionViewDataSource>数据源方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.bgImgAry.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     MMGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //如果是最后一页显示按钮，其它不显示
    if (indexPath.item == (self.bgImgAry.count - 1)) {
        cell.button.hidden = NO;
    }else{
        cell.button.hidden = YES;
    }
   // cell.backgroundView = [[UIImageView alloc]initWithImage:self.bgImgAry[indexPath.item]];
    cell.contentView.layer.contents =(__bridge id _Nullable)(self.bgImgAry[indexPath.item].CGImage);
    return cell;
}
@end
