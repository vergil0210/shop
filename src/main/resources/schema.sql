CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET UTF8;
CREATE TABLE IF NOT EXISTS `shop`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '用户ID' ,
  `username` VARCHAR(50) NOT NULL COMMENT '用户名' ,
  `password` VARCHAR(50) NOT NULL COMMENT '密码(加盐并加密)' ,
  `nickname` VARCHAR(50) NOT NULL COMMENT '昵称' ,
  `email` VARCHAR(50) NOT NULL COMMENT '注册邮箱' ,
  `phone` BIGINT(11) DEFAULT NULL COMMENT '手机号码' ,
  `ctime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `utime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
  `stat` TINYINT NOT NULL DEFAULT 0 COMMENT '用户状态，0为正常，1为受限，2为删除' ,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '用户表';

CREATE TABLE IF NOT EXISTS `shop`.`game` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
  `creater` VARCHAR(50) NOT NULL COMMENT '开发者',
  `name` VARCHAR(50) NOT NULL COMMENT '游戏名字' ,
  `desc` VARCHAR(500) NOT NULL COMMENT '游戏描述' ,
  `systemcfg` VARCHAR(500) NOT NULL COMMENT '系统配置要求',
  `price` DOUBLE NOT NULL COMMENT '正常价格',
  `discount` DOUBLE DEFAULT NULL COMMENT '打折后价格',
--  'kid' VARCHAR(100) NOT NULL COMMENT '种类，用逗号分隔开',
--  `tags` VARCHAR(100) NOT NULL COMMENT '标签，用逗号分隔开' ,
  `ctime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `utime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，创建后上架' ,
  `stat` TINYINT NOT NULL DEFAULT 0 COMMENT '状态，0为未上架，1为已上架，2为删除' ,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '游戏表';

CREATE TABLE IF NOT EXISTS `shop`.`img` (
  `game` INT NOT NULL COMMENT '游戏ID',
  `img` VARCHAR(50) NOT NULL COMMENT '图片路径'
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '游戏图片映射表';

CREATE TABLE IF NOT EXISTS `shop`.`code` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
  `uid` INT NOT NULL COMMENT '用户ID',
  `code` VARCHAR(50) NOT NULL COMMENT '激活码',
  `stat` TINYINT NOT NULL DEFAULT 0 COMMENT '激活码状态，0表示未使用，1表示已使用',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '激活码';

CREATE TABLE IF NOT EXISTS `shop`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
  `uid` INT NOT NULL COMMENT '购买者ID' ,
  `price` DOUBLE NOT NULL COMMENT '订单总价',
  `ctime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `utime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
  `stat` TINYINT NOT NULL DEFAULT 0 COMMENT '订单状态，0为未支付，1为已支付，2为取消订单' ,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '订单表';

CREATE TABLE IF NOT EXISTS `shop`.`orderitem` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID' ,
  `gid` INT NOT NULL COMMENT '游戏id',
  `price` DOUBLE NOT NULL COMMENT '购买时价格',
  `code` INT NOT NULL COMMENT '激活码' ,
  `ctime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `utime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间' ,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '每个订单对应的订单详细内容';

CREATE TABLE IF NOT EXISTS `shop`.`ordermapper` (
  `order` INT NOT NULL COMMENT '订单ID',
  `item` INT NOT NULL COMMENT '订单详情ID'
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '订单-订单详情项映射表';

CREATE TABLE IF NOT EXISTS `shop`.`kind` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '种类ID',
  `name` VARCHAR(10) NOT NULL COMMENT '种类名字',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '游戏种类表';

CREATE TABLE IF NOT EXISTS `shop`.`kindmapper` (
  `game` INT NOT NULL COMMENT '游戏ID',
  `kind` INT NOT NULL COMMENT '游戏种类ID'
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '游戏-种类详情项映射表';

CREATE TABLE IF NOT EXISTS `shop`.`tag` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `name` VARCHAR(10) NOT NULL COMMENT '标签名字',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '游戏标签表';

CREATE TABLE IF NOT EXISTS `shop`.`tagmapper` (
  `game` INT NOT NULL COMMENT '游戏ID',
  `tag` INT NOT NULL COMMENT '标签ID'
) ENGINE = InnoDB DEFAULT CHARSET = UTF8 COMMENT '游戏-标签映射表';