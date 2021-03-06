SET NAMES UTF8;
DROP DATABASE IF EXISTS ledin;
CREATE DATABASE ledin CHARSET=UTF8;
USE ledin;


/**商品分类**/
CREATE TABLE ld_product_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**商品详情**/
CREATE TABLE ld_product(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属类别家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  newprice DECIMAL(10,2),        #新价格
  oldprice DECIMAL(10,2),        #旧价格
  spec VARCHAR(64),           #颜色
  size	INT,                  #尺码
  spic VARCHAR(128)             #商品列表页图片
			
);

/**商品图片**/
CREATE TABLE ld_product_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,              #服装编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE ld_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);



/**购物车条目**/
CREATE TABLE ld_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);
/****首页轮播广告商品****/
CREATE TABLE ld_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE ld_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/****商品详情页滚动广告商品****/
CREATE TABLE ld_ad(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);


/**商品评论**/
CREATE TABLE ld_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  bid INT,
  ctime DATETIME,
  content VARCHAR(128),
  username  VARCHAR(28),
  isdel INT
)


/*******************/
/******数据导入******/
/*******************/
/**服装商品类别**/
INSERT INTO ld_product_family VALUES
(NULL,'新品'),
(NULL,'卫衣/上衣'),
(NULL,'裤装'),
(NULL,'外套'),
(NULL,'连衣裙'),
(NULL,'半身裙'),
(NULL,'毛衣'),
(NULL,'羽绒服');

/**服装**/

INSERT INTO ld_product VALUES
/*商品列表中每个lid的图片只建一条,不考虑颜色和尺码*/
/*下面的商品图片要考虑颜色,每个lid的商品要加多张不同的图片,每张图片有不同的尺寸*/
(1,1,'乐町牛仔铅笔九分裤复古港味风裤子2018秋季新款女复古学生休闲裤','双色可选 锥形裤版型 小脚设计',169,309,'蓝色','155/S','img/xp/sp/O1CN011MQWRaLA9ZTc3yA_!!0-item_pic.jpg_240x240.jpg'),
(2,1,'乐町荷叶高领线衫2018秋装新款小清新套头慵懒风甜美毛衣毛针织衫','金丝装饰高领 荷叶边袖设计',269,409,'白色','165/L','img/xp/sp/O1CN011MQWRalZhWhp1lB_!!0-item_pic.jpg_240x240.jpg'),
(3,1,'乐町简洁式中长款风衣2018秋季新款学生bf港风收腰宽松过膝外套','翻领设计 复古典雅大气',329,629,'白色','155/S','img/xp/sp/O1CN011MQWRc6xNvOmz8N_!!0-item_pic.jpg_240x240.jpg'),
(4,1,'乐町蕾丝拼接毛针织衫长袖2018早秋季新款女装内搭打底衫薄款毛衣','后背蕾丝拼接 纽扣装饰点缀',139,289,'黄色','160/M','img/xp/sp/O1CN011MQWRc51urRe4f7_!!0-item_pic.jpg_240x240.jpg'),
(5,1,'乐町chic早秋上衣慵懒衬衫女长袖2018新款秋装灯芯绒港味复古韩范','复古韩范 灯芯绒衬衫',219,429,'粉色','155/S','img/xp/sp/O1CN011MQWRceRxH5VDiW_!!0-item_pic.jpg_240x240.jpg'),
(6,1,'乐町紧身牛仔铅笔裤港味复古chic裤子2018秋季新款女刺绣毛九分裤','爱心刺绣脚口 毛边设计 毛绒加厚内胆',219,429,'黑色','155/S','img/xp/sp/O1CN011MQWRcQUaADR3qP_!!0-item_pic.jpg_240x240.jpg'),

/*新添的首页轮播商品*/
(7,2,'乐町衬衫女夏ins宽松复古港风韩范2018夏装新款女格纹长袖女上衣','ins宽松复古 港风格纹拼接衬衫',199,399,'黑色','155/S','img/wy/sp/O1CN011MQWRen4IWdfrPk_!!0-item_pic.jpg_240x240.jpg'),
(8,2,'乐町卫衣女连帽原宿风长袖秋款女2018新款潮酷拼接怪味少女上衣','潮酷连帽 拼接卫衣',279,489,'粉色','165/L','img/wy/sp/O1CN011MQWRXrfNgYdtt5_!!0-item_pic.jpg_240x240.jpg'),


