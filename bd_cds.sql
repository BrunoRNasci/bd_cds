create database BD_CDS;
use bd_cds;

alter table tb_cidade
add foreign key (Sigla_Est) references tb_estado(Sigla_Est);

alter table tb_cidade
add constraint fk_Sigla_Est foreign key (Sigla_Est) references tb_estado(Sigla_Est);