# encoding: UTF-8

require 'spec_helper'

describe Property::LivingSpace do
  context 'default property' do
    subject { create :property }

    describe 'has living space properties' do
      %w{furnishment rooms shared size type}.each do |attrib|
        it "has #{attrib}" do
          expect(subject.send(attrib)).to_not be nil
        end
      end
    end
  end
end
