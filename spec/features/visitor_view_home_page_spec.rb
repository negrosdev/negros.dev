describe 'Visitor view home' do
  it 'and returns status code 200' do
    visit root_path

    expect(status_code).to eq(200)
  end

  it 'and click in +conteúdos' do
    visit root_path

    click_on 'conteúdos'

    expect(current_path).to eq(contents_path)
  end

  it 'and find text' do
    visit root_path

    expect(page).to have_content('💕 De pessoas negras devs para o mundo! 💕')
  end

  it 'and view level' do
    author = create(:author, :with_photo)
    content = create(:content, author: author)

    visit root_path

    expect(page).to have_css('.fa-circle', count: content.level)
  end

  it 'and found content ' do
    author = create(:author, :with_photo)
    content = create(:content, author: author)

    visit root_path

    expect(page).to have_content(content.title)
    expect(page).to have_content(content.author.name)
  end

  it 'and found 04 contents' do
    author = create(:author, :with_photo)
    create_list(:content, 4, author: author)

    visit root_path

    expect(page).to have_css('.contents', count: 4)
  end
end
