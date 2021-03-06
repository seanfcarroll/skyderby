describe Api::V1::Events::CompetitorsController do
  render_views

  it '#index' do
    get :index, params: { event_id: events(:published_public).id }, format: :json
    expect(response.successful?).to be_truthy

    response_json = JSON.parse(response.body)
    expect(response_json).to eq(JSON.parse(
      [
        {
          id: 1,
          name: 'John',
          suit_id: suits(:apache).id,
          suit_name: 'Apache Series',
          category_id: event_sections(:speed_distance_time_advanced).id,
          category_name: 'Advanced'
        }, {
          id: 2,
          name: 'Travis',
          suit_id: suits(:apache).id,
          suit_name: 'Apache Series',
          category_id: event_sections(:speed_distance_time_advanced).id,
          category_name: 'Advanced'
        }
      ].to_json
    ))
  end
end
