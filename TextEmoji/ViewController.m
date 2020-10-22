//
//  ViewController.m
//  TextEmoji
//
//  Created by 519968211 on 2019/12/2.
//  Copyright © 2019 sd3i. All rights reserved.
//

#import "ViewController.h"
#import "EmojiViewController.h"

@interface ViewController () <UINavigationControllerDelegate>

@property (nonatomic, retain) NSArray<NSString *> *titleArray;
@property (nonatomic, retain) NSArray<NSString *> *emojiArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.delegate = self;

    
    _titleArray = @[@"happy", @"sad", @"surprised", @"pissed off", @"uncomfortable", @"sleepy", @"despise", @"lovely", @"strong", @"acting cute"];
    _emojiArray = @[@" (￣▽￣)ノ", @"(╯︵╰)", @"w(°ｏ°)w", @"<(－︿－)>", @"(︶︹︺)", @"［(－－)］zzz", @" t( -_- t )", @" (⊃｡•́‿•̀｡)⊃", @"ᕙ༼ຈل͜ຈ༽ᕗ", @"ヾ(=･ω･=)o"];
    
    for(int i=0;i<3;i++)
    {
        for(int j=0;j<4;j++)
        {
            if(j*3+i<10)
            {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(i*[[UIScreen mainScreen] bounds].size.width/3.0, 200+j*[[UIScreen mainScreen] bounds].size.width/4.0, [[UIScreen mainScreen] bounds].size.width/3.0, [[UIScreen mainScreen] bounds].size.width/4.0);
                button.tag = j*3+i;
                [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:button];
                
                UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width/3.0, [[UIScreen mainScreen] bounds].size.width/6.0)];
                label1.textColor = [UIColor colorWithWhite:0.3 alpha:1];
                label1.textAlignment = NSTextAlignmentCenter;
                label1.font = [UIFont fontWithName:@"Arial" size:20];
                label1.text = [_emojiArray objectAtIndex:button.tag];
                [button addSubview:label1];
                
                UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.width/6.0-[[UIScreen mainScreen] bounds].size.width/18.0, [[UIScreen mainScreen] bounds].size.width/3.0, [[UIScreen mainScreen] bounds].size.width/6.0)];
                label2.textColor = [UIColor blueColor];
                label2.textAlignment = NSTextAlignmentCenter;
                label2.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
                label2.text = [_titleArray objectAtIndex:button.tag];
                label2.numberOfLines = 0;
                [button addSubview:label2];
            }
        }
    }
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, [[UIScreen mainScreen] bounds].size.width-40, 150)];
    label1.textColor = [UIColor greenColor];
    label1.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    label1.text = @"     These are text emoji categories.Text emoji is an emoji that fully consisting of simple charactor.It's not an image,nor system's emoji.";
    label1.numberOfLines = 0;
    [self.view addSubview:label1];
}

- (void)buttonPress:(UIButton *)button
{
    EmojiViewController *vc = [[EmojiViewController alloc] init];
    vc.index = button.tag;
    vc.title = [_titleArray objectAtIndex:button.tag];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    navigationController.navigationBarHidden = (viewController == self);
}


@end
