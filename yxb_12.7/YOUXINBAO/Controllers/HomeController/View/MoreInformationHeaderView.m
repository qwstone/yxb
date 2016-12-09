//
//  MoreInformationHeaderView.m
//  YOUXINBAO
//
//  Created by zjp on 16/1/30.
//  Copyright © 2016年 北京全彩时代网络科技有限公司. All rights reserved.
//

#import "MoreInformationHeaderView.h"

@implementation MoreInformationHeaderView {
    UILabel *_jiaoyihao;
    UILabel *_huankuanren;
    UILabel *_jiekuanzonge;
    UILabel *_zonglixi;
    UILabel *_shenqingshijian;
    UILabel *_huankuanshijian;
    UILabel *_huankuanfangshi;
    UILabel *_jiekuanyongtu;
    UILabel *_yanqi;
    UIImageView *_yanqiimg;
    UIImageView *img1;
    UIImageView *img2;
    UIImageView *img;


}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)createView {
    
    img1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.width/580*17)];
    UIImage *imgss = [UIImage imageNamed:@"morexx-top"];
    img1.image = imgss;
    [self addSubview:img1];
    
    img2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, img1.bottom, self.width, kDeviceWidth/640*270-img1.bottom)];
    UIImage *imgsss = [UIImage imageNamed:@"morexx-con"];
    img2.image = imgsss;
    [self addSubview:img2];

    _jiaoyihao = [[UILabel alloc] initWithFrame:CGRectMake(15, kDeviceWidth/640*29, kDeviceWidth/640*515, 12)];
    _jiaoyihao.font = [UIFont systemFontOfSize:12];
    _jiaoyihao.textColor = [UIColor lightGrayColor];
    [_jiaoyihao setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:_jiaoyihao];
    
    
    _huankuanren = [[UILabel alloc] initWithFrame:CGRectMake(15, kDeviceWidth/640*75, kDeviceWidth/640*515, 12)];
    _huankuanren.font = [UIFont systemFontOfSize:12];
    _huankuanren.textColor = [UIColor lightGrayColor];
     [_huankuanren setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:_huankuanren];
    
    
    _jiekuanzonge = [[UILabel alloc] initWithFrame:CGRectMake(15, kDeviceWidth/640*125, self.width/2-15, 12)];
    _jiekuanzonge.font = [UIFont systemFontOfSize:12];
    _jiekuanzonge.textColor = [UIColor lightGrayColor];
     [_jiekuanzonge setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:_jiekuanzonge];
    
    _zonglixi = [[UILabel alloc] initWithFrame:CGRectMake(self.width/2, kDeviceWidth/640*125, self.width/2, 12)];
    _zonglixi.font = [UIFont systemFontOfSize:12];
    _zonglixi.textColor = [UIColor lightGrayColor];
     [_zonglixi setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:_zonglixi];
    
    _shenqingshijian = [[UILabel alloc] initWithFrame:CGRectMake(15, kDeviceWidth/640*175, self.width/2-15, 12)];
    _shenqingshijian.font = [UIFont systemFontOfSize:12];
    _shenqingshijian.textColor = [UIColor lightGrayColor];
     [_shenqingshijian setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:_shenqingshijian];
    
    
    _huankuanshijian = [[UILabel alloc] initWithFrame:CGRectMake(self.width/2, kDeviceWidth/640*175, self.width/2, 12)];
    _huankuanshijian.font = [UIFont systemFontOfSize:12];
    _huankuanshijian.textColor = [UIColor lightGrayColor];
     [_huankuanshijian setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:_huankuanshijian];
    
    
    _huankuanfangshi = [[UILabel alloc] initWithFrame:CGRectMake(15, kDeviceWidth/640*225, self.width/2-15, 12)];
    _huankuanfangshi.font = [UIFont systemFontOfSize:12];
    _huankuanfangshi.textColor = [UIColor lightGrayColor];
     [_huankuanfangshi setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:_huankuanfangshi];
    
    
    _jiekuanyongtu = [[UILabel alloc] initWithFrame:CGRectMake(self.width/2, kDeviceWidth/640*225, self.width/2, 12)];
    _jiekuanyongtu.font = [UIFont systemFontOfSize:12];
    _jiekuanyongtu.textColor = [UIColor lightGrayColor];
     [_jiekuanyongtu setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:_jiekuanyongtu];
    
    
    
    _yanqiimg = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/580*454, 0, self.width/580*126, self.width/580*92)];
    UIImage *im = [UIImage imageNamed:@"yanqijietiao"];
    _yanqiimg.image = im;
    [self addSubview:_yanqiimg];
    _yanqi = [[UILabel alloc] initWithFrame:CGRectMake(15, kDeviceWidth/640*275, self.width/2-15, 12)];
    _yanqi.font = [UIFont systemFontOfSize:12];
    _yanqi.textColor = [UIColor lightGrayColor];
    [_yanqi setAdjustsFontSizeToFitWidth:YES];
    [self addSubview:_yanqi];
    
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(0, kDeviceWidth/640*270, self.width, kDeviceWidth/640*85)];
    img.image = [UIImage imageNamed:@"morexx-zdxx"];
    [self addSubview:img];
    
}


