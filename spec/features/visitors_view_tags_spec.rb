feature 'visitors view tag in exposed content' do
  scenario 'with successfully' do
    author = create(:author, :with_photo)
    tag = create(:tag, name: 'Go')

    tracks = create_list(:track, 2)
    content = create(:content, title: 'criando-apis-com-golang', author: author, tag: tag)
    content.tracks << tracks

    visit root_path

    within '#criando-apis-com-golang' do
      expect(page).to have_content(tag.name)
    end
  end
end
