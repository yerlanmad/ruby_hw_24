RSpec.describe Query do
  before { subject.get('https://vault77.kz/ruby') }

  describe '#get' do
    it 'sends GET request' do
      expect(subject.uri).to eq URI('https://vault77.kz/ruby')
      expect(subject.response.class).to eq Net::HTTPOK
    end
  end

  describe '#uri' do
    it 'retruns uri' do
      expect(subject.uri.host).to eq 'vault77.kz'
      expect(subject.uri.port).to eq 443
    end
  end
  
  describe '#response' do
    it 'returns response' do
      resp = subject.get('https://google.com/')

      expect(subject.response).to eq resp
    end
  end

  describe '#resp_code' do
    it 'returns response code' do
      allow(subject.response).to receive(:code).and_return('200') 

      expect(subject.resp_code).to eq '200'
    end
  end

  describe '#resp_body' do
    it 'returns response body' do
      allow(subject.response).to receive(:body).and_return('body') 

      expect(subject.resp_body).to eq 'body'
    end
  end

  describe '#resp_headers' do
    it 'returns response headers' do
      allow(subject.response).to receive(:each_header).and_return({"HEADER": ["value"]})

      expect(subject.resp_headers).to eq ({"HEADER": ["value"]})
    end
  end
end
