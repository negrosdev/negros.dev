require 'rails_helper'

feature 'Visits Home page' do
  before {  visit root_path }

  context 'when visit page successfully' do
    scenario { expect(page).to have_http_status :success }
  end

  context 'when visitors view title' do
    scenario { expect(page).to have_content 'Negros.dev' }
  end

  context 'when visitors view footer' do
    scenario { have_content '&COPY; Negros.dev, 2023 · Todos os direitos reservados.' }
  end
end
