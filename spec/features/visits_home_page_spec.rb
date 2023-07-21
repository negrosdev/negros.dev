require 'rails_helper'

feature 'Visits Home page' do
  context 'when visit page' do
    scenario 'successfully' do
      visit root_path

      expect(page).to have_http_status(:success)
    end

    scenario 'should have title' do
      visit root_path

      expect(page).to have_content('Negros.dev')
    end

    scenario 'should have footer' do
      visit root_path

      expect(page).to have_content '&COPY; Negros.dev, 2023 · Todos os direitos reservados.'
    end

    scenario 'should have published contents' do
      create(:content, name: 'Creating columns in SQL database', status: :published)

      visit root_path

      expect(page).to have_content 'Creating columns in SQL database'
    end

    scenario 'should have 6 published contents' do
      contents = create_list(:content, 8)

      visit root_path

      contents.each do |content|
        expect(page).to have_css(".published_content", count: 6)
      end
    end

    scenario 'should haven\'t content on review status' do
      content = create(:content, status: :review)

      visit root_path

      expect(page).not_to have_content(content.name)
      expect(page).to have_content('Não existe conteúdo para exibir')
    end

    scenario 'should haven\'t content on draft status' do
      content = create(:content, status: :draft)

      visit root_path

      expect(page).not_to have_content(content.name)
      expect(page).to have_content('Não existe conteúdo para exibir')
    end

    scenario 'should have DESC contents ordered' do
      travel_to 1.day.ago do
        create(:content, status: :published, name: 'Ruby On Rails - Configure Active Record')
      end
      travel_to 3.day.ago do
        create(:content, status: :published, name: 'OOP With Ruby')
      end
      travel_to Time.zone.now do
        create(:content, status: :published, name: 'About Remix framework')
      end

      visit root_path

      within 'section.contents > div:nth-child(1) > a:nth-child(1)' do
        expect(page).to have_content('About Remix framework')
      end
      within 'section.contents > div:nth-child(1) > a:nth-child(2)' do
        expect(page).to have_content('Ruby On Rails - Configure Active Record')
      end
      within 'section.contents > div:nth-child(1) > a:nth-child(3)' do
        expect(page).to have_content('OOP With Ruby')
      end
    end
  end
end
