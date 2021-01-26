//
//  ViewController.m
//  CYHCommonLib
//
//  Created by chenyehong on 2021/1/26.
//

#import "ViewController.h"
#import "XibSubViewViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickxIb:(id)sender {
    XibSubViewViewController *vc = [[XibSubViewViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
