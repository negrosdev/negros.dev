require 'rails_helper'

feature 'Users can login' do
  context 'when users try sign in' do
    let(:category) { create(:category, name: 'Ruby') }

    scenario 'successfully' do
      user = create(:user, password: 'negrosdev@9830')

      visit admin_root_path
      fill_in 'E-mail', with: user.email
      fill_in 'Senha', with: user.password
      click_on 'Entrar'

      expect(page).to have_http_status(:success)
      expect(page).to have_current_path(admin_root_path)
      expect(page).to have_content 'Login efetuado com sucesso.'
    end

    scenario 'visitors cannot access admin page' do
      visit new_user_session_path

      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
