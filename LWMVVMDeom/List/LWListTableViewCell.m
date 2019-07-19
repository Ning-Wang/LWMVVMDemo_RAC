//
//  LWListTableViewCell.m
//  LWMVVMDeom
//
//  Created by xd on 2019/4/16.
//  Copyright © 2019年 lw. All rights reserved.
//

#import "LWListTableViewCell.h"
#import "LWCellViewModel.h"
@interface LWListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *picImageV;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *naeLabel;


@end

@implementation LWListTableViewCell


- (void)setModel:(LWCellViewModel *)model{
    _model = model;
    [self.picImageV sd_setImageWithURL:[NSURL URLWithString:_model.hotimg]];
    self.naeLabel.text = _model.hotname;
    self.idLabel.text = [NSString stringWithFormat:@"ID: %ld",_model.hotid];
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
