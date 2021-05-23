describe 'Visitors view forum' do
  it 'and view topics' do
    threads = create_list(:thread, 5)
    
    visit root_path
    click_on 'fórum'

    expect(page).to have_content(threads[0][:title])
    expect(page).to have_content(threads[1][:title])
    expect(page).to have_content(threads[2][:title])
    expect(page).to have_content(threads[3][:title])
    expect(page).to have_content(threads[4][:title])
    expect(page).to have_content(threads[5][:title])
  end
end