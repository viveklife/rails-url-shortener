require 'rails_helper'

RSpec.describe UrlsHelper, type: :helper do
  let(:url) { FactoryBot.build(:url) }

  describe '#shortened_full_url' do
    it 'concats two base url with short_url' do
      url.short_url = 'dbsXsf'
      expect(helper.shortened_full_url(url)).to eq('http://test.host/dbsXsf')
    end
  end
end
