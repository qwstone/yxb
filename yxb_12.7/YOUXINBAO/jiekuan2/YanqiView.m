//
//  YanqiView.m
//  YOUXINBAO
//
//  Created by Walice on 16/2/18.
//  Copyright © 2016年 北京全彩时代网络科技有限公司. All rights reserved.
//

#import "YanqiView.h"
#import "YXBTool.h"
#import "YXBLoanInfoDetails.h"

@implementation YanqiView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = rgb(1, 1, 1,0.3);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
        [self NSNotificationCenters];
        [self createView];
        
    }
    return self;
}

- (void)NSNotificationCenters {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

#pragma mark --- 键盘通知
- (void)keyboardDidShow:(NSNotification *)info
{
    
     kebordFrame= [info.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//      [_timePicker showPickerView];
//    [UIView animateWithDuration:0.3 animations:^{
//        bgView.bottom = kDeviceHeight-kebordFrame.size.height-5
//        ;
//    } completion:^(BOOL finished) {
//        
//    }];
    
}

- (void)keyboardWillHide:(NSNotification *)info
{
    
//    [UIView animateWithDuration:0.3 animations:^{
//        bgView.center = self.center;
//    } completion:^(BOOL finished) {
//        
//    }];
}
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    
//    NSLog( @"text changed: %@", _textFiled1.text);
//     return YES;
//}

- (void)initCalculatorView {
    [[[UIApplication sharedApplication].delegate window] addSubview:self];
    self.backgroundColor = rgb(1, 1, 1,0.4);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tap];
    [self createView];
    
}

- (void)createView {
    self.backview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    self.backview.backgroundColor = rgb(0, 0, 0, 0.6);
    [self addSubview:_backview];
    bgView = [[UIView alloc] init];
    int a =kDeviceWidth;
    if(kDeviceWidth<=320){
        bgView.frame=CGRectMake(15, 50, kDeviceWidth-30, 341);
    }
    else{
         bgView.frame=CGRectMake(15, 150, kDeviceWidth-30, 341);
    }
//     bgView.center = self.center;
    bgView.userInteractionEnabled = YES;
    bgView.clipsToBounds = YES;
    //bgView.backgroundColor = [UIColor whiteColor];
    [_backview addSubview:bgView];
    
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, bgView.width, 48)];
    image.image=[UIImage imageNamed:@"YXByanqiTop"];
    [bgView addSubview:image];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((image.width-100)/2, 5, 100, 41)];
    label.textColor=[YXBTool colorWithHexString:@"#B3B3B3"];
    label.textColor = rgb(0, 0, 0, 1);
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"申请延期";
    [label setAdjustsFontSizeToFitWidth:YES];
    [image addSubview:label];
    
    _whiteView=[[UIView alloc]initWithFrame:CGRectMake(6.5, image.bottom, bgView.width-13, 205)];
    _whiteView.backgroundColor=[UIColor whiteColor];
    [bgView addSubview:_whiteView];

    //第1行
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(30, 0, (bgView.width-60)/2, 40)];
    label1.text=@"待还金额";
    label1.textColor=rgb(51, 51, 51, 1);
    label1.font=[UIFont systemFontOfSize:16];
    [_whiteView addSubview:label1];
    label2=[[UILabel alloc]initWithFrame:CGRectMake(label1.right-20, 0, (bgView.width-60)/2-30, 40)];
    label2.textColor=rgb(237, 46, 36, 1);
    label2.tag=190002;
    label2.textAlignment=NSTextAlignmentRight;
    label2.font=[UIFont systemFontOfSize:20];
    [_whiteView addSubview:label2];
    [self drawLineInView:_whiteView AtPoint:CGPointMake(30, 41) AndWidthIs:bgView.width-60];
    
    UILabel *yuanLabel1=[[UILabel alloc]initWithFrame:CGRectMake(bgView.width-30-20, 0, 20, 40)];
    yuanLabel1.text=@"元";
    yuanLabel1.font=[UIFont systemFontOfSize:16];
    yuanLabel1.textColor=[YXBTool colorWithHexString:@"#333333"];
    [_whiteView addSubview:yuanLabel1];
    
    
    //第2行
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(30, 41, (bgView.width-60)/2, 40)];
    label3.text=@"延期补偿";
    label3.textColor=rgb(51, 51, 51, 1);
    label3.font=[UIFont systemFontOfSize:16];
    [_whiteView addSubview:label3];
    
    _textFiled1 = [[UITextField alloc] initWithFrame:CGRectMake(label3.right-20, 41, (bgView.width-60)/2-30, 40)];
    _textFiled1.tag = 10010;
    _textFiled1.placeholder=@"请输入金额";
    _textFiled1.delegate = self;
    _textFiled1.textAlignment = NSTextAlignmentRight;
    _textFiled1.keyboardType = UIKeyboardTypeNumberPad;
    _textFiled1.font = [UIFont systemFontOfSize:16];
    _textFiled1.textColor = rgb(237, 46, 36, 1);
     [_textFiled1 addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    [_whiteView addSubview:_textFiled1];
    
    UILabel *yuanLabel2=[[UILabel alloc]initWithFrame:CGRectMake(bgView.width-30-20, 41, 20, 40)];
    yuanLabel2.text=@"元";
    yuanLabel2.font=[UIFont systemFontOfSize:16];
    yuanLabel2.textColor=[YXBTool colorWithHexString:@"#333333"];
    [_whiteView addSubview:yuanLabel2];
    
     [self drawLineInView:_whiteView AtPoint:CGPointMake(30, 82) AndWidthIs:bgView.width-60];
    //第3行
    UILabel *labelnew=[[UILabel alloc]initWithFrame:CGRectMake(30, 82, (bgView.width-60)/2, 40)];
    labelnew.text=@"应还总额";
    labelnew.textColor=rgb(51, 51, 51, 1);
    labelnew.font=[UIFont systemFontOfSize:16];
    [_whiteView addSubview:labelnew];
    _labelnew1=[[UILabel alloc]initWithFrame:CGRectMake(label1.right-20, 82, (bgView.width-60)/2-30, 40)];
    _labelnew1.textColor=rgb(237, 46, 36, 1);
    _labelnew1.tag=380002;
    _labelnew1.textAlignment=NSTextAlignmentRight;
    _labelnew1.font=[UIFont systemFontOfSize:16];
    [_whiteView addSubview:_labelnew1];
    [self drawLineInView:_whiteView AtPoint:CGPointMake(30,123) AndWidthIs:bgView.width-60];
    
    UILabel *yuanLabelnew=[[UILabel alloc]initWithFrame:CGRectMake(bgView.width-30-20, 82, 20, 40)];
    yuanLabelnew.text=@"元";
    yuanLabelnew.font=[UIFont systemFontOfSize:16];
    yuanLabelnew.textColor=[YXBTool colorWithHexString:@"#333333"];
    [_whiteView addSubview:yuanLabelnew];
    
    //第4行
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(30, 123, (bgView.width-60)/2, 40)];
    label4.text=@"延至时间";
    label4.textColor=rgb(51, 51, 51, 1);
    label4.font=[UIFont systemFontOfSize:16];
    [_whiteView addSubview:label4];

    [self drawLineInView:_whiteView AtPoint:CGPointMake(30, 164) AndWidthIs:bgView.width-60];

    _Timebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _Timebtn.tag=9000001;
    _Timebtn.frame = ccr(label1.right, 123, (bgView.width-60)/2-30, 40);
    _Timebtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_Timebtn setTitleColor:rgb(194, 194, 194, 1)forState:UIControlStateNormal];
    _Timebtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    _Timebtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_Timebtn addTarget:self action:@selector(timeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_whiteView addSubview:_Timebtn];

    _button5=[UIButton buttonWithType:UIButtonTypeCustom];
    _button5.frame=CGRectMake(bgView.width-30-30, 123,  40, 40);
    [_button5 setImage:[UIImage imageNamed:@"data-gray.png"] forState:UIControlStateNormal];
    [_button5 setImage:[UIImage imageNamed:@"data-blue.png"] forState:UIControlStateSelected];
    [_button5 addTarget:self action:@selector(timeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_whiteView addSubview:_button5];
    
    [self drawLineInView:_whiteView AtPoint:CGPointMake(30, 123) AndWidthIs:bgView.width-60];

    
    _tit=[[UILabel alloc]initWithFrame:CGRectMake(0, 164, bgView.width-30, 35)];
    _tit.textColor=[UIColor redColor];
    _tit.font=[UIFont systemFontOfSize:12];
    _tit.text=@"延期时长30天";
    _tit.numberOfLines=0;
    _tit.tag=22220000;
    _tit.textAlignment=NSTextAlignmentRight;
    [_whiteView addSubview:_tit];
    
    UIImageView *img1=[[UIImageView alloc]initWithFrame:CGRectMake(6, _tit.bottom+5, bgView.width-12, 14)];
    img1.image=[UIImage imageNamed:@"YXByanqiFoot"];
    [_whiteView addSubview:img1];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActions)];
    [bgView addGestureRecognizer:tap];


    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, _whiteView.bottom+12, (bgView.width-5)/2, 53)];
    button.tag = 123456;
    [button setImage:[UIImage imageNamed:@"YXByanqiCancel"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:button];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(bgView.width/2+5,_whiteView.bottom+12, (bgView.width-5)/2, 53)];
    button1.tag = 654321;
    [button1 setImage:[UIImage imageNamed:@"YXByanqiConfirm"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:button1];

}
- (void)textFieldEditChanged:(UITextField *)textField

