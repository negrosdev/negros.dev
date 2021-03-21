feature 'Visitor view course page' do
  scenario 'and informations of course' do
    course = create(:course)

    visit root_path
    click_on course.title
    
    expect(current_path).to eq(course_path(course))
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.user.name)
  end
end