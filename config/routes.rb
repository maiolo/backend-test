Rails.application.routes.draw do
  root to: 'payloads#new'
  post "payloads", to: 'payloads#result'
  get 'result', to: 'payloads#result'
end
