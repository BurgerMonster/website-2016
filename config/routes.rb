Rails.application.routes.draw do
  constraints(host: /^burgermonster\.net/) do
    match "(*any)" => redirect { |params, request|
      URI.parse(request.url).tap { |uri| "www.#{uri.host}" }.to_s
    }
  end

  root 'main#home'

  get :menu, to: 'main#menu'
  get :schedule, to: 'main#schedule'
  get :catering, to: 'main#catering'
  # post :catering, to: 'main#catering_confirm'
  get :about, to: 'main#about'
  post :contact, to: 'main#contact'
end
