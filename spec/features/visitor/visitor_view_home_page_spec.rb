feature 'Visitor view home' do
  scenario 'and returns status code 200' do
    visit root_path

    expect(status_code).to eq(200)
  end

  scenario 'and find text' do
    
    visit root_path

    expect(page).to have_content('💕 De pessoas devs De negras para o mundo! 💕')
  end

  scenario 'and found course ' do
    course = create(:course)

    visit root_path

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.user.name)
  end

  scenario 'and found 04 courses' do
    create_list(:course, 4)

    visit root_path
    
    expect(page).to have_css('.courses', count: 4)
  end
end