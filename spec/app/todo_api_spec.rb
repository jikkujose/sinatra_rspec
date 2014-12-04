require 'spec_helper'

RSpec.describe TodoAPI do
  def app
    TodoAPI
  end

  describe 'GET Todos' do
    context 'No Todos' do
      it 'returns no Todos' do
        get '/'
        expect(last_response.body).to eq("")
        expect(last_response.status).to eq(200)
      end
    end

    context 'Some Todos' do
      before do
        $db = %w[Buy_milk Clean_toilet Eat_sandwich]
      end

      it 'returns the contents of the DB' do
        get '/'
        expect(last_response.body).to eq($db.join('\n'))
        expect(last_response.status).to eq(200)
      end
    end
  end

  describe 'POST Todos' do
    context 'with required params' do
      it 'returns with 200 status' do
        post '/', todo: "Eat carrots"
        expect(last_response.status).to eq(200)
      end
    end

    context 'without required params' do
      it 'returns with 400 status' do
        post '/'
        expect(last_response.status).to eq(400)
      end
    end
  end
end