(9,5,'乐町吊带连衣裙ins超火的雪纺裙2018秋装新款女气质中长款复古潮','可调节细肩带设计 不规则裙摆设计',219,369,'黑色','155/S','img/lyq/sp/O1CN011MQWReOIMtnqUhB_!!0-item_pic.jpg_240x240.jpg'),

/*新添详情页滚动商品*/
(10,6,'乐町ins超火时尚复古潮流百搭港风2018年秋季鱼尾边半身裙中长裙','鱼尾裙摆，复古潮流',189,349,'白色','155/S','img/bsq/sp/O1CN011MQWRdXhzed4xME_!!0-item_pic.jpg_240x240.jpg'),
(11,6,'乐町ins超火复古仙气潮流2018年秋季新款网纱半身裙CWGF84230','甜美网纱，轻薄飘逸',289,549,'灰色','155/S','img/bsq/sp/O1CN011MQWRfLeqV0Aqe6_!!0-item_pic.jpg_240x240.jpg'),


/*下面重复写的一样的商品*/
(12,1,'乐町牛仔铅笔九分裤复古港味风裤子2018秋季新款女复古学生休闲裤','双色可选 锥形裤版型 小脚设计',169,309,'蓝色','155/S','img/xp/sp/O1CN011MQWRaLA9ZTc3yA_!!0-item_pic.jpg_240x240.jpg'),
(13,1,'乐町荷叶高领线衫2018秋装新款小清新套头慵懒风甜美毛衣毛针织衫','金丝装饰高领 荷叶边袖设计',269,409,'白色','165/L','img/xp/sp/O1CN011MQWRalZhWhp1lB_!!0-item_pic.jpg_240x240.jpg'),
(14,1,'乐町简洁式中长款风衣2018秋季新款学生bf港风收腰宽松过膝外套','翻领设计 复古典雅大气',329,629,'白色','155/S','img/xp/sp/O1CN011MQWRc6xNvOmz8N_!!0-item_pic.jpg_240x240.jpg'),
(15,1,'乐町蕾丝拼接毛针织衫长袖2018早秋季新款女装内搭打底衫薄款毛衣','后背蕾丝拼接 纽扣装饰点缀',139,289,'黄色','160/M','img/xp/sp/O1CN011MQWRc51urRe4f7_!!0-item_pic.jpg_240x240.jpg'),
(16,1,'乐町chic早秋上衣慵懒衬衫女长袖2018新款秋装灯芯绒港味复古韩范','复古韩范 灯芯绒衬衫',219,429,'粉色','155/S','img/xp/sp/O1CN011MQWRceRxH5VDiW_!!0-item_pic.jpg_240x240.jpg'),
(17,1,'乐町紧身牛仔铅笔裤港味复古chic裤子2018秋季新款女刺绣毛九分裤','爱心刺绣脚口 毛边设计 毛绒加厚内胆',219,429,'黑色','155/S','img/xp/sp/O1CN011MQWRcQUaADR3qP_!!0-item_pic.jpg_240x240.jpg'),
(18,2,'乐町衬衫女夏ins宽松复古港风韩范2018夏装新款女格纹长袖女上衣','ins宽松复古 港风格纹拼接衬衫',199,399,'黑色','155/S','img/wy/sp/O1CN011MQWRen4IWdfrPk_!!0-item_pic.jpg_240x240.jpg'),
(19,2,'乐町卫衣女连帽原宿风长袖秋款女2018新款潮酷拼接怪味少女上衣','潮酷连帽 拼接卫衣',279,489,'粉色','165/L','img/wy/sp/O1CN011MQWRXrfNgYdtt5_!!0-item_pic.jpg_240x240.jpg'),
(20,5,'乐町吊带连衣裙ins超火的雪纺裙2018秋装新款女气质中长款复古潮','可调节细肩带设计 不规则裙摆设计',219,369,'黑色','155/S','img/lyq/sp/O1CN011MQWReOIMtnqUhB_!!0-item_pic.jpg_240x240.jpg'),
(21,6,'乐町ins超火时尚复古潮流百搭港风2018年秋季鱼尾边半身裙中长裙','鱼尾裙摆，复古潮流',189,349,'白色','155/S','img/bsq/sp/O1CN011MQWRdXhzed4xME_!!0-item_pic.jpg_240x240.jpg'),
(22,6,'乐町ins超火复古仙气潮流2018年秋季新款网纱半身裙CWGF84230','甜美网纱，轻薄飘逸',289,549,'灰色','155/S','img/bsq/sp/O1CN011MQWRfLeqV0Aqe6_!!0-item_pic.jpg_240x240.jpg'),
(23,1,'乐町紧身牛仔铅笔裤港味复古chic裤子2018秋季新款女刺绣毛九分裤','爱心刺绣脚口 毛边设计 毛绒加厚内胆',219,429,'黑色','155/S','img/xp/sp/O1CN011MQWRcQUaADR3qP_!!0-item_pic.jpg_240x240.jpg'),
(24,2,'乐町衬衫女夏ins宽松复古港风韩范2018夏装新款女格纹长袖女上衣','ins宽松复古 港风格纹拼接衬衫',199,399,'黑色','155/S','img/wy/sp/O1CN011MQWRen4IWdfrPk_!!0-item_pic.jpg_240x240.jpg'),
(25,2,'乐町卫衣女连帽原宿风长袖秋款女2018新款潮酷拼接怪味少女上衣','潮酷连帽 拼接卫衣',279,489,'粉色','165/L','img/wy/sp/O1CN011MQWRXrfNgYdtt5_!!0-item_pic.jpg_240x240.jpg'),
(26,5,'乐町吊带连衣裙ins超火的雪纺裙2018秋装新款女气质中长款复古潮','可调节细肩带设计 不规则裙摆设计',219,369,'黑色','155/S','img/lyq/sp/O1CN011MQWReOIMtnqUhB_!!0-item_pic.jpg_240x240.jpg'),
(27,6,'乐町ins超火时尚复古潮流百搭港风2018年秋季鱼尾边半身裙中长裙','鱼尾裙摆，复古潮流',189,349,'白色','155/S','img/bsq/sp/O1CN011MQWRdXhzed4xME_!!0-item_pic.jpg_240x240.jpg'),
(28,6,'乐町ins超火复古仙气潮流2018年秋季新款网纱半身裙CWGF84230','甜美网纱，轻薄飘逸',289,549,'灰色','155/S','img/bsq/sp/O1CN011MQWRfLeqV0Aqe6_!!0-item_pic.jpg_240x240.jpg');


