Rails.application.routes.draw do
  root "game#try"
  get '/try' => 'game#try', as: 'try'
end