{
    
    NSLog(@"textfield text %@",textField.text);
    _changeStr=[NSString stringWithFormat:@"%@",textField.text];
    NSString*sss=label2.text;
    float ZongEstr=[_changeStr floatValue ]+[sss floatValue];
    _labelnew1.text=[NSString stringWithFormat:@"%.2lf",ZongEstr];

    
    
}
- (void)timeButtonAction{
    [self endEditing:YES];
    [self createTimerPickerView];
     [_timePicker showPickerView];
    
}
-(void)createTimerPickerView
{
    
    NSString*huankuanTime=_HuanKuanTimestr;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *endDate = [dateFormatter dateFromString:huankuanTime];

       if (_timePicker == nil || _timePicker.superview == nil) {
        self.timePicker = [[AATimePickerView alloc] initWithFrame:CGRectMake(0, kDeviceHeight, kDeviceWidth, kTimeCustomHeight+20)withHour:NO];
        UIWindow *mWindow = [[[UIApplication sharedApplication] delegate] window];
          _timePicker.date=[dateFormatter dateFromString:_DataTimestr];
        if (!mWindow.isKeyWindow) {
            [mWindow makeKeyAndVisible];
            
        }
        
        __weak typeof(self) weakSelf = self;
        _timePicker.selectedBlock= ^ (NSInteger year, NSInteger month, NSInteger day, NSInteger hour, NSInteger minIndex, AATimePickerView *timePickerView) {
            
            NSString *date = [NSString stringWithFormat:@"%ld-%02ld-%02ld",(long)year,(long)month,(long)day];
             NSDate *nowDate = [dateFormatter dateFromString:date];
            NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:endDate toDate:nowDate options:0];
            NSInteger daynum = [components day] ;
            
            NSLog(@"aaaaaaaaaaaaaa%ldaaaaaaaaaaaaaaaaa",(long)daynum);
            
                     NSInteger days = [YXBTool daysBetweenTwoDaysWithEndDayStr:date];
            NSInteger yearD = [YXBTool yearBetweenTwoDateFromNowTo:date];
                
                NSLog(@"aaaaaaaaaaaaaa%ldaaaaaaaaaaaaaaaaa",(long)days);
            if (days > 1 && yearD <= 1){
                [weakSelf.button5 setSelected:YES];
                [weakSelf.Timebtn setTitle:date forState:UIControlStateNormal];
                [weakSelf.Timebtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
                if( daynum<=0){
                    weakSelf.tit.text = @"";
                    [ProgressHUD showSuccessWithStatus:@"请选择大于还款日期的日期"];
                    
                }
                else if( daynum>365){
                    weakSelf.tit.text =[NSString stringWithFormat:@""];
                    
                }else{

                 weakSelf.tit.text = [NSString stringWithFormat:@"延期时长%ld天",(long)daynum];
            }
            }
            else
            {
                
                if (days <= 1) {
                    [ProgressHUD showSuccessWithStatus:@"请选择大于当前还款日的日期"];
                    
                }else if(yearD > 1)
                {
                    [ProgressHUD showSuccessWithStatus:@"请选择一年以内的日期"];
                    
                }
                else
                {
                    [ProgressHUD showSuccessWithStatus:@"借款时长有误，请重新选择"];
                    
                }
            }
            

        };
        
        [mWindow addSubview:_timePicker];
        
        
    }
}

