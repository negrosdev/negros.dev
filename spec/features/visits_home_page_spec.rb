require 'rails_helper'

feature 'Visits Home page' do
  context 'when visit page' do
    before do
      create(:content, name: 'Creating columns in SQL database', status: :published)

      visit root_path
    end
    scenario 'successfully' do
      expect(page).to have_http_status(:success)
    end

    scenario 'should have title' do
      expect(page).to have_content('Negros.dev')
    end

    scenario 'should have footer' do
      expect(page).to have_content '&COPY; Negros.dev, 2023 · Todos os direitos reservados.'
    end

    scenario 'should have published contents' do
      expect(page).to have_content 'Creating columns in SQL database'
    end

    scenario 'should have 6 published contents' do
      create_list(:content, 8)

      visit root_path

      expect(page).to     have_css("#published_contents", count: 6)
      expect(page).not_to have_css("#published_contents", count: 8)
    end

    scenario 'should have ASC contents ordered' do
      create_list(:content, 8)

      visit root_path

      expect(page).to     have_css("#published_contents", count: 6)
      expect(page).not_to have_css("#published_contents", count: 8)
    end
  end
end
