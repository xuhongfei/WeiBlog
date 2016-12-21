//
//  WBComposeController.m
//  WeiBlog
//
//  Created by xuhongfei on 15/9/12.
//  Copyright (c) 2015年 xuhongfei. All rights reserved.
//

#import "WBComposeController.h"
#import "WBTextView.h"
#import "WBComposeToolBar.h"
#import "WBComposeTool.h"
#import "WBAccount.h"
#import "WBAccountTool.h"
#import "WBComposePhotosView.h"

@interface WBComposeController () <UITextViewDelegate, WBComposeToolBarDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, weak) WBTextView *textView;
@property (nonatomic, weak) WBComposeToolBar *toolBar;
@property (nonatomic, weak) WBComposePhotosView *photosView;

@end

@implementation WBComposeController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavBar];
    
    [self setupTextView];
    
    [self setupToolBar];
    
    [self setupPhotosView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.textView endEditing:YES];
}

#pragma mark - 初始化
- (void)setupNavBar
{
    self.title = @"发微博";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(compose)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)setupPhotosView
{
    WBComposePhotosView *photosView = [[WBComposePhotosView alloc] init];
//    photosView.backgroundColor = [UIColor orangeColor];
    CGFloat viewX = 0;
    CGFloat viewY = 80;
    CGFloat viewH = self.textView.frame.size.height;
    CGFloat viewW = self.textView.frame.size.width;
    photosView.frame = CGRectMake(viewX, viewY, viewW, viewH);
    [self.textView addSubview:photosView];
    self.photosView = photosView;
}

- (void)setupTextView
{
    WBTextView *textView = [[WBTextView alloc] init];
    textView.frame = self.view.bounds;
    textView.font = [UIFont systemFontOfSize:15];
    textView.placeholder = @"分享新鲜事...";
    textView.alwaysBounceVertical = YES;
    [self.view addSubview:textView];
    textView.delegate = self;
    self.textView = textView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged) name:UITextViewTextDidChangeNotification object:textView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)note
{
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect rect = [note.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    [UIView animateWithDuration:duration animations:^{
        self.toolBar.transform = CGAffineTransformMakeTranslation(0, -rect.size.height);
    }];
}

- (void)keyboardWillHide:(NSNotification *)note
{
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration animations:^{
        self.toolBar.transform = CGAffineTransformIdentity;
    }];
}

- (void)setupToolBar
{
    WBComposeToolBar *toolBar = [[WBComposeToolBar alloc] init];
    toolBar.delegate = self;
    CGFloat toolBarW = self.view.frame.size.width;
    CGFloat toolBarH = 44;
    CGFloat toolBarX = 0;
    CGFloat toolBarY = self.view.frame.size.height - toolBarH;
    toolBar.frame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    [self.view addSubview:toolBar];
    self.toolBar = toolBar;
}

- (void)textDidChanged
{
    self.navigationItem.rightBarButtonItem.enabled = (self.textView.text.length != 0);
}

#pragma mark - toolBar delegate
- (void)composeToolBar:(WBComposeToolBar *)toolBar clickedButtonType:(WBComposeToolbarButtonType)type
{
    switch (type) {
        case WBComposeToolbarButtonTypeCamera:
            [self openCamera];
            break;
        case WBComposeToolbarButtonTypePicture:
            [self openPhoneLibaray];
            break;
        case WBComposeToolbarButtonTypeMention:
            
            break;
        case WBComposeToolbarButtonTypeTrend:
            
            break;
        case WBComposeToolbarButtonTypeEmotion:
            
            break;
        default:
            break;
    }
}

- (void)openCamera
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self.navigationController presentViewController:ipc animated:YES completion:nil];
}

- (void)openPhoneLibaray
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self.navigationController presentViewController:ipc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.photosView addPhoto:image];
}

#pragma mark - textView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark - 按钮事件处理
- (void)compose
{
    if (self.photosView.totalPhotos.count) {
        [self composeWithPhotos];
    } else {
        [self composeWithoutPhoto];
    }
}

- (void)composeWithPhotos
{
    
}

- (void)composeWithoutPhoto
{
    WBAccount *account = [WBAccountTool account];
    WBComposeStatusParam *param = [[WBComposeStatusParam alloc] init];
    param.access_token = account.access_token;
    param.status = self.textView.text;
    
    [WBComposeTool composeStatusWithParam:param success:^(WBComposeStatusResult *result) {
        
    } failure:^(NSError *error) {
        
    }];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
