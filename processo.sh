#!/bin/bash
	
#Faz o download dos arquivos .zip do site da Recieta Federal
	for arquivo in {01..20}; do wget -c -A zip "http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_"$arquivo".zip" -P /var/www/arqsreceita; done
	
#Executa o .py para converter para .csv
	python3 /var/www/cnpj.py /var/www/ csv /var/www/csv --dir
	
#Faz o upload dos arquivos .csv
	aws s3 cp /var/www/csv/cnaes_secundarios.csv s3://junto-s3-ph/
	aws s3 cp /var/www/csv/empresas.csv s3://junto-s3-ph/
	aws s3 cp /var/www/csv/socios.csv s3://junto-s3-ph/
