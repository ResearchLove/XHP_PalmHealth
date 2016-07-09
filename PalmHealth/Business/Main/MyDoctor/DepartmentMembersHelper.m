//
//  DepartmentMembersHelper.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/22.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "DepartmentMembersHelper.h"

@implementation DepartmentMembersHelper

-(id)init
{
    self = [super init];
    if (self) {
        self.dataAry = [[NSMutableArray alloc]init];
        [self initTextData];
    }
    return self;
}

-(void)initTextData
{
    MyDoctorModel *myDoctorModelOne = [[MyDoctorModel alloc]init];
    myDoctorModelOne.userId = 1;
    myDoctorModelOne.avatarURL = @"pengling.jpg";
    myDoctorModelOne.userName = @"彭林";
    myDoctorModelOne.hospitalName = @"广东省人民医院";
    myDoctorModelOne.departmentName = @"外科专家";
    myDoctorModelOne.doctorLevel = @"主任医师、教授";
    myDoctorModelOne.userIntroduce = @"医和你首席顾问专家，广东省人民医院血管甲状腺腹壁疝外壳科室主任，南方医科大学兼职教授，主要从事血管外科，甲状腺疾病，疝及腹壁外科疾病的现代治疗和微创手术。主持完成广东省科技计划项目。";
    myDoctorModelOne.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=7";
    myDoctorModelOne.appointmentURL = @"http://m.yiheni.net/col.jsp?id=104";
    myDoctorModelOne.isFollow = 0;
    
    MyDoctorModel *myDoctorModelTwo = [[MyDoctorModel alloc]init];
    myDoctorModelTwo.userId = 2;
    myDoctorModelTwo.avatarURL = @"jianglingyi.jpg";
    myDoctorModelTwo.userName = @"蒋宁一";
    myDoctorModelTwo.hospitalName = @"广东省人民医院";
    myDoctorModelTwo.departmentName = @"核医学科专家";
    myDoctorModelTwo.doctorLevel = @"主任医师、教授";
    myDoctorModelTwo.userIntroduce = @"医和你首席顾问专家，中山大学孙逸仙纪念医院核医学科原科室主任，主要从事甲状腺疾病的诊治，甲状腺疾病与妊娠的指导与管理，特别是碘131治疗甲亢等";
    myDoctorModelTwo.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=8";
    myDoctorModelTwo.appointmentURL = @"http://m.yiheni.net/col.jsp?id=109";
    myDoctorModelTwo.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelThree = [[MyDoctorModel alloc]init];
    myDoctorModelThree.userId = 3;
    myDoctorModelThree.avatarURL = @"huangkai.jpg";
    myDoctorModelThree.userName = @"黄侃";
    myDoctorModelThree.hospitalName = @"南方医科大学";
    myDoctorModelThree.departmentName = @"外科专家";
    myDoctorModelThree.doctorLevel = @"主治医生";
    myDoctorModelThree.userIntroduce = @"主要从事血管外科，甲状腺疾病，疝及腹壁外科疾病的临床诊断和治疗，本科毕业于南方医科大学，动脉闭塞性病变，静脉血栓，下肢静脉曲张，动脉闭塞性病变，静脉血栓，下肢静脉曲张，动脉闭塞性病变，静脉血栓，下肢静脉曲张，动脉闭塞性病变，静脉血栓，下肢静脉曲张，参与多项省市级研究，在国内外核心医学期刊发表论文十余篇。";
    myDoctorModelThree.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=12";
    myDoctorModelThree.appointmentURL = @"http://m.yiheni.net/col.jsp?id=110";
    myDoctorModelThree.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelFour = [[MyDoctorModel alloc]init];
    myDoctorModelFour.userId = 4;
    myDoctorModelFour.avatarURL = @"liudabo.jpg";
    myDoctorModelFour.userName = @"刘大波";
    myDoctorModelFour.hospitalName = @"广州市妇女儿童医院";
    myDoctorModelFour.departmentName = @"耳鼻喉科专家";
    myDoctorModelFour.doctorLevel = @"主任医师、教授";
    myDoctorModelFour.userIntroduce = @"医和你首席顾问专家，同济医科大学耳鼻喉科专业硕士毕业，毕业后留在同济医科大学附属协和医院工作多年后调入广州市儿童医院工作。曾在美国斯坦福大学进修睡眠医学。芝加哥HOPE儿童医院进行小儿耳鼻喉科专业训练。同济医科大学耳鼻喉科专业硕士毕业，毕业后留在同济医科大学附属协和医院工作多年后调入广州市儿童医院工作。曾在美国斯坦福大学进修睡眠医学。芝加哥HOPE儿童医院进行小儿耳鼻喉科专业训练";
    myDoctorModelFour.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=11";
    myDoctorModelFour.appointmentURL = @"http://m.yiheni.net/col.jsp?id=116";
    myDoctorModelFour.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelFive = [[MyDoctorModel alloc]init];
    myDoctorModelFive.userId = 5;
    myDoctorModelFive.avatarURL = @"zhoulifeng.jpg";
    myDoctorModelFive.userName = @"周丽枫";
    myDoctorModelFive.hospitalName = @"广州市妇女儿童医院";
    myDoctorModelFive.departmentName = @"耳鼻喉科专家";
    myDoctorModelFive.doctorLevel = @"主任医师";
    myDoctorModelFive.userIntroduce = @"医和你首席顾问专家，过敏性皮炎，鼻窦科，1995年毕业于哈尔滨医科大学耳鼻喉科专业，在哈尔滨儿童医院耳鼻喉科工作4年，2002年暨南大学医学院耳鼻喉科研究生毕业，获得医学硕士学位。1995年毕业于哈尔滨医科大学耳鼻喉科专业，在哈尔滨儿童医院耳鼻喉科工作4年，2002年暨南大学医学院耳鼻喉科研究生毕业，获得医学硕士学位。";
    myDoctorModelFive.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=23";
    myDoctorModelFive.appointmentURL = @"http://m.yiheni.net/col.jsp?id=126";
    myDoctorModelFive.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelSix = [[MyDoctorModel alloc]init];
    myDoctorModelSix.userId = 6;
    myDoctorModelSix.avatarURL = @"leishangtong.jpg";
    myDoctorModelSix.userName = @"雷尚通";
    myDoctorModelSix.hospitalName = @"南方医科大学";
    myDoctorModelSix.departmentName = @"普外科专家";
    myDoctorModelSix.doctorLevel = @"副主任医师，副教授，医学博士";
    myDoctorModelSix.userIntroduce = @"专业从事甲状腺，旁腺疾病及肥胖尿糖病的外科治疗。社会兼职:中华医学朝肠外肠内营养学分会青年委员会副主任委员、中华医学朝肠外肠内营养学分会青年委员会副主任委员、中华医学朝肠外肠内营养学分会青年委员会副主任委员";
    myDoctorModelSix.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=25";
    myDoctorModelSix.appointmentURL = @"http://m.yiheni.net/col.jsp?id=129";
    myDoctorModelSix.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelSeven = [[MyDoctorModel alloc]init];
    myDoctorModelSeven.userId = 7;
    myDoctorModelSeven.avatarURL = @"guohaike.jpg";
    myDoctorModelSeven.userName = @"郭海科";
    myDoctorModelSeven.hospitalName = @"广州爱尔眼科医院";
    myDoctorModelSeven.departmentName = @"眼科专家";
    myDoctorModelSeven.doctorLevel = @"医学博士、教授、博士生导师、副院长";
    myDoctorModelSeven.userIntroduce = @"现任艾尔眼科集团白内障事业部总监兼艾尔河南区域CEO及河南艾尔眼科医院医院院长，广州艾尔眼科医院副院长。社会兼职:中南大学爱尔眼科学院副院长。河南省医学会眼科学分会主任委员、中华医学会眼科学分会白内障学组委员";
    myDoctorModelSeven.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=17";
    myDoctorModelSeven.appointmentURL = @"http://m.yiheni.net/col.jsp?id=120";
    myDoctorModelSeven.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelEight = [[MyDoctorModel alloc]init];
    myDoctorModelEight.userId = 8;
    myDoctorModelEight.avatarURL = @"zengjing.jpg";
    myDoctorModelEight.userName = @"曾锦";
    myDoctorModelEight.hospitalName = @"广东省人民医院";
    myDoctorModelEight.departmentName = @"眼科专家";
    myDoctorModelEight.doctorLevel = @"主任医师";
    myDoctorModelEight.userIntroduce = @"医和你首席顾问专家，儿童及成人斜弱视治疗;视疲劳及干眼症的综合治疗;各类型青光眼及白内障的诊断治疗；近视，远视。闪光的飞秒激光治疗；高度近视眼眼内浸提植入，高度近视眼眼内浸提植入高度近视眼眼内浸提植入。";
    myDoctorModelEight.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=15";
    myDoctorModelEight.appointmentURL = @"http://m.yiheni.net/col.jsp?id=118";
    myDoctorModelEight.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelNine = [[MyDoctorModel alloc]init];
    myDoctorModelNine.userId = 9;
    myDoctorModelNine.avatarURL = @"liqian.jpg";
    myDoctorModelNine.userName = @"李倩";
    myDoctorModelNine.hospitalName = @"医和你治疗中心眼科事业部运营总监";
    myDoctorModelNine.departmentName = @"眼科专家";
    myDoctorModelNine.doctorLevel = @"主治医师";
    myDoctorModelNine.userIntroduce = @"小儿斜，弱视的诊断和治疗，以及青少年近视的防控，毕业于同济医科大学，2002年至2013年就职于广东省人民医院眼科，从事眼科临床工作十余年，对眼科常见病得治疗有丰富的临床经验，擅长小儿斜、弱视的诊断和治疗，以及青少年近视的防控。2013年赴美国健康科学西部大学眼科治疗中心学习，主攻视觉治疗。";
    myDoctorModelNine.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=19";
    myDoctorModelNine.appointmentURL = @"http://m.yiheni.net/col.jsp?id=124";
    myDoctorModelNine.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelTen = [[MyDoctorModel alloc]init];
    myDoctorModelTen.userId = 10;
    myDoctorModelTen.avatarURL = @"zhanghongyang.jpg";
    myDoctorModelTen.userName = @"张洪洋";
    myDoctorModelTen.hospitalName = @"广东省人民医院";
    myDoctorModelTen.departmentName = @"眼科专家";
    myDoctorModelTen.doctorLevel = @"副主任医师";
    myDoctorModelTen.userIntroduce = @"从事眼科临床，科研，教学，防盲致盲工作十余年，具有丰富的临床经验，师从我国著名的眼科专家郭海科教授，博士毕业于中山大学眼科中心，获得青光眼的早期诊断和药物治疗，激光及手术治疗，尤其是原声性闭角型青光眼及青光眼白内障联合手术治疗方面具有丰富的临床经验。";
    myDoctorModelTen.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=26";
    myDoctorModelTen.appointmentURL = @"http://m.yiheni.net/col.jsp?id=134";
    myDoctorModelTen.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelEleven = [[MyDoctorModel alloc]init];
    myDoctorModelEleven.userId = 11;
    myDoctorModelEleven.avatarURL = @"jingdan.jpg";
    myDoctorModelEleven.userName = @"金丹";
    myDoctorModelEleven.hospitalName = @"南方医科大学南方医院";
    myDoctorModelEleven.departmentName = @"创伤骨科专家";
    myDoctorModelEleven.doctorLevel = @"主任医师、教授";
    myDoctorModelEleven.userIntroduce = @"灵床工作重点为四肢严重骨与关节损伤的救治，尤其是自足踝关节、足部运动损伤的诊断治疗 ";
    myDoctorModelEleven.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=21";
    myDoctorModelEleven.appointmentURL = @"http://m.yiheni.net/col.jsp?id=122";
    myDoctorModelEleven.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelTwelve = [[MyDoctorModel alloc]init];
    myDoctorModelTwelve.userId = 12;
    myDoctorModelTwelve.avatarURL = @"wanshanfeng.jpg";
    myDoctorModelTwelve.userName = @"王三峰";
    myDoctorModelTwelve.hospitalName = @"广东省妇幼保健院";
    myDoctorModelTwelve.departmentName = @"妇科专家";
    myDoctorModelTwelve.doctorLevel = @"副主任医师、博士";
    myDoctorModelTwelve.userIntroduce = @"对子宫肌瘤、卵巢肿瘤的微创治疗，对宫颈病变的规范化诊治及管理有较深的造诣。从事妇产科临床工作10余年，对妇产科常见疾病的诊治有丰富的临床经验，目前主要侧重于妇科肿瘤的治疗工作，擅长经阴道及妇科宫腔镜、腹腔镜手术;擅长子宫肌瘤。复发性流产的诊治。社会兼职:兼任省妇幼保健协会生殖道感染专家委员会秘书。";
    myDoctorModelTwelve.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=28";
    myDoctorModelTwelve.appointmentURL = @"http://m.yiheni.net/col.jsp?id=136";
    myDoctorModelTwelve.isFollow = 0;
    
    
    MyDoctorModel *myDoctorModelThirteen = [[MyDoctorModel alloc]init];
    myDoctorModelThirteen.userId = 13;
    myDoctorModelThirteen.avatarURL = @"lingkeyu.jpg";
    myDoctorModelThirteen.userName = @"林科宇";
    myDoctorModelThirteen.hospitalName = @"中三大学附属第一医院";
    myDoctorModelThirteen.departmentName = @"康复科专家";
    myDoctorModelThirteen.doctorLevel = @"副主任、技师";
    myDoctorModelThirteen.userIntroduce = @"脊柱相关疾病，骨科术后康复和运动损伤的防治，骨关节肌肉系统疾病的诊断评估与物理治疗，脊骨神经矫正技术，动态关节松动手法诊疗技术，弹性阻力训练，核心稳定训练，运动控制训练，麦肯基力学诊疗方法，三维治疗姿势评估与矫正，肌肉能量治疗。";
    myDoctorModelThirteen.visitInformationURL = @"http://www.yiheni.net/nd.jsp?id=70";
    myDoctorModelThirteen.appointmentURL = @"http://m.yiheni.net/col.jsp?id=185";
    myDoctorModelThirteen.isFollow = 0;
    
    [self.dataAry addObjectsFromArray:@[@[myDoctorModelOne,myDoctorModelThree],@[myDoctorModelTwo],@[myDoctorModelFour,myDoctorModelFive],@[myDoctorModelSix],@[myDoctorModelSeven,myDoctorModelEight,myDoctorModelNine,myDoctorModelTen],@[myDoctorModelEleven],@[myDoctorModelTwelve],@[myDoctorModelThirteen]]];

}

@end
