require 'spec_helper'

describe SafeAttributeAssignment do
  class DummyModel
    include SafeAttributeAssignment

    attr_accessor :name
  end

  let(:dummy) { DummyModel.new }
  let(:name) { 'my name' }

  describe 'included' do
    it { expect(dummy).to respond_to(:assign_attributes) }
  end

  describe '#assign_attributes' do
    context 'without attributes' do
      it { expect { dummy.assign_attributes }.not_to raise_error }
    end

    context 'without nil attributes' do
      it { expect { dummy.assign_attributes(nil) }.not_to raise_error }
    end

    context 'with object attributes' do
      it 'should change attribute value' do
        expect { dummy.assign_attributes({ name: name }) }.to change { dummy.name }
      end
      it 'set the attribute' do
        dummy.assign_attributes({ name: name })
        expect(dummy.name).to eq name
      end
    end
    context 'without wrong attributes' do
      it { expect { dummy.assign_attributes(age: 20) }.not_to raise_error }
    end
  end
end
