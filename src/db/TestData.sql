-- 插入用户数据
INSERT INTO Users (username, password)
VALUES ('user1', 'password1'),
       ('user2', 'password2'),
       ('user3', 'password3'),
       ('user4', 'password4'),
       ('user5', 'password5');

-- 插入班级数据
INSERT INTO Classes (class_name)
VALUES ('Class 1'),
       ('Class 2'),
       ('Class 3');

-- 插入学生信息数据
INSERT INTO Students (student_id, college, name, class_id)
VALUES ('user1', 'College of Engineering', 'Alice', 1),
       ('user2', 'College of Science', 'Bob', 1),
       ('user3', 'College of Arts', 'Charlie', 2),
       ('user4', 'College of Business', 'Diana', 3);

-- 插入班级领导关联数据
INSERT INTO ClassLeaders (username, name, class_id, role_name)
VALUES ('user5', 'Eva', 1, 'Class Leader 1'),
       ('user5', 'Eva', 2, 'Class Leader 2');
-- 注意：这里使用相同的用户名 'user5' 表示同一个人担任不同班级的领导

-- 插入综合测评数据
INSERT INTO ComprehensiveAssessment (student_id, ideological_morality, sports_score, academic_performance,
                                     other_score_1, other_score_2, failed_subjects)
VALUES ('user1', 90, 85, 92, 88, 90, 0),
       ('user2', 88, 90, 87, 85, 89, 1),
       ('user3', 91, 84, 90, 86, 88, 0),
       ('user4', 89, 83, 91, 87, 85, 2);
