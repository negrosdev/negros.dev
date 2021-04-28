describe 'Visitor view course page' do
  it 'and informations of course' do
    author = create(:author, :with_photo)
    course = create(:course, author: author)

    course.thumbnail.attach(io: File.open('spec/support/assets/django.jpg'),
                            filename: 'django.jpg', content_type: 'image/jpg')

    visit root_path
    click_on course.title

    expect(current_path).to eq(course_path(course))
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.author.name)
  end

  it 'checks if the course is among the recommended ones' do
    author = create(:author, :with_photo)
    courses = create_list(:course, 3, author: author)

    visit root_path
    click_on courses.last.title

    expect(page).to have_content(courses.first.title)
  end

  it 'and count recommended courses' do
    category = create(:category, name: 'ruby')

    author = create(:author, :with_photo)
    course = create(:course, category: category, author: author)

    visit root_path
    click_on course.title

    expect(page).to have_content('recomendamos')
  end

  it 'and view source code' do
    author = create(:author, :with_photo)
    course = create(:course, author: author)

    visit root_path
    click_on course.title

    expect(page).to have_content('código fonte')
  end

  it 'and view author profile' do
    author = create(:author, :with_photo)
    course = create(:course, author: author)

    visit root_path
    click_on course.title

    expect(page).to have_content(author.name)
    expect(page).to have_link(id: 'twitter', href: author.twitter_url)
    expect(page).to have_link(id: 'instagram', href: author.instagram_url)
    expect(page).to have_link(id: 'youtube', href: author.youtube_url)
    expect(page).to have_link(id: 'linkedin', href: author.linkedin_url)
  end
end
