alter table tb_employee add salary int default 0;
alter table tb_employee add constraint name_unique unique(name)