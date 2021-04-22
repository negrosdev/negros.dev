describe 'Visitor view home' do
  it 'and returns status code 200' do
    visit root_path

    expect(status_code).to eq(200)
  end

  it 'and click in +treinamentos' do
    visit root_path

    click_on '+treinamentos'

    expect(current_path).to eq(courses_path)
  end

  it 'and find text' do
    visit root_path

    expect(page).to have_content('💕 De pessoas negras devs para o mundo! 💕')
  end

  it 'and view stars ' do
    author = create(:author, :with_photo)
    course = create(:course, author: author)

    visit root_path

    expect(page).to have_css('.fa-star', count: course.level)
  end

  it 'and view category ' do
    author = create(:author, :with_photo)
    category = Category.create(name: 'Ruby', slug: 'ruby')
    course = create(:course, category: category, author: author)

    visit root_path

    expect(page).to have_css("figure[title=#{course.category.name}]")
  end

  it 'and found course ' do
    author = create(:author, :with_photo)
    course = create(:course, author: author)

    visit root_path

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.author.name)
  end

  it 'and found 04 courses' do
    author = create(:author, :with_photo)
    create_list(:course, 4, author: author)

    visit root_path

    expect(page).to have_css('.courses', count: 4)
  end
end
