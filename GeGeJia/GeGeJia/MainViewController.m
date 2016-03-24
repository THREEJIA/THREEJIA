//
//  ViewController.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "MainViewController.h"

#import <AFNetworking/AFNetworking.h>



#define USERDEFAULTS [NSUserDefaults standardUserDefaults]

@interface MainViewController ()

@property (nonatomic, assign) NSInteger selectedBtn,selectingBtn;
@property (nonatomic, assign) CGFloat   pointX;
@property (nonatomic, assign) NSInteger showPage;
@property (nonatomic, assign) NSInteger viewWidth;

@property (nonatomic, strong) UIView            *acitivityView;
@property (nonatomic, strong) NSMutableArray    *navButtonArr;
@property (nonatomic, strong) NSMutableArray    *viewPointArr;
@property (nonatomic, strong) BiggestModel      *bigList;

@property (nonatomic, copy) NSMutableArray *bannerListArr;
@property (nonatomic, copy) NSMutableArray *nowListArr;
@property (nonatomic, copy) NSMutableArray *functinListArr;
@property (nonatomic, copy) NSMutableArray *activityListArr;
@property (nonatomic, copy) NSMutableArray *hotListArr;
@property (nonatomic, copy) NSMutableArray *nowGegeRecommendArr;
@property (nonatomic, copy) NSMutableArray *gegeWlefareArr;
@property (nonatomic, copy) NSMutableArray *brandRecommendArr;

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated
{

    _areaButton.titleLabel.text = _areaString;
#warning mark根据地区发送请求
    
    if ([_areaButton.titleLabel.text isEqualToString:@"省份"])
    {
        [USERDEFAULTS setObject:@"省份" forKey:@"area"];
        [self getList];
        return;
    }
    NSString *localAreaString = [USERDEFAULTS objectForKey:@"area"];
    if ([_areaString isEqualToString:localAreaString])
    {
        
    }
    else
    {
        [self getList];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.viewWidth = self.view.frame.size.width;
    
    
    _areaButton.titleLabel.text = _areaString;
    
    self.navButtonArr = [[NSMutableArray alloc] init];
    self.viewPointArr = [[NSMutableArray alloc] init];
    self.selectingBtn = 0;
    
    _titleScrollerView.backgroundColor = [UIColor whiteColor];
    [self createNavigationListButton:_titleScrollerView];
    
    
    
    MainScrollView *homePage = [[MainScrollView alloc] initWithFrame:CGRectMake(0, 108, WWWW, HHHH - 157)];
    [self.view addSubview:homePage];
}

- (void)getList
{
    [HomeListManager getHomeList:^(BiggestModel *bigList) {
        _bigList            = bigList;
        _bannerListArr      = bigList.bannerList;
        _nowListArr         = bigList.nowList;
        _functinListArr     = bigList.functionList;
        _activityListArr    = bigList.activityList;
        _hotListArr         = bigList.hotList;
        _nowGegeRecommendArr = bigList.nowGegeRecommend;
        _gegeWlefareArr     = bigList.gegeWelfare;
        _brandRecommendArr  = bigList.brandRecommend;
    }];
}

#pragma mark - NavigationListButton

- (void)createNavigationListButton:(UIScrollView *)scrollView
{
    NSArray *arr = @[@"首页",@"休闲零食",@"保健滋补",@"母婴辅食",@"最后疯抢",@"即将开抢"];
#warning DoNotOver
    //title的数据源，这里目前没有请求数据，暂时用手动的数据代替
    self.titleNameArr = [NSMutableArray arrayWithArray:arr];
    
    _pointX = 0;
    for (int i = 0 ; i < [_titleNameArr count] ; i ++)
    {
        //获取button的宽度
        CGFloat width = [self checkTheSize:self.titleNameArr[i]];
        
        //创建button
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        //给button设置标题
        [btn setTitle:_titleNameArr[i] forState:UIControlStateNormal];
        
        //给button添加点击事件
        [btn addTarget:self action:@selector(navigationListButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置button的tag
        btn.tag = i + 100;
        
        //设置button的frame
        btn.frame = CGRectMake(_pointX, 0, width, 44);
        
        //创建_acitivityView并设置其初始位置
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _acitivityView = [[UIView alloc]init];
            _acitivityView.bounds = CGRectMake(0, 0, width - 20, 2);
            _acitivityView.center = CGPointMake(btn.center.x, btn.center.y + 15);
            _acitivityView.backgroundColor = [UIColor redColor];
            [scrollView addSubview:_acitivityView];
        });

        //设置button的字体颜色
        if ((btn.tag - 100) == _selectingBtn)
        {
            btn.tintColor = [UIColor redColor];
        }
        else
        {
            btn.tintColor = [UIColor blackColor];
        }
        
        //按照button的创建顺序，将_acitivityView的位置存入数组
        CGRect rect = CGRectMake(btn.center.x- width/2 + 10 , btn.center.y+ 15 , width - 20, 2);
        NSString *str = NSStringFromCGRect(rect);
        [self.viewPointArr addObject:str];
        
        //将button添加到数组
        [_navButtonArr addObject:btn];
 
        //设置scrollView的内容大小
        _pointX += width;
        CGSize scSize = CGSizeMake(_pointX, 44);
        scrollView.contentSize = scSize;

        [scrollView addSubview:btn];

    }
}

- (void)navigationListButtonClick:(UIButton *)clickedButton
{
    _selectedBtn = _selectingBtn;
    
    clickedButton.tintColor = [UIColor redColor];
    UIButton *btn = _navButtonArr[_selectedBtn];
    btn.tintColor = [UIColor blackColor];
    
    _selectingBtn = clickedButton.tag - 100;
    
    CGRect rect = CGRectMake(clickedButton.center.x - _viewWidth/2, clickedButton.center.y,_titleScrollerView.bounds.size.width , _titleScrollerView.bounds.size.height);
    [_titleScrollerView scrollRectToVisible:rect animated:YES];
    
    [UIView animateWithDuration:.3 animations:^{
        _acitivityView.frame = CGRectFromString(_viewPointArr[_selectingBtn]);
    }];
#warning mark还需要写跳转
}



- (CGFloat)checkTheSize:(NSString *)message{
    CGFloat y = 44;
    CGRect rect=[message boundingRectWithSize:CGSizeMake(10000000, y) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:nil];
    
    return rect.size.width+20;
}

#pragma mark - 选择地区

- (IBAction)locationButtonClick:(UIButton *)sender
{
    AreaViewController *areaVC = [[AreaViewController alloc] init];
    [self presentViewController:areaVC animated:YES completion:nil];
}

- (IBAction)searchButtonClick:(UIButton *)sender
{
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    [self presentViewController:searchVC animated:YES completion:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
