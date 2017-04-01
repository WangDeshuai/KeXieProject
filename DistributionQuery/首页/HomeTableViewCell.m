//
//  HomeTableViewCell.m
//  DistributionQuery
//
//  Created by Macx on 16/12/17.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "HomeTableViewCell.h"
@interface HomeTableViewCell()

@property (nonatomic,strong)UILabel * titleLabel;
@property (nonatomic,strong)UILabel * timeLabel;
@property (nonatomic,strong)UILabel * contentLabel;
@end
@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+(instancetype)cellWithTableView:(UITableView*)tableView CellID:(NSString*)cellID{
    HomeTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
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
    _dianImage=[UIImageView new];
    _titleLabel=[UILabel new];
    _contentLabel=[UILabel new];
    _timeLabel=[UILabel new];
    
    [self.contentView sd_addSubviews:@[_dianImage,_titleLabel,_contentLabel,_timeLabel]];
    
    _dianImage.image=[UIImage imageNamed:@"xxsh_bt"];
    _dianImage.hidden=YES;
    _titleLabel.font=[UIFont systemFontOfSize:17];
    _titleLabel.alpha=.7;
    
    _contentLabel.font=[UIFont systemFontOfSize:15];
    _contentLabel.alpha=.5;
    _contentLabel.numberOfLines=2;
    
    _timeLabel.font=[UIFont systemFontOfSize:14];
    _timeLabel.alpha=.5;
    
    //赋值
    _titleLabel.text=@"科技创新与产业发展专家论坛";
    _timeLabel.text=@"2016-11-20";
    _contentLabel.text=@"10月25日，工程师资格国际认证专家项目安排在石家庄市。刚打开了噶看过那噶看过那 ";
    //坐标
    _dianImage.sd_layout
    .leftSpaceToView(self.contentView,5)
    .topSpaceToView(self.contentView,15)
    .widthIs(5)
    .heightIs(5);
    
    //时间
    _timeLabel.sd_layout
    .rightSpaceToView(self.contentView,15)
    .centerYEqualToView(_dianImage)
    .heightIs(20);
    [_timeLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    //标题
    _titleLabel.sd_layout
    .leftSpaceToView(_dianImage,5)
    .centerYEqualToView(_dianImage)
    .rightSpaceToView(_timeLabel,5)
    .heightIs(20);
    //内容
    _contentLabel.sd_layout
    .leftEqualToView(_titleLabel)
    .rightSpaceToView(self.contentView,15)
    .topSpaceToView(_titleLabel,10)
    .heightIs(50);
    
    [self setupAutoHeightWithBottomView:_contentLabel bottomMargin:10];
    
    
}

-(void)setModel:(HomeModel *)model{
    _model=model;
    _titleLabel.text=model.titleName;
    _timeLabel.text=[ToolClass  nsdateToTime:model.timeName];
   // _contentLabel.text=@"10月25日，工程师资格国际认证专家项目安排在石家庄市。刚打开了噶看过那噶看过那 ";
    if ([model.isNew isEqualToString:@"0"]) {
        //不是新文章不带点fase
          _dianImage.hidden=YES;
    }else{
        //是新文章ture
          _dianImage.hidden=NO;
    }
     _contentLabel.attributedText=[ToolClass HTML:model.contentName];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
