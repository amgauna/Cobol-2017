# * Cobol
# * Exemplo de Código
# 
# * Uma das caracteristicas importantes do Cobol é a sua 
# * auto-documentação; um programador pode entender um 
# * programa COBOL pela simples leitura de sua codificação.
#
# Identification Division.
# Program-ID. Quarter.
# Author. Larry Newcomer
# Installation. Penn State University -- York Campus.
# Date-Written. May 1983.
# Date-Compiled. May 9, 1983.
# Security. Não ha considerações de segurança para Quarter.
#      
# * Um resumo do programa Quarter --
# *
# * Quarter lê um arquivo contendo as vendas mensais dos vendedores 
# * para os 3 meses de um trimestre juntamente com o nome do
# * vendedor e a cota de venda do trimestre. Imprime um relatório
# * mostrando o vendedor:
# *
# * Nome     Venda do Trimestre    Cota
# * 
# * Jones    $ 42.000,98           $ 40.000,00
# * Smith    $ 59.000,67           $ 60.000,00
# * Yost     $ 47.893,00           $ 45.000,00
# Environment Division.
# Configuration Section.
# Source-Computer. IBM-370.
# Object-Computer. IBM-370.
# Special-Names. Decimal-Point is Comma.
# Input-Output Section.
# File-Control.
#   Selec Arquivo-Vendas   assign to Vendas.
#   Selec Relat-Trimestral assign to Relatrim.
#   
# Data Division.
# File Section.
# FD Arquivo-Vendas
#   Label Records are Standard
#   Record Contains 80 Characters
#   
# 01 Registro-Vendas
#   05 Nome-Registro-Vendas         PIC X(15).
#   05 Vendas-Mes-1-Registro-Vendas PIC S9(4)V99.
#   05 Vendas-Mes-2-Registro-Vendas PIC S9(4)V99.
#   05 Vendas-Mes3-Registro-Vendas  PIC S9(4)V99.
#   05 Cota-Registro-Vendas         PIC S9(5)V99.
#   05 Filler                       PIC X(40).
#   
# FD Relat-Trimestral
#   Label Records are Omitted
#   Record Contains 132 Characters
#   
# 01 Linha-Relat-Trimestral          PIC X(132).
#      
# Working-Storage-Section.
#      
# 01 Chaves-Totais.
#   05 Fim-Arquivo-Vendas           PIC X.
#   05 Total-Trimestre              PIC S9(5)V99 COMP-3.
# 01 Linha-Relatorio-Trabalho.
#   05 Nome-Trabalho                PIC X(15).
#   05 Filler                       PIC X(5) VALUE Spaces.
#   05 Total-Trabalho               PIC $$$.$$$,99.
#   05 Filler                       PIC X(5) VALUE Spaces.
#   05 Cota-Trabalho                PIC $$$.$$$,99.
#   05 Filler                       PIC X(87) Value Spaces.
#      
# Procedure Division.
#      
# 010 - Parag-Executivo.
#      Perform 020-Inicializar-E-Preparar
#      Perform 040-Imprimir-Linhas-Relatorio
#         Ultil Fim-Arquivo-Vendas = "T"
#      Perform 050-Termino-E-encerramento
#      Stop RUN     
#      
# 020 - Inicializar-E-Preparar.
#      Open Input Arquivo-Vendas
#           Output Relat-Trimestral
#      Move "F" to Fim-Arquivo-Vendas
#      Perform 030-Ler-Arquivo-Vendas
#           
# 030 - Ler-Arquivo-Vendas.
#      Read Arquivo-Vendas
#           At END
#                 Move "T" to Fim-Arquivo-Vendas     
#      
# 040 - Imprimir-Linhas-Relatório.
#      Move Nome-Registro-Vendas TO Nome-Trabalho
#      Compute Total-Trimestre = Vendas-Mes-1-Registro-Vendas
#                              + Vendas-Mes-2-Registro-Vendas
#                              + Vendas-Mes-3-Registro-Vendas
#      Move Total-Trimestre TO Total-Trabalho
#      Move Cota-Registro-Vendas TO Cota-Trabalho
#      Write Linha-Relat-Trimestral
#            From Linha-Relatorio-Trabalho
#      Perform 030-Ler-Arquivo-Vendas
#          
# 050 - Termino-E-Encerramento.
#      CLOSE Arquivo-Vendas
#            Relat-Trimestral
#      
