options validvarname=v7;
run;

/* Carregando o conjunto de dados como credit data e inspecionando elementos*/

proc import datafile="/home/u61927030/sasuser.v94/Fraud Analysis/creditcard.csv" 
			dbms=csv
			out=creditcard 
			replace;
			
run;



/* Verificando características gerais do conjunto de dados */

proc contents data=creditcard;
run;

/* Visualizando 5 primeira linhas */

proc print data=creditcard (obs=5);
	var Time Amount Class;
run;


/* Verificando Valores Distribuição da Concessão dos Valores de Crédito*/

proc univariate data=creditcard ;
	var Amount;
run;


/* Verificando Valores Distribuição da Concessão dos Valores de Crédito*/

proc freq data=creditcard ;
	tables Class;
	title "Frequência das Concessões - Fraudulentas ou Não";
run;

/* Somente 0.17% das concessões de crédito resultaram em fraude  */



/* Volume Total Transacionado por Categoria  */

proc sgplot data = creditcard;
	format Amount dollar8.2;
	vbar Class / response=Amount stat=sum ;
	title 'Valor Total Transacionado em Não Fraudes e Fraudes';
	
run;


proc sgplot data=creditcard ;
	format Amount dollar8.2;
	vbar Class / response=Amount stat=mean;
	title 'Valor Médio Transacionado em Não Fraudes e Fraudes';

run;



/* Normalizando os valores transacionados */


data logamount;
	set creditcard;
	log_amount = log(Amount + 2);
	
run;	

/* Box plot das Fraudes e Não Fraudes   */

proc sgplot data=logamount ;
	format Amount dollar8.2;
	vbox Amount / category=Class;
	title "Volume de Crédito Movimentado em Fraudes e Não Fraudes";

run;


proc sgplot data=logamount ;
	vbox log_amount / category=Class;
	title "Volume de Crédito Movimentado em Fraudes e Não Fraudes - Normalizado";

run;



proc sgplot data=creditcard;
	where Class="0";
	series y=Amount x=Time; 
	title "Transações Não Fraudulentas ao Longo do Tempo";

run;



proc sgplot data=creditcard;
	where Class="1";
	series y=Amount x=Time; 
	title "Transações Fraudulentas ao Longo do Tempo";

run;






/*  */

