Rails.application.routes.draw do
  root 'main#home'

  get :about, to: 'main#about'
  get :schedule, to: 'main#schedule'
  get :menu, to: 'main#menu'
  get :book, to: 'main#book'
  post :book, to: 'main#book_confirm'
  get :contact, to: 'main#contact'
  post :contact, to: 'main#contact_confirm'
end
