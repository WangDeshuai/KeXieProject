//
//  MessageShenHeCell.m
//  DistributionQuery
//
//  Created by Macx on 16/12/20.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "MessageShenHeCell.h"
@interface MessageShenHeCell()

@property (nonatomic,strong)UILabel * titleLabel;//标题
@property (nonatomic,strong)UILabel * timeLabel;//时间
@property (nonatomic,strong)UILabel * contentLabel;//内容
@property (nonatomic,strong)UIView * lineView;//线条
@property (nonatomic,strong)UILabel * kankanLabel;//去看看
@property (nonatomic,strong)UIImageView * backImage;//去看看


@end
@implementation MessageShenHeCell

+(instancetype)cellWithTableView:(UITableView*)tableView CellID:(NSString*)cellID{
    MessageShenHeCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[MessageShenHeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //  self.backgroundColor=[UIColor colorWithRed:254/255.0 green:251/255.0 blue:224/255.0 alpha:1];
        [self CreatStar];
    }
    return self;
}

-(void)CreatStar{
    _titleLabel=[UILabel new];
    _contentLabel=[UILabel new];
    _timeLabel=[UILabel new];
    
    [self.contentView sd_addSubviews:@[_titleLabel,_contentLabel,_timeLabel]];
    
    _titleLabel.font=[UIFont systemFontOfSize:16];
    _titleLabel.alpha=.7;
    
    _contentLabel.font=[UIFont systemFontOfSize:14];
    _contentLabel.alpha=.5;
    _contentLabel.numberOfLines=0;
    
    _timeLabel.font=[UIFont systemFontOfSize:14];
    _timeLabel.alpha=.5;
    
    //赋值
    _titleLabel.text=@"科技创新与产业发展专家论坛";
    _timeLabel.text=@"2016-11-20";
    _contentLabel.text=@"10月25日，工程师资格国际认证专家项目安排在石家庄市。刚打开了噶看过那噶看过那10月25日，工程师资格国际认证专家项目安排在石家庄市。刚打开了噶看过那噶看过那 ";
    
    //时间
    _timeLabel.sd_layout
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,10)
    .heightIs(20);
    [_timeLabel setSingleLineAutoResizeWithMaxWidth:200];

    //标题
    _titleLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(_timeLabel)
    .rightSpaceToView(_timeLabel,5)
    .heightIs(20);
    //内容
    _contentLabel.sd_layout
    .leftEqualToView(_titleLabel)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(_titleLabel,10)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:_contentLabel bottomMargin:10];
    
   //线条
    _lineView=[UIView new];
    _lineView.backgroundColor=COLOR;
    [self.contentView sd_addSubviews:@[_lineView]];
    _lineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .topSpaceToView(_contentLabel,15)
    .heightIs(1);
//去看看
    _kankanLabel=[UILabel new];
    _kankanLabel.text=@"去看看";
    _kankanLabel.alpha=.6;
    _kankanLabel.font=[UIFont systemFontOfSize:16];
    [self.contentView sd_addSubviews:@[_kankanLabel]];
    _kankanLabel.sd_layout
    .leftEqualToView(_contentLabel)
    .topSpaceToView(_lineView,10)
    .heightIs(20);
    [_kankanLabel setSingleLineAutoResizeWithMaxWidth:120];
    
    //箭头
    _backImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xxsh_arrow_right"]];
    [self.contentView sd_addSubviews:@[_backImage]];
    _backImage.sd_layout
    .rightSpaceToView(self.contentView,15)
    .centerYEqualToView(_kankanLabel)
    .widthIs(17/2)
    .heightIs(29/2);
    
    
}
-(void)setFrame:(CGRect)frame
{
    frame.origin.y+=10;
    frame.size.height-=10;
    frame.origin.x+=10;
    frame.size.width-=20;
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
