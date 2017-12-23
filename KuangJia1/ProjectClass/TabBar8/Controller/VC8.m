//
//  VC8.m
//  KuangJia1
//
//  Created by MrSong on 17/7/31.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "VC8.h"
#import <AVFoundation/AVFoundation.h>
#import "QRCodeView.h"
#import "LYWebVC.h"
#import "LYTextVC.h"
#import "LYCreatQRCodeVC.h"


@interface VC8 ()<AVCaptureMetadataOutputObjectsDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) AVCaptureSession *session ;
@property (nonatomic,strong) AVCaptureVideoPreviewLayer *layer ;
@property (nonatomic,strong) AVCaptureConnection *connection ;

@property (nonatomic,assign) BOOL flashOpen ;

@property (nonatomic,strong) QRCodeView *maskView ;

@end

@implementation VC8

- (void)viewWillAppear:(BOOL)animated{
    
    [self.session startRunning];//开始扫描
    //扫描动画
    [self.maskView repetitionAnimation];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.session stopRunning];//停止扫描
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"二维码扫描";
    [self setupUI];
    

    
    /*
     * 好久没有你的信
     好久没有人陪我谈心
     怀念你柔情似水的眼睛
     是我天空最美丽的星星
     异乡的午夜特别冷清
     一个男人和一颗热切的心
     不知在远方的你是否能感应
     我从来不敢给你任何诺言
     是因为我知道我们太年轻
     你追求的是一种浪漫感觉
     还是那不必负责任的热情
     心中的话到现在才对你表明
     不知道你是否会因此而清醒
     让身在远方的我不必为你担心
     一颗爱你的心
     时时刻刻为你转不停
     我的爱也曾经 深深温暖你的心灵
     你和他之间是否已经有了真感情
     别隐瞒 对我说 别怕我伤心
     好久没有你的信
     好久没有人陪我谈心
     怀念你柔情似水的眼睛
     是我天空最美丽的星星
     异乡的午夜特别冷清
     一个男人和一颗热切的心
     不知在远方的你是否能感应
     我从来不敢给你任何诺言
     是因为我知道我们太年轻
     你追求的是一种浪漫感觉
     还是那不必负责任的热情
     心中的话到现在才对你表明
     不知道你是否会因此而清醒
     让身在远方的我不必为你担心
     一颗爱你的心
     时时刻刻为你转不停
     我的爱也曾经 深深温暖你的心灵
     你和他之间是否已经有了真感情
     别隐瞒 对我说 别怕我伤心
     一颗爱你的心
     时时刻刻为你转不停
     我的爱也曾经 深深温暖你的心灵
     你和他之间是否已经有了真感情
     别隐瞒 对我说 别怕我伤心
     */

}
#define mark 懒加载
- (AVCaptureSession *)session{
    if (!_session) {
        _session = ({
            //获取摄像设备
            AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
            
            //创建输入流
            AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
            if (!input)
            {
                return nil;
            }
            
            //创建输出流
            AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
            //设置代理 主线程刷新
            [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
            //设置扫描区域
            CGFloat width = 300 / CGRectGetHeight(self.view.frame);
            CGFloat height = 300 / CGRectGetWidth(self.view.frame);
            output.rectOfInterest = CGRectMake((1 - width) / 2, (1- height) / 2, width, height);
            
            AVCaptureSession *session = [[AVCaptureSession alloc] init];
            //高质量采集率
            [session setSessionPreset:AVCaptureSessionPresetHigh];
            [session addInput:input];
            [session addOutput:output];
            
            
            //设置编码 二维&条形
            output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,
                                           AVMetadataObjectTypeEAN13Code,
                                           AVMetadataObjectTypeEAN8Code,
                                           AVMetadataObjectTypeCode128Code];
            
            
            session;
        });
    }
    return _session;
}

