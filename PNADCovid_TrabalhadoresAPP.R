---
title: "PNADCovid_TrabalhadoresAPP"
output: html_notebook
---

 **Análise de Trabalhadores em Plataformas Digitais**

 **Utilizando PNAD - COVID19 (IBGE)**

```{r bibliotecas, message=FALSE}
library(tidyverse) #pacote geral 
library(PNADcIBGE) #pacote IBGE 
library(COVIDIBGE) #pacote IBGE
library(knitr) #pacote RMarkdown 
library(gridExtra) #arrumar gráfico 
library(ggrepel) #arrumar legenda de gráfico 
library(survey) # estatística 
library(zoo) #as.yearqtr 
library(scales) #scale_manual 
library(srvyr) #permite usar dplyr para objetos survey
```

```{r base dados NOVEMBRO}
# PNAD COVID NOVEMBRO

pnad_covid_novembro = get_covid(year=2020, month=11, vars=c("UF", "A002", "A003", "A004","A005", "C007", "C007B", "C007C", "C008", "C009", "C01012", "C011A12", "C014"), design=FALSE, labels=TRUE) 

#download de dados da PNAD COVID de Novembro

# dicionário de variáveis: 
#  UF = Unidade da Federação 
#  A002 = Idade 
#  A003 = Sexo 
#  A004 = Cor ou Raça 
#  A005 = Escolaridade 
#  C007 = Tipo de Ocupação 
#  C007B = Carteira Assinada 
#  C007C = Tipo/Cargo/Função 
#  C008 = Carga horária semanal habitual 
#  C009 = Carga horária semanal
#  C01012 = Rendimentos 
#  C011A12 = Rendimentos habituais 
#  C014 = Contribui para o INSS


#381,438 entries, 26 variables
```

```{r base trabalhadoresAPP totais sem carteira assinada novembro}
trabalhadoresAPP_novembro <- filter(pnad_covid_novembro,
                                C007 == 'Conta própria' | C007 == 'Empregado do setor privado',
                                C007B == 'Não' | is.na(C007B),
                                C007C == 'Motoboy,' | C007C == 'Entregador de mercadorias (de restaurante, de farmácia, de loja, Uber Eats, IFood, Rappy etc.)' | C007C == 'Motorista (de aplicativo, de taxi, de van, de mototáxi, de ônibus)')

#amostra de motoboys, entregadores e motoristas que não possuem carteira assinada em novembro
# 2913 entries, 26 variables
```

```{r base de dados OUTUBRO}
# PNAD COVID OUTUBRO

pnad_covid_outubro = get_covid(year=2020, month=10, vars=c("UF", "A002", "A003", "A004","A005", "C007", "C007B", "C007C", "C008", "C009", "C01012", "C011A12", "C014"), design=FALSE, labels=TRUE) 
#download de dados da PNAD COVID de Outubro

# dicionário de variáveis: 
#  UF = Unidade da Federação 
#  A002 = Idade 
#  A003 = Sexo 
#  A004 = Cor ou Raça 
#  A005 = Escolaridade 
#  C007 = Tipo de Ocupação 
#  C007B = Carteira Assinada 
#  C007C = Tipo/Cargo/Função 
#  C008 = Carga horária semanal habitual 
#  C009 = Carga horária semanal
#  C01012 = Rendimentos 
#  C011A12 = Rendimentos habituais 
#  C014 = Contribui para o INSS


#380,461 entries, 26 variables


```

```{r base trabalhadoresAPP totais sem carteira assinada outubro}
trabalhadoresAPP_outubro <- filter(pnad_covid_outubro, 
                                C007 == 'Conta própria' | C007 == 'Empregado do setor privado',
                                C007B == 'Não' | is.na(C007B),
                                C007C == 'Motoboy,' | C007C == 'Entregador de mercadorias (de restaurante, de farmácia, de loja, Uber Eats, IFood, Rappy etc.)' | C007C == 'Motorista (de aplicativo, de taxi, de van, de mototáxi, de ônibus)')


#amostra de motoboys, entregadores e motoristas que não possuem carteira assinada em outubro
# 2876 entries, 26 variables
```

```{r base de dados SETEMBRO}
# PNAD COVID SETEMBRO

pnad_covid_setembro = get_covid(year=2020, month=9, vars=c("UF", "A002", "A003", "A004","A005", "C007", "C007B", "C007C", "C008", "C009", "C01012", "C011A12", "C014"), design=FALSE, labels=TRUE) 
#download de dados da PNAD COVID de Setembro

# dicionário de variáveis: 
#  UF = Unidade da Federação 
#  A002 = Idade 
#  A003 = Sexo 
#  A004 = Cor ou Raça 
#  A005 = Escolaridade 
#  C007 = Tipo de Ocupação 
#  C007B = Carteira Assinada 
#  C007C = Tipo/Cargo/Função 
#  C008 = Carga horária semanal habitual 
#  C009 = Carga horária semanal
#  C01012 = Rendimentos 
#  C011A12 = Rendimentos habituais 
#  C014 = Contribui para o INSS


#387,298 entries, 26 variables


```

