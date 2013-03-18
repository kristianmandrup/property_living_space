# encoding: UTF-8

require 'spec_helper'

describe Property::Rooms do  
  subject { property }

  context 'default property' do
    subject { create :property }

    describe 'type' do
      it 'should be an apartment' do
        expect(subject.type).to eq Property::Type.default_value
      end
    end

    describe 'default_for_type' do
      it 'should be 2' do
        expect(subject.default_for_type :rooms).to eq 2
      end
    end

    describe 'rooms' do
      it 'should have 1 room by default' do
        expect(subject.rooms).to eq Property::Rooms.default_value
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

    describe 'rooms' do
      it 'should have 1 room by default' do
        expect(subject.rooms).to eq Property::Rooms.default_for :room
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

    describe 'rooms' do
      it 'should have 3 room by default' do
        expect(subject.rooms).to eq Property::Rooms.default_for(:house)
      end
    end

    context 'set to 6 rooms' do
      before do
        subject.rooms = 6
      end

      describe 'rooms' do
        it 'should have 3 room by default' do
          expect(subject.rooms).to eq 6
        end
      end
    end

    context 'set to 13 rooms' do
      before do
        subject.rooms = 13
      end

      describe 'rooms' do
        it 'should be invalid' do
          expect(subject.valid?).to be_false
        end
      end
    end
  end
end