feature 'Visitors view tags' do
  scenario 'with successfully' do
    tags = create_list(:tag, 5)

    visit root_path
    click_on '#tags'

    expect(page).to have_content(tags[0].name)
    expect(page).to have_content(tags[1].name)
    expect(page).to have_content(tags[2].name)
    expect(page).to have_content(tags[3].name)
    expect(page).to have_content(tags[4].name)
  end

  scenario 'and check color' do
    create(:tag, color: :dark)

    visit root_path
    click_on '#tags'

    expect(page).to have_css('a.button.is-dark')
  end

  scenario 'and check link' do
    tag = create(:tag)
    author = create(:author, :with_photo)
    create(:content, tag: tag, author: author)

    visit root_path
    click_on '#tags'

    expect(page).to have_link(tag.name, href: tag_path(tag.name))
  end

  scenario 'and view contents relationshipped' do
    tag = create(:tag)
    author = create(:author, :with_photo)
    content = create(:content, tag: tag, author: author)

    visit root_path
    click_on '#tags'
    click_on tag.name

    expect(page).to have_content(content.title)
  end
end
