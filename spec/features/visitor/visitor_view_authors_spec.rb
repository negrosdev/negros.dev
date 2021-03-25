feature Author do
  scenario 'and view author' do
    author = create(:author)

    visit root_path
    click_on 'Instrutores'
    
    expect(current_path).to eq(authors_path) 
    expect(page).to have_content(author.name)
  end
end