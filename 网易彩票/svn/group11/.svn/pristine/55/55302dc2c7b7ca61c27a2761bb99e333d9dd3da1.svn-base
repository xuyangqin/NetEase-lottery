//
//  MDRProductController.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import "MDRProductController.h"
#import "MDRProductCell.h"
#import "MDRProduct.h"

@interface MDRProductController ()

// 产品模型数组
@property (nonatomic, strong) NSArray *products;

@end

@implementation MDRProductController

#pragma mark - 懒加载
- (NSArray *)products {
    if (!_products) {
        
        // 获取文件的路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
        
        // 转为NSData类型的数据
        NSData *data = [NSData dataWithContentsOfFile:filePath];

        
        // 序列化，把NSData类型数据转为字典数组
        NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 把字典数组转为模型数组
        NSMutableArray *temp = [NSMutableArray array];
        [dictArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            // 转为模型并保存到临时数组
            MDRProduct *product = [MDRProduct productWithDict:obj];
            [temp addObject:product];
            
        }];
        _products = temp;
        
    }
    return _products;
}


- (instancetype)init {
    
    // 创建流水布局
    UICollectionViewFlowLayout *flowOut = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置大小
    flowOut.itemSize = CGSizeMake(80, 80);
    
    // 设置最小行间距
    flowOut.minimumLineSpacing = 30;
    // 设置item之间的间距
    flowOut.minimumInteritemSpacing = 0;
    
    // 设置组边距
    flowOut.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:flowOut];
}

static NSString *const ID = @"product";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self products];
    // 注册cell
    //    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    // 设置背景
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // 加载xib文件
    UINib *nib = [UINib nibWithNibName:@"MDRProductCell" bundle:nil];
    // 注册nib文件类型的cell
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    
}

#pragma mark - UICollectionViewDataSource
// 返回每一组有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 返回每一组有多少个块
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.products.count;
}

// 返回cell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建cell
    // 如果缓存池中有cell，那就用。如果没有，就根据collectionView注册的cell类型创建一个，
    // 并且设置复用标记就是ID
    MDRProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.product = self.products[indexPath.item];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MDRProductCell *cell = (MDRProductCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    // 获取选中的模型
    MDRProduct *product = cell.product;
    
    // 判断是否能够打开这个应用
    /**
     // iOS 9 以前
     1.拼接对应的schemes://idtifier
     2.转为NSURL,[NSURL urlWithString:];
     3.通过[[UIApplication shareApplication] openURL:url]
     
     iOS 9以后
     1.white list 白名单，能够打开的应用类型，需要提前说明能够打开的应用类型schemes。
     2.通过LSApplicationQuerieSchemes 数组
     3.配置里面的item，设置为对应的schemes。
     4.拼接对应的schemes://idtifier
     5.转为NSURL,[NSURL urlWithString:];
     6.通过[[UIApplication shareApplication] openURL:url]
     */
    
    // 拼接对应的字符串
    NSString *str = [NSString stringWithFormat:@"%@://%@", product.customUrl, product.ID];
    
    // 转为URL
    NSURL *url = [NSURL URLWithString:str];
    
    // 通过application去打开应用
    UIApplication *application = [UIApplication sharedApplication];
    if ([application canOpenURL:url]) {
        
        [application openURL:url];
    } else {
        
        // 打开应用在AppStore上的页面
        NSURL *appSUrl = [NSURL URLWithString:product.url];
        [application openURL:appSUrl];
    }  
    
}

@end
