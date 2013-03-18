# encoding: UTF-8

require 'spec_helper'

describe Property::Size do  
  subject { property }

  context 'default property' do
    subject { create :property }

    describe 'type' do
      it 'should be an apartment' do
        expect(subject.type).to eq Property::Type.default_value
      end
    end

    describe 'size' do
      it 'should be default size' do
        expect(subject.size).to eq Property::Size.default_value
      end
    end

    describe 'sqm' do
      it 'should be = size' do
        expect(subject.sqm).to eq subject.size
      end
    end

    describe 'sqfeet' do
      it 'should be > sqm' do
        expect(subject.sqfeet).to be > subject.sqm
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

    describe 'size' do
      it 'should be default size' do
        expect(subject.size).to eq Property::Size.default_for :room
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

    describe 'size' do
      it 'should be default house size' do
        expect(subject.size).to eq Property::Size.default_for :house
      end
    end
  end  
end