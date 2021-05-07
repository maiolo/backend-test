Rails.application.routes.draw do
  root to: 'payloads#new'
  patch "payloads", to: 'payloads#result'
  get 'result', to: 'payloads#result'
end