/*商品列表商品图片*/
/**商品图片**/
INSERT INTO ld_product_pic VALUES
/*新品的6件商品*/
(NULL, 1, 'img/xp/qt/O1CN011MQWRaLA9ZTc3yA_!!0-item_pic.jpg_60x60q90.jpg','img/xp/qt/O1CN011MQWRaLA9ZTc3yA_!!0-item_pic.jpg_430x430q90.jpg','img/xp/qt/O1CN011MQWRaLA9ZTc3yA_!!0-item_pic.jpg_q30.jpg'),
(NULL, 1, 'img/xp/qt/TB2N0jWrwZC2uNjSZFnXXaxZpXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2N0jWrwZC2uNjSZFnXXaxZpXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2N0jWrwZC2uNjSZFnXXaxZpXa_!!513051429.jpg'),
(NULL, 1, 'img/xp/qt/TB2PM8QwyMnBKNjSZFCXXX0KFXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2PM8QwyMnBKNjSZFCXXX0KFXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2PM8QwyMnBKNjSZFCXXX0KFXa_!!513051429.jpg'),
(NULL, 1, 'img/xp/qt/TB27w.1wnqWBKNjSZFAXXanSpXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB27w.1wnqWBKNjSZFAXXanSpXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB27w.1wnqWBKNjSZFAXXanSpXa_!!513051429.jpg'),
(NULL, 1, 'img/xp/qt/TB2WVBwwpooBKNjSZFPXXXa2XXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2WVBwwpooBKNjSZFPXXXa2XXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2WVBwwpooBKNjSZFPXXXa2XXa_!!513051429.jpg'),


