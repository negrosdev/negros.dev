describe 'Visitor view courses page' do
  it 'and returns status code 200' do
    visit root_path
    click_on 'conteúdos'

    expect(status_code).to eq(200)
  end

  it 'and no view courses' do
    visit root_path
    visit contents_path

    expect(page).to have_content('Os cursos ainda não foram cadastados no momento.')
  end

  it 'view 05 courses' do
    author = create(:author, :with_photo)
    create_list(:content, 5, author: author)

    visit root_path
    click_on 'conteúdos'

    expect(page).to have_css('.contents', count: 5)
  end

  it 'view courses from tag' do
    pending

    author = create(:author, :with_photo)
    tag = create(:tag, name: 'Ruby')
    content = create(:content, tag: tag, author: author)

    visit root_path
    click_on 'conteúdos'

    within '.tag' do
      click_on 'Ruby'
    end

    expect(page).to have_current_path(tags_content_path(tag), ignore_query: true)
    expect(page).to have_content(content.title)
    expect(page).to have_content(content.author.name)
  end
end
