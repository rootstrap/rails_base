
    it 'routes to #facebook' do
      expect(post: '/api/v1/user/facebook').to route_to('api/v1/sessions#facebook', format: :json)
    end
