//
//  ShopingViewController.m
//  GeGeJia
//
//  Created by lu on 16/3/21.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "ShopingViewController.h"
#import "TableViewCell1.h"
#import "TableViewCell2.h"

@interface ShopingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *leftDownLine;
@property (weak, nonatomic) IBOutlet UIView *rightDownLine;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ShopingViewController

- (void)viewDidLoad {
    [super viewDidLoad];




}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 33;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=nil;
    if (indexPath.row<=3) {
        cell=[tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        cell.backgroundColor=[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    }else{
        cell=[tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        cell.backgroundColor=[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    }
    return cell;
}

- (IBAction)classclassify:(UIButton *)sender {
    
    
    
}

- (IBAction)brand:(UIButton *)sender {
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
