feature 'Visitor view course page' do
  scenario 'and informations of course' do
    course = create(:course)

    visit root_path
    click_on course.title
    
    expect(current_path).to eq(course_path(course))
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.author.name)
  end
  scenario 'and view relateds courses' do
    category = create(:category, name: 'ruby')
    courses = create_list(:course, 4, category: category)

    visit root_path
    click_on courses.first.title

    expect(page).to have_css('.splide__slide', count: 4)
    expect(page).to have_content(courses.first.title)
    expect(page).to have_content(courses.last.title)
  end
end