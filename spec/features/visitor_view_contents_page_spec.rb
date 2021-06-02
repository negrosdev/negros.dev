describe 'Visitor view contents page' do
  it 'and returns status code 200' do
    visit root_path
    click_on 'conteúdos'

    expect(status_code).to eq(200)
  end

  it 'and no view contents' do
    visit root_path
    visit contents_path

    expect(page).to have_content('Os conteúdos ainda não foram cadastados.')
  end

  it 'view 05 contents' do
    author = create(:author, :with_photo)
    create_list(:content, 5, author: author)

    visit root_path
    click_on 'conteúdos'

    expect(page).to have_css('.contents', count: 5)
  end
end
