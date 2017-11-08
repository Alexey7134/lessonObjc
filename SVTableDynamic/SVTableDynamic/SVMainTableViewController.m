//
//  SVMainTableViewController.m
//  SVTableDynamic
//
//  Created by Viktor Siedov on 07.11.17.
//  Copyright © 2017 Siedov Viktor. All rights reserved.
//

#import "SVMainTableViewController.h"

@interface SVMainTableViewController ()

@end

@implementation SVMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    //NSString *cellIdentifier = [NSString stringWithFormat:@"Cell %li",indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.backgroundColor = [self randomColor];
    CGFloat red,green,blue,alpha = 0;
    [cell.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
    cell.textLabel.text = [NSString stringWithFormat:@"RGB(%0.f,%0.f,%0.f)",red*255, green*255, blue*255];
    cell.textLabel.textColor = [self randomColor];

    return cell;
}

#pragma mark - Private function

-(UIColor*) randomColor{
    CGFloat r = (CGFloat)(arc4random() % 256)/255;
    CGFloat g = (CGFloat)(arc4random() % 256)/255;
    CGFloat b = (CGFloat)(arc4random() % 256)/255;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

#pragma mark - Layout

-(void)makeLayout{
   // [self.tableView.topAnchor constraintEqualToAnchor:self.additionalSafeAreaInsets.top].active = YES;
}

@end
