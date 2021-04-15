feature 'Visitor view course page' do
  scenario 'and informations of course' do
    album = create(:album)
    create(:video, album: album)
    author = create(:author, :with_photo)
    course = create(:course, album: album, author: author)

    visit root_path
    click_on course.title

    expect(current_path).to eq(course_path(course))
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.author.name)
  end
  scenario 'and count recommended courses' do
    category = create(:category, name: 'ruby')
    album = create(:album)
    
    author = create(:author, :with_photo)
    create(:video, album: album)
    courses = create_list(:course, 4, category: category, album: album, author: author)

    visit root_path
    click_on courses.first.title
    
    expect(page).to have_content('Recomendados')
    expect(page).to have_css('.splide__slide', count: 3)
  end
  scenario 'and view source code' do
    author = create(:author, :with_photo)
    album =  create(:album)
    create(:video, name: 'Introdução', order: 1, album: album)
    course = create(:course, album: album, author: author)

    visit root_path
    click_on course.title

    expect(page).to have_content('código fonte')
  end

  scenario 'and view active video' do
    author = create(:author, :with_photo)
    album =  create(:album)
    create_list(:video, 2, album: album)
    course = create(:course, album: album, author: author)

    visit root_path
    click_on course.title

    expect(page).to have_css('.is-active', count: 1)
  end

  scenario 'and view playlist' do
    author = create(:author, :with_photo)
    album =  create(:album)
    create(:video, name: 'Introdução', order: 1, album: album)
    create(:video, name: 'Criando Componentes', order: 2, album: album)
    course = create(:course, album: album, author: author)

    visit root_path
    click_on course.title

    expect(page).to have_content('lista de aulas')
    expect(page).to have_content(course.album.videos.first.name)
    expect(page).to have_content(course.album.videos.second.name)
  end
end