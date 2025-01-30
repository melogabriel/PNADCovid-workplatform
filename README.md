# PNADCovid TrabalhadoresAPP

## Descrição

Este projeto realiza uma análise de trabalhadores em plataformas digitais utilizando dados da **PNAD COVID-19**, fornecidos pelo IBGE. Foi desenvolvido um [dashboard interativo](https://gabrielmelo.shinyapps.io/PNADCovid-workplatform/) desenvolvido em R utilizando o pacote Shiny. O objetivo é analisar dados de trabalhadores em plataformas digitais no ano de 2020, permitindo a visualização e filtragem dos dados por meio de uma interface amigável.

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

- **Filtros Interativos**: Permite filtrar os dados por ano, mês, unidade da federação (UF), tipo de ocupação, faixa etária, sexo, cor ou raça, escolaridade, carteira assinada, função, carga horária semanal habitual, rendimentos habituais e contribuição para o INSS.
- **Visualizações Gráficas**: Inclui gráficos de barras e gráficos de pizza para visualizar a distribuição dos dados.
- **Tabela Interativa**: Exibe os dados filtrados em uma tabela com paginação e busca.
- **Download de Dados**: Permite o download dos dados filtrados em formato CSV.


## Instalação

Para executar este projeto, siga os passos abaixo:

1. **Instale o R**: Certifique-se de que o R está instalado no seu sistema. Você pode baixá-lo em (https://cran.r-project.org/).
2. **Instale o RStudio (opcional)**: Recomenda-se o uso do RStudio para uma melhor experiência de desenvolvimento. Baixe-o em (https://www.rstudio.com/products/rstudio/download/).
3. **Instale os Pacotes Necessários**: No console do R, execute os seguintes comandos para instalar os pacotes necessários:

   ```bash
    install.packages("shiny")
    install.packages("shinydashboard")
    install.packages("ggplot2")
    install.packages("dplyr")
    install.packages("plotly")
    install.packages("DT")
    ```

4. **Clone o repositório**:

   ```bash
   git clone https://github.com/seu-usuario/PNADCovid_TrabalhadoresAPP.git
   cd PNADCovid_TrabalhadoresAPP
   ```
5. **Execute o Projeto**: Navegue até o diretório do projeto e execute o arquivo app.R.
    ```bash
   shiny::runApp("caminho/para/o/projeto")
   ```

## Estrutura do Projeto

- **app.R**: Contém o código principal do aplicativo Shiny, incluindo a interface do usuário (UI) e a lógica do servidor (server).
- **trabalhadoresAPP_2020.csv**: Arquivo de dados utilizado no projeto. Certifique-se de que este arquivo está no mesmo diretório que o app.R.

## Uso

1. **Filtros**: Utilize os filtros no painel lateral para selecionar os critérios desejados.
2. **Tabela**: Visualize os dados filtrados na aba "Tabela".
3. **Gráficos**: Explore as visualizações gráficas na aba "Gráficos".
4. **Download**: Baixe os dados filtrados clicando no botão "Baixar Dados Filtrados".

![](shiny-dashboard-pnadcovid.gif)


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

Este projeto está licenciado sob a [MIT License](https://github.com/melogabriel/PNADCovid_workplatform/blob/main/LICENSE).

Se precisar de mais detalhes ou quiser alterações específicas, é só avisar!

*Este projeto foi desenvolvido para auxiliar na pesquisa e análise de dados da minha dissertação de mestrado.*
