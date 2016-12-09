//
//  MoreInformationViewController.m
//  YOUXINBAO
//
//  Created by zjp on 16/1/30.
//  Copyright © 2016年 北京全彩时代网络科技有限公司. All rights reserved.
//

#import "MoreInformationViewController.h"
#import "MoreInformationHeaderView.h"
#import "LoanManagerV9.h"
#import "BillDetailCell.h"
#import "MyLoanViewController.h"
#import "YXBTool.h"

//@class MyLoanViewController;
#define MoreInfoRightURL @"http://www.51jt.com/webView/helpcenter/purse-rule.jsp?a=1"
@interface MoreInformationViewController ()
{

    int page;
    MoreInformationHeaderView *view;
    UIImageView *nullImg;
    UIImageView *wanimage;
    UIView *foot;
}

@end

@implementation MoreInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftView];
    [self createNavBar];
    self.title=@"更多信息";
   
    _tableView=[[QCBaseTableView alloc]initWithFrame:CGRectMake(15, 13, kDeviceWidth-30, kDeviceHeight-64-15)style:UITableViewStylePlain refreshFooter:NO];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.refreshDelegate = self;
    _tableView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_tableView];
    
    
    
    view = [[MoreInformationHeaderView alloc] initWithFrame:CGRectMake(15, 15, kDeviceWidth-30, kDeviceHeight)];
    view.backgroundColor = [UIColor whiteColor];
    _dataArray=[NSMutableArray new];
    
    
    foot=[[UIView alloc]initWithFrame:CGRectMake(0, 0, _tableView.width, 200)];
    nullImg=[[UIImageView alloc]initWithFrame:CGRectMake((_tableView.width-210)/2, 40, 210, 90)];
    nullImg.image=[UIImage imageNamed:@"morexx_weizhang"];
    [foot addSubview:nullImg];
   
    
   wanimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _tableView.width, 9)];
    wanimage.image=[UIImage imageNamed:@"morexx-foot"];
    
}
-(void)leftClicked{
  
    NSArray *arr = self.navigationController.viewControllers;
    MyLoanViewController *myvc=nil;
    for (QCBaseViewController *vc in arr) {
        if ([vc isKindOfClass:[MyLoanViewController class]]) {
             myvc= (MyLoanViewController *)vc;
            myvc.isFromVideo = NO;
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
  
}
- (void)createNavBar {
  
    [self setNavigationButtonItrmWithiamge:@"MoreInfoRight3" withRightOrleft:@"right" withtargrt:self withAction:@selector(navkefurightAction)];
}
-(void)navkefurightAction {
    NSString *url = [YXBTool getURL:MoreInfoRightURL params:nil];
    [YXBTool jumpInnerSafaryWithUrl:url hasTopBar:YES titleName:@"分期规则"];
}
#pragma mark -----------------------------------------------HttpDownLoad

- (void)httpDowloadWithListStyle
{
    if (self.iHttpOperator == nil) {
        self.iHttpOperator = [[HttpOperator alloc]init];
        
    }
    [self.iHttpOperator cancel];
    
    
    __weak HttpOperator * assginHtttperator = _iHttpOperator;
    __weak MoreInformationViewController *this = self;
    [self.iHttpOperator connetStart:^(int d) {
        
    } cancel:^(int d) {
        
    } error:^(int d, THttpOperatorErrorCode error) {
        
        if (error == EHttp_Operator_Failed) {
            //服务器挂了
            UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:nil message:@"加载失败,请检查手机网络" delegate:this cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alterView show];
            //            [this.tableView reloadDeals];
            [ProgressHUD dismiss];
        }
        
    } param:^(NSString *s) {
        
        [this httpLOadParams:s httpOperation:assginHtttperator];
        
    } complete:^(LoanMoreInfo * r, int taskid) {
        [this httpLoadComplete:r];
    }];
    [self.iHttpOperator connect];
    
}
//上传参数
- (void)httpLOadParams:(NSString *)s httpOperation:(HttpOperator *)httpOperation
{
    LoanManagerV9 *_activityM = (LoanManagerV9 *)[httpOperation getAopInstance:[LoanManagerV9 class] returnValue:[LoanMoreInfo class]];
    QCUserModel * userModel = [[QCUserManager sharedInstance]getLoginUser];
    NSString *userToken = userModel.user.yxbToken;
    if ((userToken != nil) && [userToken length] > 0)
    {
        
        [_activityM getLoanMoreInfo:userToken loanID:self.loanId];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"您尚未登录" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    
}
//请求完成
-(void)httpLoadComplete:(LoanMoreInfo *)r{
    if (r.errCode==0) {

        self.detail=r;
        view.model=r;
        self.dataArray = _detail.participants;
        [self.tableView reloadData];
        [self.tableView reloadDeals];
        
        if (_detail.participants.count==0) {
            nullImg.hidden=NO;
            _tableView.tableFooterView=foot;
            
        }
        else{
        _tableView.tableFooterView=wanimage;
        }
    }
   
}


#pragma mark  --------------------------- refresh
//下拉刷新

- (void)QCBaseTableViewDidPullDownRefreshed:(QCBaseTableView *)tableView {
    page = MessageCenterPageNOStart;
    [self httpDowloadWithListStyle];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (self.detail.hasDelay == 1) {
        return kDeviceWidth/640*50 + kDeviceWidth/640*355;
    }else if (self.detail.hasDelay == 0){
        return kDeviceWidth/640*355;
    }
    return 0;
}
//加载更多
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float h = scrollView.contentOffset.y + scrollView.height - scrollView.contentSize.height;
    if (h > 30 && !self.tableView.isRefresh && self.tableView.hasFooter == YES) {
        if (_dataArray.count%20==0) {
            page ++;
            [self httpDowloadWithListStyle];
        }else {
            
        }
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellId = @"BillDetailCell";
    BillDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[BillDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if(_dataArray.count > 0){
        LoanMoreInfoDetail *model=_dataArray[indexPath.row];
        cell.model=model;
        cell.index=indexPath.row+1;
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
