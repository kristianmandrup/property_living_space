# encoding: UTF-8

require 'spec_helper'

describe Property::Shared do  
  subject { property }

  context 'default property' do
    subject { create :property }

    describe 'type' do
      it 'should be an apartment' do
        expect(subject.type).to eq Property::Type.default_value
      end
    end

    describe 'shared' do
      it 'should not be shared by default' do
        expect(subject.shared).to be_false
      end
    end

    describe 'shared?' do
      it 'should be false' do
        expect(subject.shared?).to be_false
      end
    end
  end

  context 'property: Room' do
    subject { create :property, type: 'room' }

    describe 'type' do
      it 'should be a room' do
        expect(subject.type).to eq 'room'
      end
    end

    describe 'shared?' do
      it 'should be true' do
        expect(subject.shared?).to be_true
      end
    end
  end  
end
