Rails.application.routes.draw do
  scope '/api' do
    resources:games
  end
end
  