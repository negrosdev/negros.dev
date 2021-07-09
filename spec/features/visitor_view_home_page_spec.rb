describe 'visitors view home' do
  it 'and view contents' do
    author = create(:author, :with_photo)
    content = create(:content, title: 'Entendendo o funcionamento de uma API', author: author)

    visit root_path

    expect(status_code).to eq(200)
    expect(page).to have_content(content.title)
  end

  it 'and count total of contents' do
    author = create(:author, :with_photo)
    create_list(:content, 12, author: author)

    visit root_path

    expect(page).to have_css('.content', count: 8)
    expect(page).not_to have_css('.content', count: 12)
  end

  it 'and found content ', js: true do
    author = create(:author, :with_photo)
    content = create(:content, title: 'A Linguagem Go', author: author)
    create(:content, title: 'A Linguagem Ruby', author: author)

    visit root_path

    fill_in 'Buscar', with: content.title

    expect(page).to have_content(content.title)
  end
end
