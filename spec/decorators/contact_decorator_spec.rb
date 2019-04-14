require 'rails_helper'

RSpec.describe ContactDecorator do
    let(:contact){ build(:contact).decorate }

    describe '#contact_name' do 
        it 'returns contact name' do
            expect(contact.name == nil?).to eql(false)
        end
    end
end
