describe 'visitors view content page' do
  it 'and found informations about content' do
    author = create(:author, :with_photo)
    tracks = create_list(:track, 2, resource: 'Recurso **Teste**')
    content = create(:content, title: 'Entendendo o funcionamento de uma API', author: author)
    content.tracks << tracks

    visit root_path

    within '#entendendo-o-funcionamento-de-uma-api' do
      click_on 'Começar'
    end

    expect(current_path).to eq(content_path(content))
    expect(page).to have_content(tracks.first.name)
  end

  it 'and see tracks' do
    author = create(:author, :with_photo)
    content = create(:content, title: 'Entendendo o funcionamento de uma API', author: author)
    track2 = create(:track, order: 2, name: 'Trilha 2', resource: 'Trilha 2 Resource', content: content)
    track4 = create(:track, order: 4, name: 'Trilha 4', resource: 'Trilha 4 Resource', content: content)
    track3 = create(:track, order: 3, name: 'Trilha 3', resource: 'Trilha 3 Resource', content: content)
    track1 = create(:track, order: 1, name: 'Trilha 1', resource: 'Trilha 1 Resource', content: content)

    visit content_path(content)

    within '.uk-list > li:nth-child(1)' do
      expect(page).to have_content(track1.name)
    end

    within '.uk-list > li:nth-child(2)' do
      expect(page).to have_content(track2.name)
    end

    within '.uk-list > li:nth-child(3)' do
      expect(page).to have_content(track3.name)
    end

    within '.uk-list > li:nth-child(4)' do
      expect(page).to have_content(track4.name)
    end
  end

  it 'and see type of tracks' do
    author = create(:author, :with_photo)

    content = create(:content, title: 'Entendendo o funcionamento de uma API', author: author)
    create(:track, order: 1, track_type: :video, content: content)
    create(:track, order: 2, track_type: :text, content: content)
    create(:track, order: 3, track_type: :code, content: content)

    visit content_path(content)

    within '.uk-list > li:nth-child(1)' do
      expect(page).to have_css('span[uk-icon="icon: video-camera; ratio: 1"]')
    end

    within '.uk-list > li:nth-child(2)' do
      expect(page).to have_css('span[uk-icon="icon: file-text; ratio: 1"]')
    end

    within '.uk-list > li:nth-child(3)' do
      expect(page).to have_css('span[uk-icon="icon: code; ratio: 1"]')
    end
  end

  it 'and see author profile' do
    author = create(:author, :with_photo)

    content = create(:content, author: author)
    create(:track, content: content)

    visit content_path(content)

    expect(page).to have_content(author.name)
    expect(page).to have_link(id: 'linkedin', href: author.linkedin_url)
    expect(page).to have_link(id: 'mail', href: author.mail_url)
  end

  it 'and see description' do
    author = create(:author, :with_photo)

    content = create(:content, author: author)
    create(:track, content: content)

    visit content_path(content)

    within '#description' do
      expect(page).to have_content(content.description)
    end
  end
end
