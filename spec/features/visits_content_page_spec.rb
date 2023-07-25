require 'rails_helper'

feature 'Visits Content page' do
  context 'when visit page' do
    scenario 'through of home page' do
      content = create(:content, status: :published)

      visit root_path
      click_on content.name

      expect(page).to have_http_status(:success)
      expect(page).to have_content(content.name)
    end

    scenario 'directly' do
      content = create(:content, status: :published)

      visit content_path(content)

      expect(page).to have_content(content.name)
      expect(page).to have_content(content.body)
    end

    scenario 'should show the post it was published' do
      content = create(:content, status: :draft)

      visit content_path(content)

      expect(page).to have_content('Conteúdo não encontrado!')
      expect(page).not_to have_content(content.name)
      expect(page).not_to have_content(content.body)
    end
  end
end
