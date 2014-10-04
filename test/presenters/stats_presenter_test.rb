require 'test_helper'
require 'dalli/ui/stats_presenter'

describe Dalli::Ui::StatsPresenter, :view do
  let(:stats) { MultiJson.load(File.read(File.expand_path(File.join(__FILE__, "..", "..", "fixtures/dalli_stats.json")))) }
  let(:presenter) { Dalli::Ui::StatsPresenter.new(stats["localhost:11211"], view) }

  it "returns the hit rate" do
    presenter.hit_rate.must_equal 41
  end

  it "returns cache size" do
    presenter.cache_size.must_equal "256 MB"
  end

  it "hashes a host_id" do
    presenter.host_id("localhost:11211").must_equal "6c45b424b9f84e1e24e1efae29caed24ba2d2e7f"
  end

  it "returns chart data" do
    presenter.chart_data[0][:label].must_equal "Miss rate"
    presenter.chart_data[0][:value].must_equal 59

    presenter.chart_data[1][:label].must_equal "Hit rate"
    presenter.chart_data[1][:value].must_equal 41
  end

end
