//
//  HomePageView.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/24.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "HomePageView.h"

#define WWWW  [UIScreen mainScreen].bounds.size.width
#define HHHH  [UIScreen mainScreen].bounds.size.height

@interface HomePageView ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic, assign) CGFloat   contentOffS;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIScrollView      *bannerScroll;
@property (nonatomic, strong) UIPageControl     *pageControl;
@property (nonatomic, strong) RefreshView       *refreshView;
@property (nonatomic, strong) NSTimer           *myTimer;


@end

@implementation HomePageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self baseInit:frame];
    }
    return self;
}

- (void)baseInit:(CGRect)frame
{
    //    CGRect rect = self.frame;
    UIView *view = nil;
    NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"HomePageView" owner:self options:nil];
    for (id object in objects)
    {
        if ([object isKindOfClass:[UIView class]])
        {
            CGRect rect = frame;
            rect.origin.y = 0;
            frame = rect;
            view = object;
            view.frame = frame;
            break;
        }
    }
    
    if (view)
    {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WWWW, HHHH - 157) style:UITableViewStylePlain];
        _tableView.tag = 999;
        [_tableView registerNib:[UINib nibWithNibName:@"TopTableViewCell" bundle:nil] forCellReuseIdentifier:@"topcell"];
        
        [self creatBannerScrollView];
        
        _refreshView = [[RefreshView alloc] initWithFrame:CGRectMake(WWWW / 2 - 87, -166, 174, 274)];
        self.contentOffS = _refreshView.frame.origin.y;
        _refreshView.backgroundColor = [UIColor whiteColor];
        NSLog(@"%f",WWWW);
    }
}

//    [self.view addSubview:_refreshView];
//
//    UIView *vi = self.view.subviews[0];
//    [self.view bringSubviewToFront:vi];
//
//
//    NSInteger reIndex = [self.view.subviews indexOfObject:_refreshView];
//    NSInteger tbIndex = 2;
//    [self.view exchangeSubviewAtIndex:reIndex withSubviewAtIndex:tbIndex];
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.row == 0)
    {
        UIView *bannerView = [self creatBannerScrollView];
        cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, bannerView.bounds.size.width, bannerView.bounds.size.height)];
        [cell.contentView addSubview:bannerView];
    }
    else
    {
        cell = (TopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"topcell" forIndexPath:indexPath];
    }
    
    return cell;
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 184;
}

#pragma mark - bannerView

- (UIView *)creatBannerScrollView
{
    
    UIView *bannerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WWWW, 184)];
    bannerView.backgroundColor = [UIColor greenColor];
    self.bannerScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WWWW, 184)];
    _bannerScroll.contentSize = CGSizeMake(WWWW* 7, 184);
    _bannerScroll.pagingEnabled = YES;
    _bannerScroll.contentOffset = CGPointMake(WWWW, 0);
    _bannerScroll.showsHorizontalScrollIndicator = NO;
    _bannerScroll.delegate = self;
    _bannerScroll.tag = 666;
    
    for (int i = 5; i < 12; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WWWW * (i - 6) , 0, WWWW, 184)];
        
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i%5]];
        
        [_bannerScroll addSubview:imageView];
    }
    
    self.pageControl = [[UIPageControl alloc]init];
    _pageControl.center = CGPointMake(WWWW/2, 165);
    _pageControl.bounds = CGRectMake(0, 0, 120, 10);
    _pageControl.numberOfPages = 5;
    
    [_pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.backgroundColor = [UIColor greenColor];
    
    [bannerView addSubview:_bannerScroll];
    [bannerView addSubview:_pageControl];
    
    if (_myTimer)
    {
        
    }
    else
    {
        self.myTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(autoMove) userInfo:nil repeats:YES];
    }
    
    return bannerView;
}

#pragma mark - NSTimer

