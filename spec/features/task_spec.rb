require 'rails_helper'

describe 'User authentication', type: :feature, js: true do

  context 'when user starts the app' do
    before { visit root_path }

    it 'renders a Log In page before authentication' do
      expect(page).to have_content('LOG IN')
	  end
  end
end

describe 'Signed user', type: :feature, js: true do
  before do
    User.create email: 'test@admin.com', password: 'password'

    visit root_path
    fill_in :user_email, with: 'test@admin.com'
    fill_in :user_password, with: 'password'
    click_button 'Log in'
  end

  it 'can create a task', js: true do
    visit root_path
    click_link 'Nova Tarefa'

    fill_in 'task[title]', with: 'Autoseg'
    fill_in 'task[description]', with: 'Enviar desafio para a Autoseg'
    click_button 'Salvar'

    sleep 5

    Task.last.title.should == 'Autoseg'
  end

  it "can hide his private tasks" , js: true do
    visit root_path
    click_link 'Nova Tarefa'

    fill_in 'task[title]', with: 'Tarefa Pública'
    fill_in 'task[description]', with: 'Prometo que não vou sumir!'
    click_button 'Salvar'

    sleep 2

    click_link 'Nova Tarefa'
    fill_in 'task[title]', with: 'Tarefa Privada'
    fill_in 'task[description]', with: 'Eu vou sumir em breve!'
    find(:css, "#task_isprivate[value='1']").set(true)
    click_button 'Salvar'

    sleep 3

    click_link 'Tarefas Públicas'

    sleep 5

    Task.count == 2
    Task.all.where(isprivate: false).count == 1
  end
end


