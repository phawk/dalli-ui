require 'hashie'
require 'digest/sha1'

module Dalli
  module Ui
    class StatsPresenter
      attr_accessor :dalli

      def initialize(dalli_stats, template)
        @dalli = Hashie::Mash.new(dalli_stats)
        @template = template
      end

      def hit_rate
        hit_rate = 0
        total = Integer(dalli.get_hits) + Integer(dalli.get_misses)
        hit_rate = Integer(dalli.get_hits).to_f / total.to_f * 100 if total > 0
        hit_rate.round
      end

      def cache_size
        h.number_to_human_size(dalli.limit_maxbytes)
      end

      def host_id(host)
        Digest::SHA1.hexdigest host
      end

      def chart_data
        [
          {
            value: 100 - hit_rate,
            count: dalli.get_misses,
            color: "#F7464A",
            highlight: "#FF5A5E",
            label: "Miss rate"
          },
          {
            value: hit_rate,
            count: dalli.get_hits,
            color: "#46BFBD",
            highlight: "#5AD3D1",
            label: "Hit rate"
          }
        ]
      end

      private

        def h
          @template
        end

    end
  end
end
