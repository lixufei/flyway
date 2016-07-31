create table tb_employee(
    id int primary key,
    name varchar(255),
    email varchar(255)
);

insert into tb_employee values(1, 'jie liu','jjliu@thoughtworks.com');
insert into tb_employee values(2, 'tester','test@thoughtworks.com');

alter table tb_employee add dept_id int default 1;
