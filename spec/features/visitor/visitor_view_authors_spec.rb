describe Author do
  it 'and view author' do
    author = create(:author, :with_photo)

    visit root_path
    click_on 'Social'

    expect(page).to have_current_path(authors_path, ignore_query: true)
    expect(page).to have_content(author.name)
  end
end
