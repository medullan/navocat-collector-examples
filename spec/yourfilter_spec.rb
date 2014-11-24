require 'rspec'
require 'rack/test'
require 'meda'
require 'meda/collector'
require 'rr'
require 'meda/core/hit'
require 'meda/core/Pageview'

require_relative '../YourFilter.rb'

module Example
  describe "YourFilter Test" do
    it 'yourfilter filter tracking id == 1' do
      filter = YourFilter.new()
      dataset = Meda::Dataset.new('dataset name', Meda.configuration)
      props = {}
      default_profile_id = {}
      hit =  Meda::Pageview.new(props, default_profile_id, dataset)

      hit = filter.filter_hit(hit,nil)
      expect(hit.tracking_id).to eq(1)
    end
  end
end

