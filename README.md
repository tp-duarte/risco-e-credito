![](https://images.gupy.io/unsafe/100x100/https://s3.amazonaws.com/gupy5/production/companies/64/career/74/images/logo.jpg)
# Cielo - Estágio de Risco e Crédito

<br>

Este repositório tem como objetivo explorar algumas funcionalidades básicas do SAS em um Dataset  disponível no [**Kaggle**](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud) que foi coletado pela Université Libre de Bruxelles.
<br>

As informações presentes no conjunto de dados são de transações que foram executadas no mês de setembro do ano de 2013 por titulares de cartões europeus.

### Alguns Resultados :


```
/* Volume Total Transacionado por Categoria  */

proc sgplot data = creditcard;
	format Amount dollar8.2;
	vbar Class / response=Amount stat=sum ;
	title 'Valor Total Transacionado em Não Fraudes e Fraudes';
	
run;
```

![image](https://user-images.githubusercontent.com/69936708/181751067-d54fe1b3-b299-4b41-9077-2e9650463130.png)

```
proc sgplot data=creditcard;
	where Class="1";
	series y=Amount x=Time; 
	title "Transações Fraudulentas ao Longo do Tempo"

run;
```
![image](https://user-images.githubusercontent.com/69936708/181751492-e66745ba-8352-4b9b-9239-96df97ba0545.png)

