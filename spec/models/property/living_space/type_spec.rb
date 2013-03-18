# encoding: UTF-8

require 'spec_helper'

describe Property::Type do  
  subject { property }

  context 'default property' do
    subject { create :property }

    describe 'type' do
      it 'should be an apartment' do
        expect(subject.type).to eq Property::Type.default_value
      end
    end

    describe 'room?' do
      it 'should be false' do
        expect(subject.room?).to be false
      end
    end    
  end

  context 'property: Room ' do
    subject { create :property, type: 'room' }

    describe 'type' do
      it 'should be an room' do
        expect(subject.type).to eq 'room'
      end
    end

    describe 'room?' do
      it 'should be true' do
        expect(subject.room?).to be true
      end
    end    
  end

  context 'property: House' do
    subject { create :property, type: 'house' }

    describe 'type' do
      it 'should be a house' do
        expect(subject.type).to eq 'house'
      end
    end

    describe 'room?' do
      it 'should be true' do
        expect(subject.room?).to be false
      end
    end    
  end  
end