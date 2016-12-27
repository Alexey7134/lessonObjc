//
//  MainViewController.m
//  TestCamera
//
//  Created by Viktor Siedov on 27.12.16.
//  Copyright © 2016 Siedov Viktor. All rights reserved.
//

#import "MainViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface MainViewController ()

@property(strong, nonatomic)UIImagePickerController *picker;
@property(strong, nonatomic)UIImage *image;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.delegate = self;
    
    self.picker.mediaTypes = @[(NSString *)kUTTypeImage];
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.picker.allowsEditing = YES;
    
    [self presentViewController:self.picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *newImage = info[UIImagePickerControllerOriginalImage];
    if (!newImage) {
        newImage = info[UIImagePickerControllerOriginalImage];
    }
    self.image = newImage;
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
