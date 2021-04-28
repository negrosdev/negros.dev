describe 'Visitor view courses page' do
  it 'and returns status code 200' do
    visit root_path
    click_on 'treinamentos'

    expect(status_code).to eq(200)
  end

  it 'and no view categories' do
    pending

    author = create(:author, :with_photo)
    create(:course, author: author)

    visit root_path
    visit '/treinamentos/golang/categorias'

    expect(status_code).to eq(:not_found)
    expect(page).to have_content('A categoria que você procura não foi encontrada 😢')
  end

  it 'and no view courses' do
    visit root_path
    visit courses_path

    expect(page).to have_content('Os cursos ainda não foram cadastados no momento.')
  end

  it 'view 05 courses' do
    author = create(:author, :with_photo)
    create_list(:course, 5, author: author)

    visit root_path
    click_on 'treinamentos'

    expect(page).to have_css('.courses', count: 5)
  end

  it 'view courses from category' do
    author = create(:author, :with_photo)
    category = create(:category, name: 'Ruby', slug: 'ruby')
    course = create(:course, category: category, author: author)

    visit root_path
    click_on 'treinamentos'

    within '.category' do
      click_on 'Ruby'
    end

    expect(page).to have_current_path(categorias_course_path(category), ignore_query: true)
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.author.name)
  end
end
