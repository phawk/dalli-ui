Dalli::Ui::Engine.routes.draw do
  get "/" => "cache#index", as: :dalli_ui
  post "/flush" => "cache#flush", as: :dalli_ui_flush
end