- (void)setModel:(LoanMoreInfo *)model {
    if (_model != model) {
        _model = model;
    }
    
    [self setdata];
}


- (void)setdata {
    NSString *jiaoyihao = [NSString stringWithFormat:@"交易号  %@",_model.tradeID];
    NSMutableAttributedString* strLabel = [[NSMutableAttributedString alloc] initWithString:jiaoyihao];
    [strLabel addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                     range:[jiaoyihao rangeOfString:[NSString stringWithFormat:@"%@",_model.tradeID]]];
    _jiaoyihao.attributedText = strLabel;
    
    
    NSString *huankuanren = [NSString stringWithFormat:@"借款人  %@",_model.name];
    NSMutableAttributedString* strLabel1 = [[NSMutableAttributedString alloc] initWithString:huankuanren];
    [strLabel1 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                     range:[huankuanren rangeOfString:[NSString stringWithFormat:@"%@",_model.name]]];
    _huankuanren.attributedText = strLabel1;
    
    NSString *jiekuanzonge = [NSString stringWithFormat:@"借款总额  %@元",_model.money];
    NSMutableAttributedString* strLabel2 = [[NSMutableAttributedString alloc] initWithString:jiekuanzonge];
    [strLabel2 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]
                      range:[jiekuanzonge rangeOfString:[NSString stringWithFormat:@"%@",_model.money]]];
    [strLabel2 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                      range:[jiekuanzonge rangeOfString:[NSString stringWithFormat:@"元"]]];
    _jiekuanzonge.attributedText = strLabel2;
    
    
    NSString *zonglixi = [NSString stringWithFormat:@"总利息  %@元",_model.interest];
    NSMutableAttributedString* strLabel3 = [[NSMutableAttributedString alloc] initWithString:zonglixi];
    [strLabel3 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                      range:[zonglixi rangeOfString:[NSString stringWithFormat:@"%@元",_model.interest]]];
    _zonglixi.attributedText = strLabel3;
    
    
    NSString *shenqingshijian = [NSString stringWithFormat:@"申请时间  %@",_model.askTime];
    NSMutableAttributedString* strLabel4 = [[NSMutableAttributedString alloc] initWithString:shenqingshijian];
    [strLabel4 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                      range:[shenqingshijian rangeOfString:[NSString stringWithFormat:@"%@",_model.askTime]]];
    _shenqingshijian.attributedText = strLabel4;
    
    
    NSString *huankuanshijian = [NSString stringWithFormat:@"还款时间  %@",_model.payTime];
    NSMutableAttributedString* strLabel5 = [[NSMutableAttributedString alloc] initWithString:huankuanshijian];
    [strLabel5 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                      range:[huankuanshijian rangeOfString:[NSString stringWithFormat:@"%@",_model.payTime]]];
    _huankuanshijian.attributedText = strLabel5;
    
    

    
    NSString *huankuanfanshi = [NSString stringWithFormat:@"还款方式  %@",_model.payMode];
    NSMutableAttributedString* strLabel6 = [[NSMutableAttributedString alloc] initWithString:huankuanfanshi];
    [strLabel6 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                      range:[huankuanfanshi rangeOfString:[NSString stringWithFormat:@"%@",_model.payMode]]];
    _huankuanfangshi.attributedText = strLabel6;
    
    
    NSString *jiekuanyongtu = [NSString stringWithFormat:@"借款用途  %@",_model.payPurpose];
    NSMutableAttributedString* strLabel7 = [[NSMutableAttributedString alloc] initWithString:jiekuanyongtu];
    [strLabel7 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                      range:[jiekuanyongtu rangeOfString:[NSString stringWithFormat:@"%@",_model.payPurpose]]];
    _jiekuanyongtu.attributedText = strLabel7;
    
    
    
    if (_model.hasDelay == 1) {
        img2.height = kDeviceWidth/640*50 + kDeviceWidth/640*270-img1.bottom;
        img.top = kDeviceWidth/640*50+kDeviceWidth/640*270;
        _yanqiimg.hidden = NO;
        NSString *yanqi = [NSString stringWithFormat:@"补偿金额  %@",_model.deleyMoney];
        NSMutableAttributedString* strLabel8 = [[NSMutableAttributedString alloc] initWithString:yanqi];
        [strLabel8 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]
                          range:[yanqi rangeOfString:[NSString stringWithFormat:@"%@",_model.deleyMoney]]];
        _yanqi.attributedText = strLabel8;
    }else if (_model.hasDelay == 0){
        _yanqiimg.hidden = YES;
        img2.height = kDeviceWidth/640*270-img1.bottom;
        img.top = kDeviceWidth/640*270;
    }



}
@end
