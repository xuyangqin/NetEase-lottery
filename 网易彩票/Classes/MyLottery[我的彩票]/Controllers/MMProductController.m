//
//  MMProductController.m
//  网易彩票
//
//  Created by ios on 16/6/23.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMProductController.h"
#import "MMProduct.h"
#import "MMProductCell.h"
@interface MMProductController ()
//用来保存模型的数组
@property (nonatomic, strong) NSArray *productArr;
@end
@implementation MMProductController
static NSString * const reuseIdentifier = @"Cell";
- (instancetype)init{
    //创建布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(80, 80);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    return [super initWithCollectionViewLayout:flowLayout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MMProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}
#pragma mark -懒加载
- (NSArray *)productArr{
    if (_productArr == nil) {
          // 1.加载文件路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"more_project.json" ofType:nil];
           // 2.转为NSData类型的数据
        NSData *data = [NSData dataWithContentsOfFile:path];
          // 3.序列化
        NSArray *array = [NSJSONSerialization  JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
          // 4.遍历转模型
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            MMProduct *model = [MMProduct productWithDict:dict];
            [arrayM addObject:model];
        }
        _productArr = arrayM.copy;
    }
    return _productArr;
}
#pragma mark -UICollectionViewDataSources数据源方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.productArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MMProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = self.productArr[indexPath.item];
    return cell;
}

#pragma mark -UICollectionViewDelegate的代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  //获取选中的功能
    MMProduct *model = self.productArr[indexPath.item];
    //获取应用程序对象
    UIApplication *app = [UIApplication sharedApplication];
    //  拼接用于生成url的字符串
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@",model.customUrl,model.ID];
    //拼接其他应用的url
    NSURL *url  = [NSURL URLWithString:urlStr];
    //判断是否可以打开，可以就打开，不可以就跳转到AppStore下载
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }else{
        // - 否则,就跳转到AppStore下载
        NSURL *appStoreUrl = [NSURL URLWithString:model.url];
        [app openURL:appStoreUrl];
    }
}
@end
