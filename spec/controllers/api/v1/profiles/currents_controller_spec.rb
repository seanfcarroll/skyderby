describe Api::V1::Profiles::CurrentsController do
  render_views

  describe '#show' do
    it 'when not authenticated' do
      get :show, format: :json
      expect(response.forbidden?).to be_truthy
    end

    it 'when authenticated' do
      sign_in users(:regular_user)

      get :show, format: :json

      expect(response.successful?).to be_truthy

      response_json = JSON.parse(response.body)
      expect(response_json['name']).to eq('Regular user')
    end
  end
end
