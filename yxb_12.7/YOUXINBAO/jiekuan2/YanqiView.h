//
//  YanqiView.h
//  YOUXINBAO
//
//  Created by Walice on 16/2/18.
//  Copyright © 2016年 北京全彩时代网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AATimePickerView.h"
#import "YXBLoanInfoDetails.h"
@protocol YanqiViewDelegate <NSObject>

- (void)YanqiConfirmClick;

@end



@interface YanqiView : UIView<UITextFieldDelegate>{

    UIView      *bgView;
   
    UITextField         *_textFiled2;
    CGRect kebordFrame;
    UILabel *label2;
    

}
@property (nonatomic,strong)YXBLoanInfoDetails *Model;
@property(nonatomic,strong) NSString*HuanKuanTimestr;
@property(nonatomic,strong) NSString*DataTimestr;
@property(nonatomic,strong)UILabel *labelnew1;
@property(nonatomic,strong) UITextField *textFiled1;
@property(nonatomic,strong) NSString*changeStr;
@property(nonatomic,retain)UITableView *tableView;
@property (nonatomic,strong)AATimePickerView *timePicker;
@property(nonatomic,strong)UIButton *button5;
@property(nonatomic,assign)id<YanqiViewDelegate>delegate;
@property(nonatomic,strong)UILabel *tit;
@property(nonatomic,strong)UIView *backview;
@property(nonatomic,strong)UIView *whiteView;
@property(nonatomic,strong)UIButton *Timebtn;


@end
