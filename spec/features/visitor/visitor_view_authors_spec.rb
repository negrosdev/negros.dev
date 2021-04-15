feature Author do
  scenario 'and view author' do
    author = create(:author, :with_photo)

    visit root_path
    click_on 'Social'
    
    expect(current_path).to eq(authors_path) 
    expect(page).to have_content(author.name)
  end
end