- (void)autoMove
{
    int num=_bannerScroll.contentOffset.x/WWWW;
    [_bannerScroll setContentOffset:CGPointMake((num+1)*WWWW, 0) animated:YES];
    
}

#pragma mark - pageTurn

- (void)pageTurn:(UIPageControl *)pageControl
{
    [_bannerScroll setContentOffset:CGPointMake((_pageControl.currentPage+1)*WWWW, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 999)
    {
        if (_refreshView.isDragging == YES)
        {
            CGRect rect = _refreshView.frame;
            rect.origin.y = _contentOffS - scrollView.contentOffset.y;
            
            if (scrollView.contentOffset.y < -40.0)
            {
                [_refreshView setFreshState:stateReleaseFresh];
                NSLog(@"释放刷新");
            }
            else if (scrollView.contentOffset.y < 0)
            {
                [_refreshView setFreshState:stateDragDown];
                NSLog(@"下拉刷新");
            }
            
            _refreshView.frame = rect;
        }
    }
    if (scrollView.tag == 666)
    {
        float num = scrollView.contentOffset.x/WWWW;
        
        if (num > 5)
        {
            _bannerScroll.contentOffset=CGPointMake(WWWW+(num - 6) * WWWW, 0);
        }
        if(num < 0)
        {
            _bannerScroll.contentOffset=CGPointMake(WWWW * 5 + num * WWWW, 0);
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //num表示sc的哪一页
    float num=scrollView.contentOffset.x/WWWW;
    
    if(num == 6)
    {
        num = 1;
    }
    if(num == 0)
    {
        num = 5;
    }
    
    _pageControl.currentPage = num - 1;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //num表示sc的哪一页
    float num = scrollView.contentOffset.x/WWWW;
    
    if(num == 6)
    {
        num = 1;
    }
    if(num == 0)
    {
        num = 5;
    }
    
    _pageControl.currentPage = num-1;
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView.tag == 666)
    {
        [_myTimer setFireDate:[NSDate distantFuture]];
        NSLog(@"开始拖拽scroll");
    }
    else
    {
        _refreshView.isDragging = YES;
        NSLog(@"开始拖拽其它scroll");
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (scrollView.tag == 666)
    {
        [_myTimer setFireDate:[NSDate distantPast]];
        NSLog(@"结束拖拽scroll");
    }
    else
    {
        _refreshView.isDragging = NO;
        
        if (scrollView.contentOffset.y <= -40)
        {
            NSLog(@"正在刷新----%f",scrollView.contentOffset.y);
            [_refreshView setFreshState:stateFreshing];
            CGRect rect = _refreshView.frame;
            rect.origin.y = _contentOffS + 40;
            NSLog(@"%f",rect.origin.y);
            _refreshView.frame = rect;
            
            //            _refreshView.
            if (_refreshView.isAnimation == YES)
            {
                NSLog(@"1111111");
            }
            else
            {
                
                CGRect tableRect = _tableView.frame;
                tableRect.origin.y = _tableView.frame.origin.y + 40;
                _tableView.frame = tableRect;
#warning mark此处本应刷新数据
                [self performSelector:@selector(backToTop) withObject:self afterDelay:2];
            }
            
        }
        
        NSLog(@"结束拖拽其它scroll");
    }
}

#pragma mark - performSelector

- (void)backToTop
{
    if (_refreshView.isAnimation == NO)
    {
        CGRect rect = _refreshView.frame;
        rect.origin.y = _contentOffS;
        
        CGRect tableRect = _tableView.frame;
        tableRect.origin.y = _tableView.frame.origin.y - 40;
        
        _refreshView.isAnimation = YES;
        [UIView animateWithDuration:0.3 animations:^{
            
            _tableView.frame = tableRect;
            _refreshView.frame = rect;
            
        } completion:^(BOOL finished) {
            
            [_refreshView setFreshState:stateDragDown];
            _refreshView.isAnimation = NO;
        }];
    }
}
@end
