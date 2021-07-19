describe 'visitors view blog' do
  it 'and view single post' do
    create(:author, :with_photo)
    post = create(:post)

    visit  post_path(post)

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.content)
    expect(page).to have_content(I18n.l(post.created_at, format: '%d %b de %Y'))
  end

  it 'and view author' do
    author = create(:author, :with_photo)
    post = create(:post, author: author)

    visit  post_path(post)

    expect(page).to have_content(post.author.name)
    expect(page).to have_link(id: 'linkedin', href: author.linkedin_url)
    expect(page).to have_link(id: 'facebook', href: author.facebook_url)
    expect(page).to have_link(id: 'instagram', href: author.instagram_url)
    expect(page).to have_link(id: 'github', href: author.github_url)
    expect(page).to have_link(id: 'twitter', href: author.twitter_url)
  end

  it 'and not view author email' do
    author = create(:author, :with_photo)
    post = create(:post, author: author)

    visit post_path(post)

    expect(page).not_to have_link(id: 'mail', href: author.mail_url)
  end
end
