require 'rails_helper'

feature 'Visits Content page' do
  context 'when visit page' do
    let(:category) { create(:category, name: 'Ruby') }

    scenario 'through of home page' do
      content = create(:content, status: :published, category:)

      visit root_path
      click_on content.name

      expect(page).to have_http_status(:success)
      expect(page).to have_content(content.name)
    end

    scenario 'should view post' do
      content = create(:content, status: :published, category:)

      visit content_path(content)

      expect(page).to have_content(content.name)
      expect(page).to have_content(content.body)
    end

    scenario 'should view the post if it has been published' do
      content = create(:content, status: :draft, category:)

      visit content_path(content)

      expect(page).to have_content('Conteúdo não encontrado!')
      expect(page).not_to have_content(content.name)
      expect(page).not_to have_content(content.body)
      expect(page).not_to have_content(content.embeded_video)
    end
  end
end