(NULL, 2, 'img/xp/qt/O1CN011MQWRalZhWhp1lB_!!0-item_pic.jpg_60x60q90.jpg','img/xp/qt/O1CN011MQWRalZhWhp1lB_!!0-item_pic.jpg_430x430q90.jpg','img/xp/qt/O1CN011MQWRalZhWhp1lB_!!0-item_pic.jpg_q30.jpg'),
(NULL, 2, 'img/xp/qt/TB2BxHNaHvpK1RjSZPiXXbmwXXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2BxHNaHvpK1RjSZPiXXbmwXXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2BxHNaHvpK1RjSZPiXXbmwXXa_!!513051429.jpg'),
(NULL, 2, 'img/xp/qt/TB2bzNEuOQnBKNjSZFmXXcApVXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2bzNEuOQnBKNjSZFmXXcApVXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2bzNEuOQnBKNjSZFmXXcApVXa_!!513051429.jpg'),
(NULL, 2, 'img/xp/qt/TB2F2bJt_qWBKNjSZFAXXanSpXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2F2bJt_qWBKNjSZFAXXanSpXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2F2bJt_qWBKNjSZFAXXanSpXa_!!513051429.jpg'),
(NULL, 2, 'img/xp/qt/TB2hjRdt9YTBKNjSZKbXXXJ8pXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2hjRdt9YTBKNjSZKbXXXJ8pXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2hjRdt9YTBKNjSZKbXXXJ8pXa_!!513051429.jpg'),


(NULL, 3, 'img/xp/qt/O1CN011MQWRZunY2Ydzpu-513051429.jpg_60x60q90.jpg','img/xp/qt/O1CN011MQWRZunY2Ydzpu-513051429.jpg_430x430q90.jpg','img/xp/qt/O1CN011MQWRZunY2Ydzpu-513051429.jpg_q30.jpg'),
(NULL, 3, 'img/xp/qt/O1CN011MQWR1ClpQvDPXE_!!513051429.jpg_60x60q90.jpg','img/xp/qt/O1CN011MQWR1ClpQvDPXE_!!513051429.jpg_430x430q90.jpg','img/xp/qt/O1CN011MQWR1ClpQvDPXE_!!513051429.jpg'),
(NULL, 3, 'img/xp/qt/O1CN011MQWR42T2FNzdZ8_!!513051429.jpg_60x60q90.jpg','img/xp/qt/O1CN011MQWR42T2FNzdZ8_!!513051429.jpg_430x430q90.jpg','img/xp/qt/O1CN011MQWR42T2FNzdZ8_!!513051429.jpg'),
(NULL, 3, 'img/xp/qt/O1CN011MQWR1xXN2tCT3P_!!513051429.jpg_60x60q90.jpg','img/xp/qt/O1CN011MQWR1xXN2tCT3P_!!513051429.jpg_430x430q90.jpg','img/xp/qt/O1CN011MQWR42T2FNzdZ8_!!513051429.jpg'),
(NULL, 3, 'img/xp/qt/TB2ys3ZFpGWBuNjy0FbXXb4sXXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2ys3ZFpGWBuNjy0FbXXb4sXXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2ys3ZFpGWBuNjy0FbXXb4sXXa_!!513051429.jpg'),



(NULL, 4, 'img/xp/qt/O1CN011MQWRa7CZhJ08C2-513051429.jpg_60x60q90.jpg','img/xp/qt/O1CN011MQWRa7CZhJ08C2-513051429.jpg_430x430q90.jpg','img/xp/qt/O1CN011MQWRa7CZhJ08C2-513051429.jpg_q30.jpg'),
(NULL, 4, 'img/xp/qt/TB2d9z_GxSYBuNjSsphXXbGvVXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2d9z_GxSYBuNjSsphXXbGvVXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2d9z_GxSYBuNjSsphXXbGvVXa_!!513051429.jpg'),
(NULL, 4, 'img/xp/qt/TB2iyG3XzbguuRkHFrdXXb.LFXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2iyG3XzbguuRkHFrdXXb.LFXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2iyG3XzbguuRkHFrdXXb.LFXa_!!513051429.jpg'),
(NULL, 4, 'img/xp/qt/TB2iyG3XzbguuRkHFrdXXb.LFXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2iyG3XzbguuRkHFrdXXb.LFXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2iyG3XzbguuRkHFrdXXb.LFXa_!!513051429.jpg'),



(NULL, 5, 'img/xp/qt/TB2Ybv0wYArBKNjSZFLXXc_dVXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2Ybv0wYArBKNjSZFLXXc_dVXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2Ybv0wYArBKNjSZFLXXc_dVXa_!!513051429.jpg'),
(NULL, 5, 'img/xp/qt/TB2xOYUwQomBKNjSZFqXXXtqVXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2xOYUwQomBKNjSZFqXXXtqVXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2xOYUwQomBKNjSZFqXXXtqVXa_!!513051429.jpg'),
(NULL, 5, 'img/xp/qt/TB2Qk6XwYZnBKNjSZFKXXcGOVXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2Qk6XwYZnBKNjSZFKXXcGOVXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2Qk6XwYZnBKNjSZFKXXcGOVXa_!!513051429.jpg'),
(NULL, 5, 'img/xp/qt/TB2P_QMdXzqK1RjSZFCXXbbxVXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2P_QMdXzqK1RjSZFCXXbbxVXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2P_QMdXzqK1RjSZFCXXbbxVXa_!!513051429.jpg'),


