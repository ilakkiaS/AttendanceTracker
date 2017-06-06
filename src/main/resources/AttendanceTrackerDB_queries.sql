

CREATE TABLE `employee` (
  `employee_id` int(10) NOT NULL,
  `enterprise_id` varchar(30) DEFAULT NULL,
  `employee_name` varchar(25) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `designation` varchar(5) DEFAULT NULL,
  `career_level` int(3) DEFAULT NULL,
  `supervisor_id` int(10) DEFAULT NULL,
  `technology` varchar(10) DEFAULT NULL,
  `default_shift` varchar(2) DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `edited_by` varchar(10) DEFAULT NULL,
  `edited_time` timestamp NULL ,

  `project_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) 

INSERT INTO `employee` VALUES (11111111,'admin','Administrator','admin','Admin',12,1,'','','','2017-05-31 13:23:25',NULL,NULL,NULL);
INSERT INTO `employee` VALUES (11285922,'renga.r.santh.ledge','RengaRajan','hello','ASE',12,12134567,'Java','A','','2017-05-31 09:14:19',NULL,NULL,NULL);
INSERT INTO `employee` VALUES (12134567,'ramesh.muthyala','Ramesh Muthyala','login','AM',7,34356543,'Java','A','','2017-05-31 09:14:19',NULL,NULL,NULL);


CREATE TABLE `projects` (
  `project_id` int(5) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(25) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edited_by` varchar(20) DEFAULT NULL,
  `edited_time` timestamp  NULL  ,
  `description` text,
  PRIMARY KEY (`project_id`)
);

CREATE TABLE `timesheet` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) DEFAULT NULL,
  `date` int(3) DEFAULT NULL,
  `month` varchar(15) DEFAULT NULL,
  `year` int(5) DEFAULT NULL,
  `shift` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  
  FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ;