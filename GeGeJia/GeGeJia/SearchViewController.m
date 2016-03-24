//
//  SearchViewController.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/23.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "SearchViewController.h"

#import "RefreshView.h"

@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (nonatomic, strong) RefreshView   *refreshView;
@property (nonatomic, strong) UITouch       *touch;
@property (nonatomic, assign) CGFloat       contentOffS;
@property (nonatomic, strong) UILabel       *noneHistory;

@property (nonatomic, strong) NSMutableArray *historySearchArr;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.noneHistory = [[UILabel alloc]init];
    _noneHistory.center = CGPointMake(self.view.center.x, 80);
    _noneHistory.bounds = CGRectMake(0, 0, 240, 42);
    _noneHistory.text = @"历史搜索记录为空";
    _noneHistory.textAlignment = NSTextAlignmentCenter;
    _noneHistory.textColor = [UIColor lightGrayColor];

    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.sectionFooterHeight = 1;
    
    for(UIView *view in  [[[_searchBar subviews] objectAtIndex:0] subviews])
    {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]])
        {
            UIButton * cancel =(UIButton *)view;
            cancel.tintColor = [UIColor whiteColor];
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            [cancel addTarget:self action:@selector(cancelSearch) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    [self searchBarResignAndChangeUI];
}

- (void)cancelSearch
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footerView = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"footerview"];
    footerView.backgroundColor = [UIColor lightGrayColor];
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    vi.backgroundColor = [UIColor greenColor];
    return vi;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"headerview"];
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(8, 8, 3, 28)];
    vi.backgroundColor = [UIColor redColor];
       
    UILabel *textLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 8, 200, 28)];
    if (section == 0)
    {
        textLab.text = @"热门搜索";
    }
    else
    {
        textLab.text = @"历史搜索";
    }
    
    [headerView addSubview:vi];
    [headerView addSubview:textLab];

    if (section == 1)
    {
        [headerView addSubview:_noneHistory];
    }
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    else
    {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}


//1、键盘搜索按钮点击

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [self searchBarResignAndChangeUI];
    
}

//2、UISearchBar结束编辑

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
    [self searchBarResignAndChangeUI];
    
}

//searchBarResignAndChangeUI方法的实现如下：

- (void)searchBarResignAndChangeUI{
    
    [_searchBar resignFirstResponder];//失去第一响应
    
    [self changeSearchBarCancelBtnTitleColor:_searchBar];//改变布局
    
}
    
#pragma mark - 遍历改变搜索框 取消按钮的文字颜色
    
- (void)changeSearchBarCancelBtnTitleColor:(UIView *)view{
    
    if (view) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            
            UIButton *getBtn = (UIButton *)view;
            
            [getBtn setEnabled:YES];//设置可用
            
            [getBtn setUserInteractionEnabled:YES];
            
            //设置取消按钮字体的颜色“#0374f2”
            
            [getBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateReserved];
            
            [getBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
            
            return;
            
        }else{
            
            for (UIView *subView in view.subviews) {
                
                [self changeSearchBarCancelBtnTitleColor:subView];
                
            }
            
        }
        
    }else{
        
        return;
        
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_searchBar resignFirstResponder];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
