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

    fill_in 'task[title]', with: 'Mercado'
    fill_in 'task[description]', with: 'Compras de mês'
    click_button 'Salvar'

    sleep 2

    Task.last.title.should == 'Mercado'
  end
end


