Rails.application.routes.draw do
  scope '/api' do
    get :games, to: 'game#index'
    post :games, to: 'game#create'
    put :games, to: 'game#update'
    delete :games, to: 'game#destroy'
  end
end
  