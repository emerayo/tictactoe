# Detalhes sobre o jogo

Clássico jogo da Velha

Permite escolher entre alguns modos de jogo (Máquina X Humano, Humano X Humano e Máquina X Máquina)

# Rodar o jogo

Este jogo utiliza duas dependêndias Ruby para ser executado e RSpec para executar os testes

Para instalar o Ruby, siga as instruções nesta [página](https://www.ruby-lang.org/pt/documentation/installation/)

Execute o comando abaixo para iniciar o jogo:
```
ruby -r "./models/game.rb" -e "Game.new.play"
```

Para rodar os testes é necessário instalar a gem rspec, para instalar a gem use o comando abaixo:

```
gem install rspec
```

Após a instalação rodar os testes com o seguinte comando:

```
rspec specs/
```
