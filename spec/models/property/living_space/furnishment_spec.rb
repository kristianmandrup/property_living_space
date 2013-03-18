# encoding: UTF-8

require 'spec_helper'

describe Property::Furnishment do  
  subject { property }

  let(:property) { create :property }

  context 'default property' do
    describe 'furnishment' do
      it 'should be unfurnished by default' do
        expect(subject.furnishment).to eq "unfurnished"
      end
    end

    describe 'furnished?' do
      it 'should be true' do
        expect(subject.furnished?).to be_false
      end
    end

    describe 'unfurnished?' do
      it 'should be false' do
        expect(subject.unfurnished?).to be_true
      end
    end

    describe 'set furnishment state' do
      before do
        subject.furnishment = 'furnished'
      end

      describe 'furnished?' do
        it 'should be true' do
          expect(subject.furnished?).to be_true
        end
      end
    end        
  end

  context 'furnished property' do
    subject { create :property, furnished: true }

    describe 'furnished?' do
      it 'should be true' do
        expect(subject.furnished?).to be_true
      end
    end

    describe 'unfurnished?' do
      it 'should be false' do
        expect(subject.unfurnished?).to be_false
      end
    end

    describe 'set furnishment state' do
      before do
        subject.furnishment = 'unfurnished'
      end

      describe 'furnished?' do
        it 'should be true' do
          expect(subject.furnished?).to be_false
        end
      end
    end    
  end
end
