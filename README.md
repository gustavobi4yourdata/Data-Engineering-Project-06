# Orquestrando Data Pipeline com Apache Airflow

![img.png](image/Data-Engineering-Project-06.png)


## Sobre o Projeto

Este repositório tem como objetivo usar o Apache Airflow para orquestrar o Data Pipeline do projeto dbt usando o Data Warehouse moderno BigQuery e o Power Bi como ferramenta de data viz.

### Pré-requisitos para rodar o projeto

* **Conta Google Cloud Provider**: Cadastro, criação de projeto e chave de acesso para conexão remota com BigQuery.

* **VSCode**: Editor de código. [Instruções de instalação do VSCode aqui](https://code.visualstudio.com/download).

* **Pyenv**: É usado para gerenciar versões do Python. [Instruções de instalação do Pyenv aqui](https://github.com/pyenv/pyenv#installation). Vamos usar nesse projeto o Python 3.10.11. Para usuários Windows, é recomendado assistirem esse tutorial [Youtube](https://www.youtube.com/watch?v=TkcqjLu1dgA).

* **Poetry**: Este projeto utiliza Poetry para gerenciamento de dependências do projeto dbt-core. [Instruções de instalação do Poetry aqui](https://python-poetry.org/docs/#installation). Se você é usuário Windows, recomendo assistir esse vídeo: [Youtube](https://www.youtube.com/watch?v=BuepZYn1xT8). Que instala o Python, Poetry e VSCode. Mas um simples comando PIP INSTALL POETRY já resolve.

* **Docker**: Para subir o container do Apache Airflow. [Instruções de instalação do Docker aqui](https://www.docker.com/products/docker-desktop/).

* **Astro CLI**: Permite iniciar o Apache Airflow rapidamente. 
Instruções de instalação para Windows, Mac e Linux você encontra neste [link](https://github.com/astronomer/astro-cli).


### Instalação e Configuração

1. Clone o repositório :
```bash
git clone https://github.com/gustavobi4yourdata/Data-Engineering-Project-06.git
```

2. Clone o repositório `Data-Engineering-Project-05`
```bash
git clone https://github.com/gustavobi4yourdata/Data-Engineering-Project-05.git
```

* Siga todas as instruções do `Project5` e rode o projeto `dbt-core`.
* Renomei a pasta `Data-Engineering-Project-05` para `dbt`
* Copie a pasta `dbt` para dentro da pasta `dags`
* Renomei a ambiente virtual do projeto dbt-core `.venv` para `dbt_venv`

3. Rode o comando
```bash
astro dev start
```

#### Seguindo todas os passos acima você vai ter instalado:

* Apache Airflow rodando em docker

![img.png](image/docker-apache-airflow.png)

* User Interface do Apache Airflow

![img.png](image/user-interface-apache-airflow.png)

### Para rodar o Data Pipeline no Apache Airflow

1. Na guia `Admin` em `Connections` cria a conexão com o BigQuery

![img.png](image/connection-bigquery.png)

2. Habilite o `toggle` da dag `data_pipeline`

3. Clique na dag `data_pipeline` e em seguida `Graph`

4. Rode o Data Pipeline em `Trigger DAG`

5. Aguarde o Data Pipeline rodar.


## Contato

Para dúvidas, sugestões ou feedbacks:

* **Gustavo Souza** - [gustavo.souza@bi4yourdata.com](mailto:gustavo.souza@bi4yourdata.com)



