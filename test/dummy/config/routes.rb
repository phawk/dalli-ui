Rails.application.routes.draw do

  mount Dalli::Ui::Engine => "/dalli"
end
