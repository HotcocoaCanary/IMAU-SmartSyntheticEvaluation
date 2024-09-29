-- 创建数据库
CREATE DATABASE Synthetic_Evaluation;
USE Synthetic_Evaluation;

-- 创建用户表
CREATE TABLE Users
(
    username VARCHAR(50) PRIMARY KEY, -- 用户名，学号
    password VARCHAR(64) NOT NULL -- 用户密码
);

-- 创建班级表
CREATE TABLE Classes
(
    class_id   INT PRIMARY KEY AUTO_INCREMENT, -- 班级ID，唯一标识每个班级
    class_name VARCHAR(50) NOT NULL UNIQUE -- 班级名称，不允许重复
);

-- 创建学生信息表
CREATE TABLE Students
(
    student_id VARCHAR(50) PRIMARY KEY, -- 学号
    college    VARCHAR(50) NOT NULL, -- 学生所在学院
    name       VARCHAR(64) NOT NULL, -- 学生真实姓名
    class_id   INT, -- 学生所在班级的ID
    FOREIGN KEY (student_id) REFERENCES Users (username), -- 外键约束，学号
    FOREIGN KEY (class_id) REFERENCES Classes (class_id) -- 外键约束，班级ID对应班级表的class_id
);

-- 创建班级领导关联表
CREATE TABLE ClassLeaders
(
    leader_id INT PRIMARY KEY AUTO_INCREMENT, -- 领导ID，唯一标识每个领导
    username  VARCHAR(50), -- 领导的用户名
    name      VARCHAR(64) NOT NULL, -- 领导的真实姓名
    class_id  INT, -- 领导负责的班级ID
    role_name VARCHAR(50) NOT NULL UNIQUE, -- 领导的角色名称，不允许重复（班长，班主任，学办主任）
    FOREIGN KEY (username) REFERENCES Users (username), -- 外键约束，用户名对应用户表的用户名
    FOREIGN KEY (class_id) REFERENCES Classes (class_id) -- 外键约束，班级ID对应班级表的class_id
);

-- 创建综合测评表
CREATE TABLE ComprehensiveAssessment
(
    assessment_id        INT PRIMARY KEY AUTO_INCREMENT, -- 综合测评ID，唯一标识每次测评
    student_id           VARCHAR(50), -- 学生ID，对应学生信息表
    ideological_morality FLOAT, -- 思想道德分数
    sports_score         FLOAT, -- 体育分数
    academic_performance FLOAT, -- 学术表现分数
    other_score_1        FLOAT, -- 其他分数1
    other_score_2        FLOAT, -- 其他分数2
    total_score          FLOAT, -- 总分，由触发器计算得出
    failed_subjects      INT, -- 不及格科目数
    FOREIGN KEY (student_id) REFERENCES Students (student_id) -- 外键约束，学生ID对应学生信息表的学生ID
);

DELIMITER $$

-- 触发器：在插入新记录之前计算总分
CREATE TRIGGER CalculateTotalScoreBeforeInsert
    BEFORE INSERT ON ComprehensiveAssessment
    FOR EACH ROW
BEGIN
    SET NEW.total_score = NEW.ideological_morality + NEW.sports_score + NEW.academic_performance + NEW.other_score_1 + NEW.other_score_2;
END$$

-- 触发器：在更新记录之前计算总分
CREATE TRIGGER CalculateTotalScoreBeforeUpdate
    BEFORE UPDATE ON ComprehensiveAssessment
    FOR EACH ROW
BEGIN
    SET NEW.total_score = NEW.ideological_morality + NEW.sports_score + NEW.academic_performance + NEW.other_score_1 + NEW.other_score_2;
END$$

DELIMITER ;
