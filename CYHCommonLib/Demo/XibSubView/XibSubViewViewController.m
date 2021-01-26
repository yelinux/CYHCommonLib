//
//  XibSubViewViewController.m
//  CYHCommonLib
//
//  Created by chenyehong on 2021/1/26.
//

#import "XibSubViewViewController.h"
#import "BackTopView.h"

@interface XibSubViewViewController ()

@property (weak, nonatomic) IBOutlet BackTopView *backTopView;

@end

@implementation XibSubViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.backTopView.btnBack addTarget:self action:@selector(clickClose) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickClose{
    [self dismissViewControllerAnimated:YES completion:nil];
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