-(void)updateDurationLabelWithDate:(NSString *)date
{
    
    NSInteger days = [YXBTool daysBetweenTwoDaysWithEndDayStr:date]-1;
    self.tit.text = [NSString stringWithFormat:@"延期时长%ld天",(long)days];
}



- (void)buttonAction:(UIButton *)sender {
    if (sender.tag == 123456) {
        [self tapAction];
    }else if (sender.tag == 654321){
        [self endEditing:YES];
        if ([self.delegate respondsToSelector:@selector(YanqiConfirmClick)]){
            [self.delegate YanqiConfirmClick];
        }
    }
    
}



- (void)tapActions {
    [self endEditing:YES];
}


- (void)tapAction {
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)drawRect:(CGRect)rect {
    
}
//画虚线
-(void)drawLineInView:(UIView*)view AtPoint:(CGPoint)point AndWidthIs:(CGFloat)width{
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, width, 1)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:line.bounds];
    [shapeLayer setPosition:CGPointMake(line.bounds.size.width/2.0, line.bounds.size.height/2.0)];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    // 设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[rgb(100, 100, 100, 1) CGColor]];
    
    // 0.2f设置虚线的宽度（粗细）
    [shapeLayer setLineWidth:0.2f];
    
    // 3=线的宽度 1=每条线的间距
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:7],
      [NSNumber numberWithInt:2],nil]];
    
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, line.frame.size.width,0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [[line layer] addSublayer:shapeLayer];
    [view addSubview:line];
}



@end
