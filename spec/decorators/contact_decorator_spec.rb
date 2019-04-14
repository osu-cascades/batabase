require 'rails_helper'

RSpec.describe ContactDecorator do
    let(:contact){ build(:contact).decorate }

    describe '#contact_name' do 

        it 'returns non nil value' do
            expect(contact.name == nil?).to eql(false)
        end

        it 'returns first and last name seperated by space' do
            expect(contact.name.include?(' ')).to eql(true)
        end
    end
end