- (void)setupUI{
    
    _maskView = [QRCodeView maskView];
    
    _maskView.frame = CGRectMake(0, 0, WIDTH, HEIGHT-108);
    
    [self.view addSubview:_maskView];
    
    [_maskView.lightBtn addTarget:self action:@selector(openLight:) forControlEvents:UIControlEventTouchDown];
    
    [_maskView.imgBtn addTarget:self action:@selector(openPhoto:) forControlEvents:UIControlEventTouchDown];
    
    [_maskView.createBtn addTarget:self action:@selector(createQR:) forControlEvents:UIControlEventTouchDown];
    
    _layer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _layer.frame = self.view.layer.bounds;
    [self.view.layer addSublayer:_layer];
}


#pragma mark - 生成二维码按钮
-(void)createQR:(UIButton *)sender{
    
    LYCreatQRCodeVC *vc = [[LYCreatQRCodeVC alloc] init];
    [self .navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - 闪光灯开关
-(void)openLight:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    if (sender.isSelected == YES) { //打开闪光灯
        AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        NSError *error = nil;
        
        if ([captureDevice hasTorch]) {
            BOOL locked = [captureDevice lockForConfiguration:&error];
            if (locked) {
                captureDevice.torchMode = AVCaptureTorchModeOn;
                [captureDevice unlockForConfiguration];
            }
        }
        
        [sender setImage:[UIImage imageNamed:@"flashk"] forState:UIControlStateNormal];
        
    }else{//关闭闪光灯
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]) {
            [device lockForConfiguration:nil];
            [device setTorchMode: AVCaptureTorchModeOff];
            [device unlockForConfiguration];
        }
        
        [sender setImage:[UIImage imageNamed:@"flashg"] forState:UIControlStateNormal];
    }
    
}

#pragma mark - 打开相册按钮
-(void)openPhoto:(UIButton *)sender{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.delegate = self;
        
        [self presentViewController:controller animated:YES completion:NULL];
    }
    else
    {
        [self showAlertWithTitle:@"提示" message:@"设备不支持访问相册" handler:nil];
    }
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    __weak __typeof(self) weakSelf = self;
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        
        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode
                                                  context:nil
                                                  options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
        
        NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
        if (features.count >= 1)
        {
            CIQRCodeFeature *feature = [features firstObject];
            
            BOOL isURL = [weakSelf getUrlLink:feature.messageString];
            
            if (isURL) {
                //二维码里面是URL时跳转到网页
                LYWebVC *webVC = [[LYWebVC alloc] init];
                
                webVC.url = feature.messageString;
                
                [weakSelf.navigationController pushViewController:webVC animated:YES];
                
            }else{
                //二维码里面是文字时跳转到显示页面
                LYTextVC *tVC = [[LYTextVC alloc] init];
                
                tVC.contentStr = feature.messageString;
                
                [weakSelf.navigationController pushViewController:tVC animated:YES];
            }
            
            
        }
        else
        {
            [weakSelf showAlertWithTitle:@"提示" message:@"没有发现二维码" handler:nil];
        }
        
    }];
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0)
    {
        [self.session stopRunning];
        
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects firstObject];
        
        BOOL isURL = [self getUrlLink:metadataObject.stringValue];
        
        if (isURL) {
            
            LYWebVC *webVC = [[LYWebVC alloc] init];
            
            webVC.url = metadataObject.stringValue;
            
            [self.navigationController pushViewController:webVC animated:YES];
            
        }else{
            
            LYTextVC *tVC = [[LYTextVC alloc] init];
            
            tVC.contentStr = metadataObject.stringValue;
            
            [self.navigationController pushViewController:tVC animated:YES];
        }
        
        
    }
}

#pragma mark - 正则比配URL
- (BOOL)getUrlLink:(NSString *)link {
    
    NSString *regTags = @"((http[s]{0,1}|ftp|HTTP[S]|FTP)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(((http[s]{0,1}|ftp)://|)((?:(?:25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d)))\\.){3}(?:25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d))))(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regTags];
    
    BOOL isValid = [predicate evaluateWithObject:link];
    
    return isValid;
}
#pragma mark - 提示框
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message handler:(void (^) (UIAlertAction *action))handler;
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
