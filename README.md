# Desafio Dados Blue3

Este é um projeto de desafio de dados para a vaga de analista de dados jr na Blue3. O projeto consiste em um conjunto de dados de uma empresa fictícia e algumas questões que devem ser respondidas utilizando SQL e Python.

## Pré-Requisitos

Antes de começar, certifique-se de que você tem o Docker instalado em sua máquina. Se você não tem o Docker instalado, por favor, siga as instruções de instalação no [site oficial do Docker](https://docs.docker.com/get-docker/).

## Instalação

Siga estes passos para configurar o ambiente de desenvolvimento em sua máquina local.

### Passo 1: Clonar o Repositório

Clone o repositório do projeto usando o seguinte comando no terminal:

```bash
git clone [[URL_DO_REPOSITÓRIO](https://github.com/ericcoleta/desafio_dados_blue3)]
```

### Passo 2: Configurar o Ambiente com Docker

Navegue até a pasta do projeto que você acabou de clonar:

```bash
cd desafio_dados_blue3
```

Execute o seguinte comando para construir e iniciar os contêineres em background:

```bash
docker-compose up -d
```

Este comando irá baixar as imagens necessárias, construir os contêineres do projeto e iniciá-los em modo "detached".

### Passo 3: Acessar a Aplicação

Após os contêineres estarem rodando, você pode acessar a aplicação pelo navegador:

```
http://localhost:8080
```

Isso abrirá a interface da aplicação rodando localmente em sua máquina.

## Uso

Na pasta notebooks está o arquivo `desafio_analista_de_dados_jr.ipynb` que contem o desafio proposto. Cada questão foi deverá ser elaborada no proprio arquivo. A primeira célula é a de inicialização do plugin sql, que é necessário para rodar as queries e conectar ao banco de dados.

Toda as células que for rodar queries no banco de dados, é necessário que o plugin sql esteja inicializado utilizando %%sql no inicio da célula.