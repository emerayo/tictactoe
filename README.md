# Detalhes sobre o jogo

Clássico jogo da Velha

Permite escolher entre alguns modos de jogo:
1. Máquina X Humano
2. Humano X Humano
3. Máquina X Máquina

Permite escolher a dificuldade da Máquina

# Rodar o jogo

Este jogo utiliza três dependêndias:
1. Ruby para ser executado;
2. RSpec para executar os testes e;
3. SimpleCov para exibir a cobertura de testes.

Para instalar o Ruby, siga as instruções nesta [página](https://www.ruby-lang.org/pt/documentation/installation/)

Execute o comando abaixo para iniciar o jogo:
```
ruby game_starter.rb
```

Para rodar os testes é necessário instalar as dependências do projeto, para instalar use o comando abaixo:

```
bundle install
```

Após a instalação rodar os testes com o seguinte comando:

```
rspec specs/
```

Para verificar a cobertura de testes, abra o arquivo index.html dentro da pasta coverage