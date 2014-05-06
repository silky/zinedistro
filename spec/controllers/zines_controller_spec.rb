require 'spec_helper'
describe ZinesController do

  context 'parameters' do

    it 'requires an id' do
      params = ActionController::Parameters.new(id: 'foo', name: 'baz')
      zine_params = ZinesController::ZineParams.build(params)
      expect(zine_params).to eq('foo')
    end

  end

  describe '#show' do

    context 'with one zine' do
      let(:zine) { create :zine_with_authors }

      context 'with valid params' do
        before do
          get :show, id: zine.id
        end

        it 'returns successfully' do
          response.should be_success
        end

        it 'assigns zine as :zine' do
          assigns(:zine).should eq zine
        end

        it 'is decorated with ZineDecorator' do
          assigns(:zine).should be_decorated_with ZineDecorator
        end

      end
    end
  end

  describe '#index' do
    let(:author_with_zines) { create :author, :with_zines }

    context 'with valid params' do

      before do
        get :index
      end

      it 'returns sucessfully' do
        response.should be_success
      end

      it 'assigns the entire published zine catalog as @zines' do
        assigns(:zines).should eq Zine.catalog
      end

    end

  end
end
