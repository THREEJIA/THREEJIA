//
//  AreaViewController.m
//  GeGeJia
//
//  Created by 孙诚 on 16/3/22.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "AreaViewController.h"

#import "MainViewController.h"

@interface AreaViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSArray *provinceArr;
@property (nonatomic, copy) NSArray *sectionIndex;

@end

@implementation AreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.provinceArr = @[@[@"安徽",@"澳门"],@[@"北京"],@[@"重庆"],@[@"福建"],@[@"甘",@"广东",@"广西",@"贵州"],@[@"海南",@"河北",@"河南",@"黑龙江",@"湖北",@"湖南"],@[@"吉林",@"江苏",@"江西"],@[@"辽宁",@"宁夏"],@[@"内蒙"],@[@"青海"],@[@"陕西",@"山东",@"山西",@"上海",@"四川"],@[@"天津"],@[@"西藏",@"新疆",@"香港"],@[@"云南"],@[@"浙江"]];
    
    self.sectionIndex = @[@"A",@"B",@"C",@"F",@"G",@"H",@"J",@"L",@"N",@"Q",@"S",@"T",@"X",@"Y",@"Z"];

//    _areaTableView.tableHeaderView = _headerView;
    
    [_areaTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _areaTableView.sectionIndexBackgroundColor = [UIColor clearColor];
    _areaTableView.sectionIndexColor = [UIColor redColor];

//    [_areaTableView reloadSectionIndexTitles];
}

#pragma mark - UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerview"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headerview"];
    }
    cell.backgroundColor = [UIColor greenColor];
    cell.textLabel.text = _sectionIndex[section];
   
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UINavigationController *nav = (UINavigationController *)self.presentingViewController;
    
    MainViewController *mainVC = nav.childViewControllers[0];
    mainVC.areaString  = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _sectionIndex;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    [_areaTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    return (long)_sectionIndex[index];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sectionIndex.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_provinceArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _provinceArr[indexPath.section][indexPath.row];
    
    return cell;
}

- (IBAction)dismissButtonClick:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
