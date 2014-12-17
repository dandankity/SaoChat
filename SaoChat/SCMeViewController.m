#import <SDWebImage/UIImageView+WebCache.h>
#import "SCMeViewController.h"
#import "SCHeader.h"
#import <QuartzCore/QuartzCore.h>

@interface SCMeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIView *avatarMaskView;

@end

@implementation SCMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *avatarUrl = [[[NSUserDefaults standardUserDefaults] objectForKey:kCurrentUser] objectForKey:@"avatar_url"];
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:avatarUrl]
                        placeholderImage:[UIImage imageNamed:@"default_avatar.png"]];

    _avatarImageView.layer.borderColor = [UIColor grayColor].CGColor;
    _avatarImageView.layer.borderWidth = 3;
    _avatarImageView.layer.cornerRadius = _avatarImageView.frame.size.width / 2.0;
    _avatarImageView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
