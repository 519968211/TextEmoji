//
//  MyCell1.m
//  TextEmoji
//
//  Created by 519968211 on 2019/12/3.
//  Copyright © 2019 sd3i. All rights reserved.
//

#import "MyCell1.h"

@implementation MyCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        NSMutableArray *mutArray = [NSMutableArray array];
        for(int i=0;i<4;i++)
        {
            UIButton *label1 = [UIButton buttonWithType:UIButtonTypeCustom];
            label1.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/4.0*i, 0, [[UIScreen mainScreen] bounds].size.width/4.0, 50);
            label1.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
            [label1 setTitleColor:[UIColor colorWithWhite:0.3 alpha:1] forState:UIControlStateNormal];
            [self.contentView addSubview:label1];
            [mutArray addObject:label1];
            
            if(i!=0)
            {
                UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/4.0*i, 0, 0.5, 50)];
                line1.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
                [self.contentView addSubview:line1];
            }
        }
        
        _buttonArray = [mutArray copy];
        
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, [[UIScreen mainScreen] bounds].size.width, 0.5)];
        line1.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
        [self.contentView addSubview:line1];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
