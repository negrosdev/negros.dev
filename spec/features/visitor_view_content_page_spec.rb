describe 'Visitor view content page' do
  it 'and informations of content' do
    author = create(:author, :with_photo)
    content = create(:content, author: author)

    visit root_path
    click_on content.title

    expect(current_path).to eq(content_path(content))
    expect(page).to have_content(content.title)
    expect(page).to have_content(content.author.name)
  end

  it 'and view source code' do
    author = create(:author, :with_photo)
    content = create(:content, author: author)

    visit root_path
    click_on content.title

    expect(page).to have_content('código fonte')
  end

  it 'and view training download' do
    author = create(:author, :with_photo)
    content = create(:content, author: author)

    visit root_path
    click_on content.title

    expect(page).to have_content('baixar treinamento')
  end

  it 'and view author profile' do
    author = create(:author, :with_photo)
    content = create(:content, author: author)

    visit root_path
    click_on content.title

    expect(page).to have_content(author.name)
    expect(page).to have_link(id: 'linkedin', href: author.linkedin_url)
  end
end