(NULL, 6, 'img/xp/qt/O1CN011MQWRcQUaADR3qP_!!0-item_pic.jpg_60x60q90.jpg','img/xp/qt/O1CN011MQWRcQUaADR3qP_!!0-item_pic.jpg_430x430q90.jpg','img/xp/qt/O1CN011MQWRcQUaADR3qP_!!0-item_pic.jpg_q30.jpg'),
(NULL, 6, 'img/xp/qt/TB2G9G9o3ZC2uNjSZFnXXaxZpXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2G9G9o3ZC2uNjSZFnXXaxZpXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2G9G9o3ZC2uNjSZFnXXaxZpXa_!!513051429.jpg'),
(NULL, 6, 'img/xp/qt/TB2opQfuyMnBKNjSZFoXXbOSFXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2opQfuyMnBKNjSZFoXXbOSFXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2opQfuyMnBKNjSZFoXXbOSFXa_!!513051429.jpg'),
(NULL, 6, 'img/xp/qt/TB2XRsCupkoBKNjSZFkXXb4tFXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2XRsCupkoBKNjSZFkXXb4tFXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2XRsCupkoBKNjSZFkXXb4tFXa_!!513051429.jpg'),
(NULL, 6, 'img/xp/qt/TB2WrT9XcbpK1RjSZFyXXX_qFXa_!!513051429.jpg_60x60q90.jpg','img/xp/qt/TB2WrT9XcbpK1RjSZFyXXX_qFXa_!!513051429.jpg_430x430q90.jpg','img/xp/qt/TB2WrT9XcbpK1RjSZFyXXX_qFXa_!!513051429.jpg'),

/*新添的首页轮播商品*/
(NULL, 7, 'img/wy/qt/O1CN011MQWRen4IWdfrPk_!!0-item_pic.jpg_60x60q90.jpg','img/wy/qt/O1CN011MQWRen4IWdfrPk_!!0-item_pic.jpg_430x430q90.jpg','img/wy/qt/O1CN011MQWRen4IWdfrPk_!!0-item_pic.jpg_q30.jpg'),
(NULL, 7, 'img/wy/qt/TB2AluiCb1YBuNjSszeXXablFXa_!!513051429.jpg_60x60q90.jpg','img/wy/qt/TB2AluiCb1YBuNjSszeXXablFXa_!!513051429.jpg_430x430q90.jpg','img/wy/qt/TB2AluiCb1YBuNjSszeXXablFXa_!!513051429.jpg'),
(NULL, 7, 'img/wy/qt/TB2FMs7tOOYBuNjSsD4XXbSkFXa_!!513051429.jpg_60x60q90.jpg','img/wy/qt/TB2FMs7tOOYBuNjSsD4XXbSkFXa_!!513051429.jpg_430x430q90.jpg','img/wy/qt/TB2FMs7tOOYBuNjSsD4XXbSkFXa_!!513051429.jpg'),
(NULL, 7, 'img/wy/qt/TB2zY9ICnlYBeNjSszcXXbwhFXa_!!513051429.jpg_60x60q90.jpg','img/wy/qt/TB2zY9ICnlYBeNjSszcXXbwhFXa_!!513051429.jpg_430x430q90.jpg','img/wy/qt/TB2zY9ICnlYBeNjSszcXXbwhFXa_!!513051429.jpg'),
(NULL, 7, 'img/wy/qt/TB24T1hknCWBKNjSZFtXXaC3FXa_!!513051429.jpg_60x60q90.jpg','img/wy/qt/TB24T1hknCWBKNjSZFtXXaC3FXa_!!513051429.jpg_430x430q90.jpg','img/wy/qt/TB24T1hknCWBKNjSZFtXXaC3FXa_!!513051429.jpg'),
(NULL, 7, 'img/wy/qt/TB24T1hknCWBKNjSZFtXXaC3FXa_!!513051429.jpg_60x60q90.jpg','img/wy/qt/TB24T1hknCWBKNjSZFtXXaC3FXa_!!513051429.jpg_430x430q90.jpg','img/wy/qt/TB24T1hknCWBKNjSZFtXXaC3FXa_!!513051429.jpg'),

