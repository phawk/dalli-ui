require 'dalli/ui/stats_presenter'

module Dalli
  module Ui
    class CacheController < ApplicationController
      layout "dalli/ui/application"

      def index
        @stats = wrap_presenters Rails.cache.dalli.stats
      end

      def flush
        Rails.logger.info "Dalli::Ui Flushed Dalli cache store"
        Rails.cache.dalli.flush

        flash[:dalli_ui_notice] = "Flushed cache store"
        redirect_to dalli_ui_path
      end

      private

        def wrap_presenters(stats)
          stats_presnters = {}

          stats.each do |server, stats|
            stats_presnters[server] = Dalli::Ui::StatsPresenter.new(stats, view_context)
          end

          stats_presnters
        end

    end
  end
end
