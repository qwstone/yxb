#import <objc/runtime.h>

#import "LoanMoreInfo.h"
#import "LoanMoreInfoDetail.h"

@implementation LoanMoreInfo

-(void)dealloc
{
//  [super dealloc];
}
-(void) decodeWithSubArray:(NSArray*) arr withPropertyName:(NSString*) name {
    if ([name isEqualToString:@"participants"]) {
        self.participants = [[NSMutableArray alloc] init];
        for (int i = 0; i < [arr count]; i++) {
            NSDictionary* dicClass = [arr objectAtIndex:i];
            LoanMoreInfoDetail* obj = [[LoanMoreInfoDetail alloc] init];
            [obj decodeWithDic:dicClass];
            [self.participants addObject:obj];
        }
    }
}
@end
