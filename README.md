# Autoseg Mini App

This is a TodoList <a href="https://gist.github.com/githubas/0bf0c0c03fb1d243310356e019d3ff6f#objetivo">challenge</a> for Autoseg hiring process.

> Esse projeto é um desafio do processo seletivo da Autoseg.

## Tools

```sh
Ruby 2.5.3
Rails 5.2.3
PostgreSQL 10.8
```

## Setup

### Ruby on Rails

```sh
gem install rails -v 5.2
```

**Don't `sudo gem install rails` even if the terminal tells you so!**
> Não use `sudo gem install rails` mesmo que o terminal te diga isso.

Restart your terminal. Then, check setup with:
> Reinicie o terminal e teste a versão com:

```sh
rails -v
```
### PostgreSQL

```sh
brew install postgresql
brew services start postgresql
psql --V 
```

#### Localhost

```sh
bundle install
rails db:migrate
rails s
http://localhost:3000 (browser)
```

## TDD

To check the app tests just type:
> Para realizar os testes do app, digite:

```sh
bundle exec rspec spec/features/task_spec.rb
```
Featured tests:
> Está sendo testado:

```sh
Only signed in users can see the pages. (Somente usuários logados podem ver as páginas);
A signed user can create a task. (Um usuário logado pode criar uma tarefa);
A user can hide his/her private tasks from others. (Um usuário pode esconder suas tarefas privadas dos outros)
```

## Heroku

You can check this app online at:
> Este app está disponível online no link:

```sh
https://autosegapp.herokuapp.com/
```

### Sample users

```sh
email: user1@admin.com; password: "password"
email: user2@admin.com; password: "password"
```