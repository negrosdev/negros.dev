describe 'visitors view blog' do
  it 'and view single post' do
    create(:author, :with_photo)
    post = create(:post)

    visit  post_path(post)

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.content)
  end

  it 'and view author' do
    author = create(:author, :with_photo)
    post = create(:post, author: author)

    visit  post_path(post)

    expect(page).to have_content(post.author.name)
    expect(page).to have_link(id: 'linkedin', href: author.linkedin_url)
    expect(page).to have_link(id: 'mail', href: author.mail_url)
  end
end
