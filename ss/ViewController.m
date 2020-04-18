//
//  ViewController.m
//  ss
//
//  Created by s on 2020/4/17.
//  Copyright © 2020 s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) UIImageView * imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.frame = CGRectMake(10, 20, self.view.frame.size.width - 20, 44);
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.bounds = CGRectMake(0, 0, 200, 200);
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];
    // Do any additional setup after loading the view.
}
- (void) takePhoto:(UIButton *)sender{
    UIAlertController *alertConroller = [UIAlertController alertControllerWithTitle: nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    __weak typeof (self) weakSelf = self;
    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"paizhao" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
  
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = weakSelf;
        imagePicker.allowsEditing =  YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto; //相机的模式 拍照/摄像
        [weakSelf presentViewController :imagePicker animated: YES completion:^{}];


//         imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
//         imagePicker.showsCameraControls = NO;
//         imagePicker.navigationBarHidden = YES;
//         imagePicker.toolbarHidden = YES;
//         imagePicker.wantsFullScreenLayout = YES;

    }];
    UIAlertAction *chooseGallery = [UIAlertAction actionWithTitle:@"xiangce" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = weakSelf;
        imagePicker.allowsEditing =  YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [weakSelf presentViewController :imagePicker animated: YES completion:^{}];
    }];
    UIAlertAction *exit = [UIAlertAction actionWithTitle:@"exit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }];
    [alertConroller addAction:takePhotoAction];
    [alertConroller addAction:chooseGallery];
    [alertConroller addAction:exit];
    [self presentViewController:alertConroller animated:YES completion:^ {
        
    }];
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image;
    if (picker.allowsEditing) {
        image = info[UIImagePickerControllerEditedImage];
    } else {
        image = info[UIImagePickerControllerOriginalImage];
    }
    self.imageView.image = image;
}
- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
