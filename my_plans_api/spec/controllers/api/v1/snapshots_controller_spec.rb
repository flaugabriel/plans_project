require 'rails_helper'

RSpec.describe Api::V1::SnapshotsController, type: :controller do
  describe 'GET #should_retain' do
    context "when all params is correct" do
      let(:params) { { plan: 'Pro', date: '2023/04/30' } } 
      before do 
        get :should_retain, params: params
      end

      it 'when return retain true' do
        expect(JSON.parse(response.body)).to eq({"should_retain"=>true})
      end  
 
      it 'when return status ok' do
        expect(response).to have_http_status(:ok)
      end     
    end

    context 'when all params is correct' do
      let(:params) { { plan: 'Pro', date: '2023/01/30' } } 
      before do 
        get :should_retain, params: params
      end

      it 'but return retain false' do
        expect(JSON.parse(response.body)).to eq({"should_retain"=>false})
      end

      it 'when return status ok' do
        expect(response).to have_http_status(:ok)
      end 
    end

    context 'when some params are not present' do
      let(:params) { { plan: '', date: '2023/02/01' } } 
      before do 
        get :should_retain, params: params
      end

      it 'when return retain unprocessed' do
        status = JSON.parse(response.body)
        expect(status['status']).to eq("unprocessable_entity")
      end
    end
  end
end