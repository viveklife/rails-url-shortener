require 'rails_helper'

RSpec.describe Url, type: :model do
  let(:url) { FactoryBot.build(:url) }

  context 'with validations' do
    let(:persisted_record) { FactoryBot.create(:url, original_url: 'www.google.com') }

    it 'is invalid without a original url' do
      url.original_url = nil
      expect(url).not_to be_valid
    end

    it 'is valid with a valid original url' do
      expect(url).to be_valid
    end

    it 'is invalid with an invalid original url' do
      url.original_url = 'google'
      expect(url).not_to be_valid
    end

    describe '#already_exists?' do
      it "it considered 'www.google.com' and 'http://google.com' are same" do
        persisted_record
        url.original_url = 'www.google.com'
        url.valid?
        expect(url).not_to be_valid
      end

      it "it considered 'www.google.com/' and 'http://google.com' are same" do
        persisted_record
        url.original_url = 'www.google.com'
        url.valid?
        expect(url).not_to be_valid
      end

      it "it considered 'google.com' to 'http://google.com' are same" do
        persisted_record
        url.original_url = 'www.google.com'
        url.valid?
        expect(url).not_to be_valid
      end

      it "it considered 'https://www.google.com' to 'http://google.com' are same" do
        persisted_record
        url.original_url = 'www.google.com'
        url.valid?
        expect(url).not_to be_valid
      end

      it "it considered 'http://www.google.com' to 'http://google.com' are same" do
        persisted_record
        url.original_url = 'www.google.com'
        url.valid?
        expect(url).not_to be_valid
      end
    end
  end

  context 'with url methods' do
    describe '#assgin_short_url' do
      it 'it generates unique 10 chars random string for short_url' do
        url.assgin_short_url
        expect(url.short_url.length).to eq(10)
      end

      it 'it generated alphnumeric random string' do
        expect(url.short_url).to match(/\A[a-zA-Z0-9]*\z/i)
      end
    end

    describe '#generate_short_url' do
      it 'it generated 10 chars random string' do
        expect(url.generate_short_url.length).to eq(10)
      end

      it 'it generated alphnumeric random string' do
        expect(url.generate_short_url).to match(/\A[a-zA-Z0-9]*\z/i)
      end
    end

    describe '#format_url' do
      it 'it removed the white space' do
        url.original_url = 'google.com   '
        url.save
        expect(url.original_url).to eq('google.com')
      end

      it 'it always return downcase string' do
        url.original_url = 'Google.Com'
        url.save
        expect(url.original_url).to eq('google.com')
      end
    end
  end
end
