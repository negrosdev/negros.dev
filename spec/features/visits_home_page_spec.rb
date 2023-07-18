require 'rails_helper'

feature 'Visits Home page' do
  scenario 'should main texts' do
    content = create(:content)

    visit root_path

    expect(page).to have_http_status :success
    expect(page).to have_content 'Marcus Almeida'
    expect(page).to have_content '&COPY; Marcus Almeida, 2023 · Todos os direitos reservados.'
  end
end
