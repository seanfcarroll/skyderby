feature 'Badges' do
  scenario 'Index' do
    badge = create :badge
    sign_in_as_admin

    visit badges_path

    expect(page).to have_content(badge.name)
  end

  scenario 'Update', js: true do
    create :badge, name: 'WWL 2020'

    sign_in_as_admin

    visit badges_path
    click_link I18n.t('general.edit'), visible: false
    fill_in 'badge[name]', with: 'WBR 2020'
    click_button I18n.t('general.save')

    expect(page).to have_content('WBR 2020')
  end

  scenario 'Delete', js: true do
    create :badge, name: 'WWL 2020'

    sign_in_as_admin

    visit badges_path
    click_link I18n.t('general.delete'), visible: false

    expect(page).not_to have_content('WBR 2020')
  end
end