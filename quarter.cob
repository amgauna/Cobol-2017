Identification Division.

Program-ID. Quarter.
Author. Larry Newcomer
Installation. Penn State University -- York Campus.
Date-Written. May 1983.
Date-Compiled. May 9, 1983.
Security. Não ha considerações de segurança para Quarter.
*
* Um resumo do porgrama Quarter --
*
* Quarter lê um arquivo contendo as vendas mensais dos vendedores para os 3 meses de um trimestre
* juntamente com o nome do vendedor e a cota de venda do trimestre.
* Imprime um relatório mostrando o vendedor:
*
* Nome     Venda do Trimestre    Cota
* 
* Jones    $ 42.000,98           $ 40.000,00
* Smith    $ 59.000,67           $ 60.000,00
* Yost     $ 47.893,00           $ 45.000,00

Environment Division.

Configuration Section.
Source-Computer. IBM-370.
Object-Computer. IBM-370.
Special-Names. Decimal-Point is Comma.
Input-Output Section.
File-Control.
   Selec Arquivo-Vendas   assign to Vendas.
   Selec Relat-Trimestral assign to Relatrim.
   
Data Division.

File Section.

FD Arquivo-Vendas
   Label Records are Standard
   Record Contains 80 Characters
   .
01 Registro-Vendas
   05 Nome-Registro-Vendas         PIC X(15).
   05 Vendas-Mes-1-Registro-Vendas PIC S9(4)V99.
   05 Vendas-Mes-2-Registro-Vendas PIC S9(4)V99.
   05 Vendas-Mes3-Registro-Vendas  PIC S9(4)V99.
   05 Cota-Registro-Vendas         PIC S9(5)V99.
   05 Filler                       PIC X(40).
   
   
