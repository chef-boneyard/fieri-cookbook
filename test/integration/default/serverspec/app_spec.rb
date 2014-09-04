require_relative 'spec_helper'

describe 'fieri' do
  it 'creates a unicorn socket' do
    expect(file '/tmp/.fieri.sock.0').to be_socket
  end

  describe file('/srv/fieri/current/.env') do
    it { should be_linked_to '/srv/fieri/shared/env' }

    describe 'SENTRY_URL' do
      it 'it is the file' do
        expect(open('/srv/fieri/current/.env').read).to include('SENTRY_URL=test')
      end
    end
  end

  describe file('/srv/fieri/shared') do
    it { should be_directory }
  end
end