```{r base trabalhadoresAPP totais sem carteira assinada setembro}
trabalhadoresAPP_setembro <- filter(pnad_covid_setembro, 
                                C007 == 'Conta própria' | C007 == 'Empregado do setor privado',
                                C007B == 'Não' | is.na(C007B),
                                C007C == 'Motoboy,' | C007C == 'Entregador de mercadorias (de restaurante, de farmácia, de loja, Uber Eats, IFood, Rappy etc.)' | C007C == 'Motorista (de aplicativo, de taxi, de van, de mototáxi, de ônibus)')

#amostra de motoboys, entregadores e motoristas que não possuem carteira assinada em outubro
# 2838 entries, 26 variables
```

```{r base de dados AGOSTO}
# PNAD COVID AGOSTO

pnad_covid_agosto = get_covid(year=2020, month=8, vars=c("UF", "A002", "A003", "A004","A005", "C007", "C007B", "C007C", "C008", "C009", "C01012", "C011A12", "C014"), design=FALSE, labels=TRUE) 
#download de dados da PNAD COVID de Agosto

# dicionário de variáveis: 
#  UF = Unidade da Federação 
#  A002 = Idade 
#  A003 = Sexo 
#  A004 = Cor ou Raça 
#  A005 = Escolaridade 
#  C007 = Tipo de Ocupação 
#  C007B = Carteira Assinada 
#  C007C = Tipo/Cargo/Função 
#  C008 = Carga horária semanal habitual 
#  C009 = Carga horária semanal
#  C01012 = Rendimentos 
#  C011A12 = Rendimentos habituais 
#  C014 = Contribui para o INSS


#386,520 entries, 26 variables


```

```{r base trabalhadoresAPP totais sem carteira assinada agosto}
trabalhadoresAPP_agosto <- filter(pnad_covid_agosto, 
                                C007 == 'Conta própria' | C007 == 'Empregado do setor privado',
                                C007B == 'Não' | is.na(C007B),
                                C007C == 'Motoboy,' | C007C == 'Entregador de mercadorias (de restaurante, de farmácia, de loja, Uber Eats, IFood, Rappy etc.)' | C007C == 'Motorista (de aplicativo, de taxi, de van, de mototáxi, de ônibus)')

#amostra de motoboys, entregadores e motoristas que não possuem carteira assinada em outubro
# 2812 entries, 26 variables
```

```{r base de dados JULHO}
# PNAD COVID JULHO

pnad_covid_julho = get_covid(year=2020, month=7, vars=c("UF", "A002", "A003", "A004","A005", "C007", "C007B", "C007C", "C008", "C009", "C01012", "C011A12", "C014"), design=FALSE, labels=TRUE) 
#download de dados da PNAD COVID de Julho

# dicionário de variáveis: 
#  UF = Unidade da Federação 
#  A002 = Idade 
#  A003 = Sexo 
#  A004 = Cor ou Raça 
#  A005 = Escolaridade 
#  C007 = Tipo de Ocupação 
#  C007B = Carteira Assinada 
#  C007C = Tipo/Cargo/Função 
#  C008 = Carga horária semanal habitual 
#  C009 = Carga horária semanal
#  C01012 = Rendimentos 
#  C011A12 = Rendimentos habituais 
#  C014 = Contribui para o INSS


#384,166 entries, 26 variables


```

```{r base trabalhadoresAPP totais sem carteira assinada julho}
trabalhadoresAPP_julho <- filter(pnad_covid_julho, 
                                C007 == 'Conta própria' | C007 == 'Empregado do setor privado',
                                C007B == 'Não' | is.na(C007B),
                                C007C == 'Motoboy,' | C007C == 'Entregador de mercadorias (de restaurante, de farmácia, de loja, Uber Eats, IFood, Rappy etc.)' | C007C == 'Motorista (de aplicativo, de taxi, de van, de mototáxi, de ônibus)')
#amostra de motoboys, entregadores e motoristas que não possuem carteira assinada em julho
# 2771 entries, 26 variables
```

