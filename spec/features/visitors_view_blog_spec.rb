describe 'visitors view blog' do
  it 'and view post' do
    create(:author, :with_photo)
    post = create(:post)

    visit root_path
    click_on 'blog'

    expect(status_code).to eq(200)
    expect(page).to have_content(post.title)
    expect(page).to have_content(I18n.l(post.created_at, format: :short))
  end
end
