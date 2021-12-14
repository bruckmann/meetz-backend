# SIGMA Meetz

[![Watch the video](https://img.youtube.com/vi/2VwV6reEGBw/maxresdefault.jpg)](https://youtu.be/2VwV6reEGBw)
Clique na imagem para ser redirecionado ao YouTube caso queira ver o funcionamento da aplicação.

## Sobre 📰

Este é um projeto desenvolvido pelos alunos [Joaquim Lagos](https://github.com/Joaquimlagos), [Filipe Dias](https://github.com/Lipzs),
[Felipe Brückmann](https://github.com/bruckmann) e [Jardel Urban](https://github.com/j-rdel) para o Projeto Integrador do 4° semestre de Análise e Desenvolvimento de Sistemas da Faculdade SENAI Florianópolis.

O objetivo desse projeto foi documentar e compreender todo importancia da Analise de Sistemas dentro do desenvolvimento. Desenvolvemos do zero uma solução para gerenciamento e reservas de salas de reunião.

---

## Requisitos do Projeto :heavy_check_mark:

### Documentos ~/**docs**

- Visão
- Regras de Negócio
- Modelo de Casos de Uso
- Especificação Casos de Uso
- Especificação de Interface
- Especificação Suplementar
- Glossario
- Gerenciamento de riscos

### Aplicação

- Desenvolvimento da aplicação documentada.
- [x] Cadastro
- [x] Login
- [x] Listagem de salas
- [x] Aluguel de sala
- [x] Gerenciamento de salas
- [ ] Gerenciamento de usuários 🔨

---

## Tecnologias back-end utilizadas 💻

- Ruby
- Rails
- JWT
- Bcrypt
- Postgresql

```bash
# Ferramentas de desenvolvimento :wrench:
```

- Insomnia

---

## Como baixar e executar o projeto 💡

### REPÓSITORIO BACK-END :end:

```bash

# Instale o Ruby^3.0.2 e o Ruby on Rails^6.1.4 em sua máquina

# Clone o respositório em sua máquina
$ git clone https://github.com/bruckmann/meetz-mobile.git

# Acesse o repositório
$ cd meetz-mobile

# Instale todas dependências
$ bundle install

# Altere as configurações necessárias para rodar o seu banco de dados
$ sudo vi config/database.yml

# Crie as migrations na seguinte ordem:
# 20211101031419_create_user.rb
# 20211106031734_create_room_localizations.rb
# 20211106032220_create_room_specifications.rb
# 20211106012220_create_images.rb
# 20211101031640_create_appointments.rb
# 20211101031609_create_meeting_rooms.rb
# 20211203230009_create_rooms.rb
# 20211207012919_update_rooms_to_version_3.rb

$ rake db:migrate:up VERSION=20211101031419

# Crie as seeds
$ rails db:seed

# Inicie a aplicação
$ rails s


```

---

### <a href="https://github.com/bruckmann/meetz-mobile">FRONT-END :movie_camera</a>

```bash

# Caso queira que a API tenha interação com o front-end, acesse o repositório e complete os passos do README


```
