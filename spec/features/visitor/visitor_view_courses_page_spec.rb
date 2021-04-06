feature 'Visitor view courses page' do
  scenario 'and returns status code 200' do
    visit root_path
    click_on 'Cursos'

    expect(status_code).to eq(200)
  end

  scenario 'and no view categories' do
    pending 'not ready'
    course = create(:course)

    visit root_path
    visit '/cursos/golang/categorias'
    
    expect(page).to have_content('A categoria que você procura não foi encontrada 😢')
  end

  scenario 'and no view courses' do
    visit root_path
    visit courses_path
    
    expect(page).to have_content('Os cursos ainda não foram cadastados no momento.')
  end

  scenario 'view 05 courses' do
    courses = create_list(:course, 5)

    visit root_path
    click_on 'Cursos'
    
    expect(page).to have_css('.courses', count: 5)
  end

  scenario 'view courses from category' do
    category = create(:category, name: 'Ruby', slug: 'ruby')
    course = create(:course, category: category)

    visit root_path
    click_on 'Cursos'
    
    within '.category' do
      click_on 'Ruby'
    end

    expect(current_path).to eq(categorias_course_path(category))
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.author.name)
  end
end