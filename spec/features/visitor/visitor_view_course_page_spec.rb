describe 'Visitor view course page' do
  it 'and informations of course' do
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

  it 'checks if the course is among the recommended ones' do
    album = create(:album)
    create(:video, album: album)
    author = create(:author, :with_photo)
    courses = create_list(:course, 3, album: album, author: author)

    visit root_path
    click_on courses.last.title

    expect(page).to have_content(courses.first.title)
  end

  it 'and count recommended courses' do
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

  it 'and view source code' do
    author = create(:author, :with_photo)
    album =  create(:album)
    create(:video, name: 'Introdução', order: 1, album: album)
    course = create(:course, album: album, author: author)

    visit root_path
    click_on course.title

    expect(page).to have_content('código fonte')
  end

  it 'and view playlist' do
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