(NULL, 8, 'img/wy/qt/O1CN011MQWRXrfNgYdtt5_!!0-item_pic.jpg_60x60q90.jpg','img/wy/qt/O1CN011MQWRXrfNgYdtt5_!!0-item_pic.jpg_430x430q90.jpg','img/wy/qt/O1CN011MQWRXrfNgYdtt5_!!0-item_pic.jpg_q30.jpg'),
(NULL, 8, 'img/wy/qt/TB2lLKOoBsmBKNjSZFsXXaXSVXa_!!513051429.jpg_60x60q90.jpg','img/wy/qt/TB2lLKOoBsmBKNjSZFsXXaXSVXa_!!513051429.jpg_430x430q90.jpg','img/wy/qt/TB2lLKOoBsmBKNjSZFsXXaXSVXa_!!513051429.jpg'),
(NULL, 8, 'img/wy/qt/TB2mrn4ocUrBKNjSZPxXXX00pXa_!!513051429.jpg_60x60q90.jpg','img/wy/qt/TB2mrn4ocUrBKNjSZPxXXX00pXa_!!513051429.jpg_430x430q90.jpg','img/wy/qt/TB2mrn4ocUrBKNjSZPxXXX00pXa_!!513051429.jpg'),
(NULL, 8, 'img/wy/qt/TB2RKGioYsrBKNjSZFpXXcXhFXa_!!513051429.jpg_60x60q90.jpg','img/wy/qt/TB2RKGioYsrBKNjSZFpXXcXhFXa_!!513051429.jpg_430x430q90.jpg','img/wy/qt/TB2RKGioYsrBKNjSZFpXXcXhFXa_!!513051429.jpg'),


(NULL, 9, 'img/lyq/qt/O1CN011MQWReOIMtnqUhB_!!0-item_pic.jpg_60x60q90.jpg','img/lyq/qt/O1CN011MQWReOIMtnqUhB_!!0-item_pic.jpg_430x430q90.jpg','img/lyq/qt/O1CN011MQWReOIMtnqUhB_!!0-item_pic.jpg_q30.jpg'),
(NULL, 9, 'img/lyq/qt/TB2mYhKoDqWBKNjSZFAXXanSpXa_!!513051429.jpg_60x60q90.jpg','img/lyq/qt/TB2mYhKoDqWBKNjSZFAXXanSpXa_!!513051429.jpg_430x430q90.jpg','img/lyq/qt/TB2mYhKoDqWBKNjSZFAXXanSpXa_!!513051429.jpg'),
(NULL, 9, 'img/lyq/qt/TB2uhWYoaAoBKNjSZSyXXaHAVXa_!!513051429.jpg_60x60q90.jpg','img/lyq/qt/TB2uhWYoaAoBKNjSZSyXXaHAVXa_!!513051429.jpg_430x430q90.jpg','img/lyq/qt/TB2uhWYoaAoBKNjSZSyXXaHAVXa_!!513051429.jpg'),
(NULL, 9, 'img/lyq/qt/TB2WanhoXooBKNjSZPhXXc2CXXa_!!513051429.jpg_60x60q90.jpg','img/lyq/qt/TB2WanhoXooBKNjSZPhXXc2CXXa_!!513051429.jpg_430x430q90.jpg','img/lyq/qt/TB2WanhoXooBKNjSZPhXXc2CXXa_!!513051429.jpg'),
(NULL, 9, 'img/lyq/qt/TB22Oh2oAUmBKNjSZFOXXab2XXa_!!513051429.jpg_60x60q90.jpg','img/lyq/qt/TB22Oh2oAUmBKNjSZFOXXab2XXa_!!513051429.jpg_430x430q90.jpg','img/lyq/qt/TB22Oh2oAUmBKNjSZFOXXab2XXa_!!513051429.jpg'),

