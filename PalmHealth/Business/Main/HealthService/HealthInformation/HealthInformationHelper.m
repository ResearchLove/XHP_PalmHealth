//
//  HealthInformationHelper.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/20.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthInformationHelper.h"
#import "HealthInformationModel.h"

@implementation HealthInformationHelper

-(id)init
{
    if (self = [super init]) {
        self.dataAry = [[NSMutableArray alloc]init];
        [self initTextData];
    }
    return self;
}

-(void)initTextData
{
    HealthInformationModel *heaInfModelOne = [[HealthInformationModel alloc]init];
    heaInfModelOne.imageURL = @"heartRate.jpg";
    heaInfModelOne.title = @"把握心率诀窍，让减肥事半功倍";
    heaInfModelOne.subTitle = @"心率是科学评价跑步运动强度最有效、最真实的指标之一，跑友们要根据自己不同的跑步目的，是为了健康？为了减肥？还是为了提高配速？";
    heaInfModelOne.detailsURL = @"https://weixin.chunyuyisheng.com/webapp/news/81576/detail/";
    [self.dataAry addObject:heaInfModelOne];
    
    HealthInformationModel *heaInfModelTwo = [[HealthInformationModel alloc]init];
    heaInfModelTwo.imageURL = @"brotherhood.jpg";
    heaInfModelTwo.title = @"手足口病高发期，你猜板蓝根能有啥用？";
    heaInfModelTwo.subTitle = @"目前没有任何科学研究证明板蓝根能有效预防和治疗手足口病，不建议。";
    heaInfModelTwo.detailsURL = @"https://weixin.chunyuyisheng.com/webapp/news/81570/detail/";
    [self.dataAry addObject:heaInfModelTwo];
    
    HealthInformationModel *heaInfModelThree = [[HealthInformationModel alloc]init];
    heaInfModelThree.imageURL = @"loseWeight.jpg";
    heaInfModelThree.title = @"想减肥，必须吃低脂食物吗？";
    heaInfModelThree.subTitle = @"减肥“限脂”的正确“姿势”是，少吃动物脂肪，而多吃牛油果、坚果等富含不饱和脂肪的食物，在保护心脏的同时保持体重，享瘦又健康。";
    heaInfModelThree.detailsURL = @"https://weixin.chunyuyisheng.com/webapp/news/81483/detail/";
    [self.dataAry addObject:heaInfModelThree];
    
    HealthInformationModel *heaInfModelFour = [[HealthInformationModel alloc]init];
    heaInfModelFour.imageURL = @"washDishes.jpg";
    heaInfModelFour.title = @"专家教你科学洗菜：轻轻松松去除农残！";
    heaInfModelFour.subTitle = @"北京农业质量标准与检测技术研究中心的专家曾提到，目前根据市面农药抽检的结果，至少北京地区农药残留超标的情况非常少见，我们在日常购买、食用果蔬时不必过分紧张。";
    heaInfModelFour.detailsURL = @"https://weixin.chunyuyisheng.com/webapp/news/81429/detail/";
    [self.dataAry addObject:heaInfModelOne];
    
    HealthInformationModel *heaInfModelFive = [[HealthInformationModel alloc]init];
    heaInfModelFive.imageURL = @"disease.jpg";
    heaInfModelFive.title = @"城市人比农村人更容易得哪些病？";
    heaInfModelFive.subTitle = @"世界卫生组织（WHO）曾报告，个人的健康和寿命60%取决于自身生活方式，15%取决于遗传，10%取决于社会因素，8%取决于医疗条件，7%取决于气候影响。而城市居民不良的生活方式，加上城市中的汽车尾气和工业污染，让城市人的健康状况堪忧。";
    heaInfModelFive.detailsURL = @"https://weixin.chunyuyisheng.com/webapp/news/81408/detail/";
    [self.dataAry addObject:heaInfModelFive];
    
    HealthInformationModel *heaInfModelSix = [[HealthInformationModel alloc]init];
    heaInfModelSix.imageURL = @"thegym.jpg";
    heaInfModelSix.title = @"没空去健身房，在家怎么练减肥最快？";
    heaInfModelSix.subTitle = @"HIIT，不仅超强燃脂，还能保持更多瘦体重，不光瘦得快，还能瘦得持久！教大家四个超强燃脂姿势，居家也能轻松瘦全身！";
    heaInfModelSix.detailsURL = @"https://weixin.chunyuyisheng.com/webapp/news/81264/detail/";
    [self.dataAry addObject:heaInfModelSix];
    
    HealthInformationModel *heaInfModelSeven = [[HealthInformationModel alloc]init];
    heaInfModelSeven.imageURL = @"havefever.jpg";
    heaInfModelSeven.title = @"体温37.5℃，算不算发烧？";
    heaInfModelSeven.subTitle = @"不一定。测量的部位不同、时机不同，正常体温也不同。";
    heaInfModelSeven.detailsURL = @"https://weixin.chunyuyisheng.com/webapp/news/81294/detail/";
    [self.dataAry addObject:heaInfModelSeven];
    
    HealthInformationModel *heaInfModelEight = [[HealthInformationModel alloc]init];
    heaInfModelEight.imageURL = @"movement.jpg";
    heaInfModelEight.title = @"运动到这个程度，才能算有效";
    heaInfModelEight.subTitle = @"运动后有饥饿感，力量训练后肌肉有膨胀感，有氧运动时心率增加，是运动有效的显著标志。";
    heaInfModelEight.detailsURL = @"https://weixin.chunyuyisheng.com/webapp/news/81177/detail/";
    [self.dataAry addObject:heaInfModelEight];
    
    HealthInformationModel *heaInfModelNine = [[HealthInformationModel alloc]init];
    heaInfModelNine.imageURL = @"easily.jpg";
    heaInfModelNine.title = @"这样做轻松拥有小蛮腰！大长腿！";
    heaInfModelNine.subTitle = @"事情太多，没时间运动！也不想动！然后肚子变得肉肉的，慢慢的全身都变得肉肉的！有时，高品质的生活习惯，不仅让你变得气质变好，皮肤变嫩，更有可能获得小细腰，大长腿哦。15个生活小建议，即使做到其中的3个，你会变得更好！";
    heaInfModelNine.detailsURL = @"https://weixin.chunyuyisheng.com/webapp/news/81147/detail/";
    [self.dataAry addObject:heaInfModelNine];
    
    
    
}

@end