```{r base de dados JUNHO}
# PNAD COVID JUNHO

pnad_covid_junho = get_covid(year=2020, month=6, vars=c("UF", "A002", "A003", "A004","A005", "C007", "C007B", "C007C", "C008", "C009", "C01012", "C011A12", "C014"), design=FALSE, labels=TRUE) 
#download de dados da PNAD COVID de Junho

# dicionário de variáveis: 
#  UF = Unidade da Federação 
#  A002 = Idade 
#  A003 = Sexo 
#  A004 = Cor ou Raça 
#  A005 = Escolaridade 
#  C007 = Tipo de Ocupação 
#  C007B = Carteira Assinada 
#  C007C = Tipo/Cargo/Função 
#  C008 = Carga horária semanal habitual 
#  C009 = Carga horária semanal
#  C01012 = Rendimentos 
#  C011A12 = Rendimentos habituais 
#  C014 = Contribui para o INSS


#381,270 entries, 26 variables


```

```{r base trabalhadoresAPP totais sem carteira assinada junho}
trabalhadoresAPP_junho <- filter(pnad_covid_junho, 
                                C007 == 'Conta própria' | C007 == 'Empregado do setor privado',
                                C007B == 'Não' | is.na(C007B),
                                C007C == 'Motoboy,' | C007C == 'Entregador de mercadorias (de restaurante, de farmácia, de loja, Uber Eats, IFood, Rappy etc.)' | C007C == 'Motorista (de aplicativo, de taxi, de van, de mototáxi, de ônibus)')
#amostra de motoboys, entregadores e motoristas que não possuem carteira assinada em junho
# 2950 entries, 26 variables
```

```{r base de dados MAIO}
# PNAD COVID MAIO

pnad_covid_maio = get_covid(year=2020, month=5, vars=c("UF", "A002", "A003", "A004","A005", "C007", "C007B", "C007C", "C008", "C009", "C01012", "C011A12", "C014"), design=FALSE, labels=TRUE) 
#download de dados da PNAD COVID de Maio

# dicionário de variáveis: 
#  UF = Unidade da Federação 
#  A002 = Idade 
#  A003 = Sexo 
#  A004 = Cor ou Raça 
#  A005 = Escolaridade 
#  C007 = Tipo de Ocupação 
#  C007B = Carteira Assinada 
#  C007C = Tipo/Cargo/Função 
#  C008 = Carga horária semanal habitual 
#  C009 = Carga horária semanal
#  C01012 = Rendimentos 
#  C011A12 = Rendimentos habituais 
#  C014 = Contribui para o INSS


#349,306 entries, 26 variables


```

```{r base trabalhadoresAPP totais sem carteira assinada maio}
trabalhadoresAPP_maio <- filter(pnad_covid_maio, 
                                C007 == 'Conta própria' | C007 == 'Empregado do setor privado',
                                C007B == 'Não' | is.na(C007B),
                                C007C == 'Motoboy,' | C007C == 'Entregador de mercadorias (de restaurante, de farmácia, de loja, Uber Eats, IFood, Rappy etc.)' | C007C == 'Motorista (de aplicativo, de taxi, de van, de mototáxi, de ônibus)')

#amostra de motoboys, entregadores e motoristas que não possuem carteira assinada em junho
# 2736 entries, 26 variables
```

```{r base trabalhadoresAPP 2020}
trabalhadoresAPP_2020 = rbind(trabalhadoresAPP_novembro, 
                         trabalhadoresAPP_outubro, 
                         trabalhadoresAPP_setembro, 
                         trabalhadoresAPP_agosto, 
                         trabalhadoresAPP_julho, 
                         trabalhadoresAPP_junho, 
                         trabalhadoresAPP_maio)

#amostra unificada de todos os trabalhadores de APP de 2020.
# 19896 entries, 26 variables
```

```{r base trabalhadoresAPP 2020 com variáveis renomeadas}
# Vetor com pares chave-valor para substituir os nomes das colunas
novos_nomes <- c("UF" = "UF", "A002" = "Idade", "A003" = "Sexo", "A004" = "Cor ou Raça", "A005" = "Escolaridade", "C007" = "Tipo de Ocupação", "C007B" = "Carteira Assinada", "C007C" = "Tipo/Cargo/Função", "C008" = "Carga horária semanal habitual", "C009" = "Carga horária semanal", "C01012" = "Rendimentos", "C011A12" = "Rendimentos habituais", "C014" = "Contribui para o INSS")

# Substituir os nomes das colunas
names(trabalhadoresAPP_2020) <- novos_nomes[names(trabalhadoresAPP_2020)]

#tabela amostra trabalhadores de app 2020 com colunas renomeadas de acordo com sua descrição

```

```{r exporta base trabalhadores app 2020 para .csv}
# Exportar o dataset para um arquivo CSV
write.csv(trabalhadoresAPP_2020, "trabalhadoresAPP_2020.csv", row.names = FALSE)


```