/*新添详情页滚动商品*/
(NULL, 10, 'img/bsq/qt/O1CN011MQWRdXhzed4xME_!!0-item_pic.jpg_60x60q90.jpg','img/bsq/qt/O1CN011MQWRdXhzed4xME_!!0-item_pic.jpg_430x430q90.jpg','img/bsq/qt/O1CN011MQWRdXhzed4xME_!!0-item_pic.jpg_q30.jpg'),
(NULL, 10, 'img/bsq/qt/TB2iTkKJr1YBuNjSszhXXcUsFXa_!!513051429.jpg_60x60q90.jpg','img/bsq/qt/TB2iTkKJr1YBuNjSszhXXcUsFXa_!!513051429.jpg_430x430q90.jpg','img/bsq/qt/TB2iTkKJr1YBuNjSszhXXcUsFXa_!!513051429.jpg'),
(NULL, 10, 'img/bsq/qt/TB2rzZ8JH9YBuNjy0FgXXcxcXXa_!!513051429.jpg_60x60q90.jpg','img/bsq/qt/TB2rzZ8JH9YBuNjy0FgXXcxcXXa_!!513051429.jpg_430x430q90.jpg','img/bsq/qt/TB2rzZ8JH9YBuNjy0FgXXcxcXXa_!!513051429.jpg'),
(NULL, 10, 'img/bsq/qt/TB2vfERmsUrBKNjSZPxXXX00pXa_!!513051429.jpg_60x60q90.jpg','img/bsq/qt/TB2vfERmsUrBKNjSZPxXXX00pXa_!!513051429.jpg_430x430q90.jpg','img/bsq/qt/TB2vfERmsUrBKNjSZPxXXX00pXa_!!513051429.jpg'),
(NULL, 10, 'img/bsq/qt/TB2vnF4BOOYBuNjSsD4XXbSkFXa_!!513051429.jpg_60x60q90.jpg','img/bsq/qt/TB2vnF4BOOYBuNjSsD4XXbSkFXa_!!513051429.jpg_430x430q90.jpg','img/bsq/qt/TB2vnF4BOOYBuNjSsD4XXbSkFXa_!!513051429.jpg'),


(NULL, 11, 'img/bsq/qt/O1CN011MQWRfLeqV0Aqe6_!!0-item_pic.jpg_60x60q90.jpg','img/bsq/qt/O1CN011MQWRfLeqV0Aqe6_!!0-item_pic.jpg_430x430q90.jpg','img/bsq/qt/O1CN011MQWRfLeqV0Aqe6_!!0-item_pic.jpg_q30.jpg'),
(NULL, 11, 'img/bsq/qt/TB2_.FMvcUrBKNjSZPxXXX00pXa_!!513051429.jpg_60x60q90.jpg','img/bsq/qt/TB2_.FMvcUrBKNjSZPxXXX00pXa_!!513051429.jpg_430x430q90.jpg','img/bsq/qt/TB2_.FMvcUrBKNjSZPxXXX00pXa_!!513051429.jpg'),
(NULL, 11, 'img/bsq/qt/TB2izkivkomBKNjSZFqXXXtqVXa_!!513051429.jpg_60x60q90.jpg','img/bsq/qt/TB2izkivkomBKNjSZFqXXXtqVXa_!!513051429.jpg_430x430q90.jpg','img/bsq/qt/TB2izkivkomBKNjSZFqXXXtqVXa_!!513051429.jpg'),
(NULL, 11, 'img/bsq/qt/TB2myRptGQoBKNjSZJnXXaw9VXa_!!513051429.jpg_60x60q90.jpg','img/bsq/qt/TB2myRptGQoBKNjSZJnXXaw9VXa_!!513051429.jpg_430x430q90.jpg','img/bsq/qt/TB2myRptGQoBKNjSZJnXXaw9VXa_!!513051429.jpg'),
(NULL, 11, 'img/bsq/qt/TB2NPs.tHsrBKNjSZFpXXcXhFXa_!!513051429.jpg_60x60q90.jpg','img/bsq/qt/TB2NPs.tHsrBKNjSZFpXXcXhFXa_!!513051429.jpg_430x430q90.jpg','img/bsq/qt/TB2NPs.tHsrBKNjSZFpXXcXhFXa_!!513051429.jpg'),



/**用户信息**/
INSERT INTO ld_user VALUES
(NULL, 'susu', '123456', 'susu@qq.com', '13501234567', 'img/avatar/default.png', '苏苏', '1'),
(NULL, 'qiqi', '123456', 'qiqi@qq.com', '13501234568', 'img/avatar/default.png', '十七', '1'),
(NULL, 'dengdeng', '123456', 'dengdeng@qq.com', '13501234569', 'img/avatar/default.png', '邓邓', '1'),
(NULL, 'kaikai', '123456', 'kaikai@qq.com', '13501234560', 'img/avatar/default.png', '赵老板', '0');



