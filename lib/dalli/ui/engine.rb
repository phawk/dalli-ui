module Dalli
  module Ui
    class Engine < ::Rails::Engine
      isolate_namespace Dalli::Ui
    end
  end
end
