require 'rails_helper'

describe AuthUser do
  describe '#from_omniauth_hash' do
    context 'with a valid omniauth hash' do
      subject { described_class.from_omniauth_hash(valid_omnniauth_user) }

      it 'sets the first name' do
        expect(subject.first_name).to eq('Alice')
      end

      it 'sets the last name' do
        expect(subject.last_name).to eq('Arnold')
      end

      it 'sets the url' do
        expect(subject.url).to eq('http://test.local/user/1')
      end
    end

    context 'with an invalid omniauth hash' do
      it 'raises an error' do
        expect do
          described_class.from_omniauth_hash(foo: 'bar')
        end.to raise_error
      end
    end
  end
end