/****首页轮播广告商品****/
INSERT INTO ld_index_carousel VALUES
(NULL, 'img/body/00.jpg','轮播广告商品1','products_details.html?lid=7'),
(NULL, 'img/body/02.jpg','轮播广告商品2','products_details.html?lid=8'),
(NULL, 'img/body/14.jpg','轮播广告商品3','products_details.html?lid=9');

/****详情页滚动广告商品****/
INSERT INTO ld_ad VALUES
(NULL, 'img/ad/ad-01.jpg','轮播广告商品1','products_details.html?lid=10'),
(NULL, 'img/ad/ad-02.jpg','轮播广告商品2','products_details.html?lid=7'),
(NULL, 'img/ad/ad-03.jpg','轮播广告商品3','products_details.html?lid=9'),
(NULL, 'img/ad/ad-04.jpg','轮播广告商品4','products_details.html?lid=11'),
(NULL, 'img/ad/ad-05.jpg','轮播广告商品5','products_details.html?lid=8'),
(NULL, 'img/ad/ad-06.jpg','轮播广告商品6','products_details.html?lid=1');


/****商品评论****/
INSERT INTO ld_comment VALUES
(NULL,1,now(),'纯白色超喜欢，比照片拍着还好看，宽松的形状很喜欢，我165,110穿s足矣，很满意嘿嘿','妖***o',0),
(NULL,1,now(),'给我家丑媳妇买的，刚开始拿到的时候她还很不满意，后来看着看着又觉得挺好，给个好评吧！','大***帅',0),
(NULL,1,now(),'衣服收到，试了一下很宽松舒适。姑娘身高167重46公斤穿s号比较宽松，衣服色正和参考图一样没有色差。面料舒适，帽边毛是真毛边很可爱','喵***0',0),
(NULL,1,now(),'非常喜欢 很漂亮的粉色 质量也很好 比实体店划算多了 第一次买乐町的衣服 以后应该还会光顾','
天***3',0),
(NULL,1,now(),'有点大，但是很厚很舒服，颜色也好看。','卿***瓷',0),
(NULL,1,now(),'好看 同学都说好 有点大了 但是可以套很多衣服了','温***素',0),
(NULL,1,now(),'162/52刚刚好，很暖和，打算过段时间去看升旗的时候穿','风***街',0),
(NULL,1,now(),'很好看呢，非常满意，一直很喜欢乐町家的衣服，质量很有保证，关键客服态度巨好的，谢谢奈叶客服小姐姐一直耐心解答，几经波折才弄好的','c***3',0),
(NULL,1,now(),'喜欢 颜色正 质量好 满意','迪***雯',0),
(NULL,1,now(),'????','小王八',0),
(NULL,2,now(),'很喜欢！！！嘻嘻嘻嘻嘻！！！生日半价活动买的！！嘻嘻嘻！！！','大猪蹄子',0),
(NULL,2,now(),'哈哈哈哈','大猪蹄子',0),
(NULL,2,now(),'哈哈哈哈','大猪蹄子',0),
(NULL,2,now(),'哈哈哈哈','大猪蹄子',0),
(NULL,2,now(),'哈哈哈哈','大猪蹄子',0),
(NULL,2,now(),'哈哈哈哈','大猪蹄子',0),
(NULL,2,now(),'哈哈哈哈','大猪蹄子',0),
(NULL,2,now(),'哈哈哈哈','大猪蹄子',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,3,now(),'啦啦啦啦','大鸡腿',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,4,now(),'嘿嘿嘿嘿','小乌龟',0),
(NULL,5,now(),'呵呵呵呵','绿毛龟',0),
(NULL,5,now(),'呵呵呵呵','绿毛龟',0),
(NULL,5,now(),'呵呵呵呵','绿毛龟',0),
(NULL,5,now(),'呵呵呵呵','绿毛龟',0),
(NULL,5,now(),'呵呵呵呵','绿毛龟',0),
(NULL,5,now(),'呵呵呵呵','绿毛龟',0),
(NULL,5,now(),'呵呵呵呵','绿毛龟',0),
(NULL,5,now(),'呵呵呵呵','绿毛龟',0),
(NULL,5,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,6,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,7,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,8,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,9,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,10,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
(NULL,11,now(),'呵呵呵呵','绿毛龟',0),
