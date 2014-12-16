#import "SCJoinViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "SCHeader.h"

@interface SCJoinViewController ()

@end

@implementation SCJoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction
- (IBAction)handleJoinAction:(id)sender {
    [self.nickNameField resignFirstResponder];
    NSString *nickName = self.nickNameField.text;
    NSLog(@"join thoughtworks chat with nick name: %@", nickName);

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"user[name]": nickName, @"user[avator_url]": @"http://tp4.sinaimg.cn/1655973031/180/5672535961/1"};

    [manager POST:@"http://localhost:3000/users.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [[NSUserDefaults standardUserDefaults] setObject:responseObject forKey:kCurrentUser];
        [[NSUserDefaults standardUserDefaults] synchronize];

        [self presentViewController:STORYBOARD_CONTROLLER(MAIN_CONTROLLER_ID)
                           animated:YES completion:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
