describe 'visitors view blog' do
  it 'and view post' do
    create(:author, :with_photo)
    post = create(:post, content: '**example class** for python')

    visit root_path
    click_on 'blog'

    expect(status_code).to eq(200)
    expect(page).to have_content(post.title)
    expect(page).to have_content('example class for python')
    expect(page).to have_content(I18n.l(post.created_at, format: '%d %b de %Y'))
  end

  it 'and view post resume' do
    create(:author, :with_photo)
    create(:post, content: '**Lorem ipsum** dolor sit amet consectetur *adipisicing* elit. Modi quis, maxime dolor' \
                  'totam consectetur laborum eligendi libero voluptatem nostrum **nulla placeat repudiandae**')

    visit root_path
    click_on 'blog'

    expect(status_code).to eq(200)
    expect(page).to have_content('Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi quis, maxime' \
                                 'dolor totam consectetur laborum...')
  end
end
