require 'rails_helper'

feature 'Visits Home page' do
  context 'when visit page' do
    let(:category) { create(:category, name: 'Ruby') }

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
      create(:content, name: 'Creating columns in SQL database', status: :published, category:)

      visit root_path

      expect(page).to have_content 'Creating columns in SQL database'
      expect(page).to have_css("article[data-category*='Ruby']")
    end

    scenario 'should have 6 published contents' do
      contents = create_list(:content, 8, category:)

      visit root_path

      contents.each do |_content|
        expect(page).to have_css('.published_content', count: 6)
      end
    end

    scenario 'should haven\'t content on review status' do
      content = create(:content, status: :review, category:)

      visit root_path

      expect(page).not_to have_content(content.name)
      expect(page).to have_content('Não existe conteúdo para exibir')
    end

    scenario 'should haven\'t content on draft status' do
      content = create(:content, status: :draft, category:)

      visit root_path

      expect(page).not_to have_content(content.name)
      expect(page).to have_content('Não existe conteúdo para exibir')
    end

    scenario 'should have DESC contents ordered' do
      travel_to 1.day.ago do
        create(:content, name: 'Ruby On Rails - Configure Active Record', category:)
      end
      travel_to 3.days.ago do
        create(:content, name: 'OOP With Ruby', category:)
      end
      freeze_time do
        create(:content, name: 'About Remix framework', category:)
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
