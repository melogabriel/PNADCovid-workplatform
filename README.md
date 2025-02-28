# PNADCovid TrabalhadoresAPP

## Descrição

Este projeto realiza uma análise de trabalhadores em plataformas digitais utilizando dados da **PNAD COVID-19**, fornecidos pelo IBGE. A análise é implementada em R e utiliza pacotes específicos para manipulação e visualização de dados.

Além disso, foi desenvolvido um [Shiny Dashboard](https://gabrielmelo.shinyapps.io/PNADCovid-workplatform/) interativo que permite explorar os resultados da análise de forma dinâmica.

### Objetivos

- Analisar o impacto da pandemia de COVID-19 no trabalho em plataformas digitais.
- Explorar dados demográficos como idade, sexo, escolaridade e características do trabalho.

## Como a Análise Funciona

### 1. **Importação dos Dados**

Os dados são importados diretamente da PNAD COVID-19 usando o pacote `PNADcIBGE`. Os dados carregados incluem informações como:

- **UF**: Unidade da Federação.
- **A002**: Idade.
- **A003**: Sexo.
- **A004**: Cor ou raça.
- **A005**: Escolaridade.
- **C007**: Realização de trabalho remunerado.
- **C007B**: Trabalho em aplicativos de transporte ou entrega.
- **C007C**: Trabalho em aplicativos de venda ou outros.
- **C008**: Horas trabalhadas na semana de referência.
- **C009**: Rendimento efetivo de todos os trabalhos.

### 2. **Dicionário de Variáveis**

Cada coluna dos dados é descrita e padronizada com base no dicionário da PNAD COVID-19. Isso permite facilitar a interpretação dos resultados e a criação de filtros.

### 3. **Construção do Banco de Dados**

Os dados são filtrados e manipulados para atender aos objetivos da análise. Por exemplo:

- Filtragem de dados referentes aos meses de 2020.
- Foco em indivíduos que realizam trabalhos em plataformas digitais, como aplicativos de transporte ou entrega.
- Criação de variáveis derivadas para cálculo de estatísticas como rendimento médio e horas trabalhadas.

### 4. **Análise Estatística**

A análise utiliza os pacotes `survey` e `srvyr` para realizar cálculos de estimativas com pesos amostrais, garantindo que os resultados sejam representativos da população.

### 5. **Visualização de Dados**

Os gráficos são criados usando o pacote `ggplot2` e suas extensões (`ggrepel`, `gridExtra`) para melhorar a apresentação. As visualizações incluem:

- Distribuição de idade e sexo dos trabalhadores.
- Comparação de rendimentos por categorias de trabalho.
- Evolução do número de trabalhadores ao longo do tempo.

### 6. **Shiny Dashboard interativo**

O Shiny Dashboard oferece uma interface interativa que permite aos usuários:

- Explorar os dados por filtros como região, faixa etária e tipo de trabalho.
- Visualizar gráficos dinâmicos com atualizações em tempo real.
- Acessar insights detalhados sem a necessidade de executar o código localmente.

![](shiny-dashboard-pnadcovid.gif)

## Requisitos do Sistema

- R (versão 4.0 ou superior)
- Pacotes R necessários:
  - `tidyverse`
  - `PNADcIBGE`
  - `COVIDIBGE`
  - `knitr`
  - `gridExtra`
  - `ggrepel`
  - `survey`
  - `zoo`
  - `scales`
  - `srvyr`

## Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/PNADCovid_TrabalhadoresAPP.git
   cd PNADCovid_TrabalhadoresAPP
   ```

2.	Instale os pacotes R necessários:
   
    ```bash
  	install.packages(c("tidyverse", "PNADcIBGE", "COVIDIBGE", "knitr", "gridExtra", "ggrepel", "survey", "zoo", "scales", "srvyr"))
    ```

## Uso

1.	Abra o arquivo PNADCovid_TrabalhadoresAPP.Rmd no RStudio ou outro editor de R Markdown.
2.	Execute as células para processar e analisar os dados.
3.	Visualize os resultados no relatório gerado em HTML.

## Estrutura do Código

•	Importação de bibliotecas e dados.
•	Manipulação de dados usando tidyverse e survey.
•	Visualização de dados com gráficos do ggplot2.

## Contribuição

Contribuições são bem-vindas! Siga os passos abaixo para colaborar:
1.	Faça um fork do repositório.
2.	Crie uma nova branch:
   ```bash
   git checkout -b sua-feature
   ```
3.	Faça suas alterações e envie um pull request.

Embora o foco desta análise tenha sido uma extração de trabalhadores por meio de plataformas digitais, a estrutura pode ser aproveitada para diversos outros tipos de análises alterando as variáveis analisadas e aplicando filtros diferentes consultando as variáveis no [Dicionário](https://github.com/melogabriel/PNADCovid_workplatform/blob/main/Dicionario_PNAD_COVID_112020_20210726.xls).

## Licença

Este projeto foi desenvolvido como parte da análise de dados desenvolvida na dissertação de mestrado do autor. O resultado da pesquisa pode ser consultado [aqui](https://app.uff.br/riuff/bitstream/handle/1/36524/Dissertac%cc%a7a%cc%83o%20Gabriel%20Melo.pdf?sequence=1&isAllowed=y).

> MELO, Gabriel Coutinho. Plataformização do trabalho no Brasil: uma análise das suas origens e condicionantes. 2024. 103 f. Dissertação (Mestrado em Administração) - Programa de Pós-Graduação em Administração, Faculdade de Administração e Ciências Contábeis, Universidade Federal Fluminense, Niterói, 2024. https://app.uff.br/riuff/handle/1/36524

Este projeto está licenciado sob a [MIT License](https://github.com/melogabriel/PNADCovid_workplatform/blob/main/LICENSE).

Se precisar de mais detalhes ou quiser alterações específicas, é só avisar!
