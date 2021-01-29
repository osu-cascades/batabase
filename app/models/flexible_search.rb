class FlexibleSearch < ApplicationRecord

    has_many :specifications, dependent: :destroy
    has_many :tables, through: :specifications

    def search()
        #assign parameters in a for each
        manual_idspp1 = params[:manual_idspp1]
        manual_idspp2 = params[:manual_idspp2]
        night = params[:night]
        if flexible_search.narrow?
            @sonobat_outputs = SonobatOutput.where(manual_idspp1: manual_idspp1)
            @sonobat_outputs = @sonobat_outputs.where(manual_idspp2: manual_idspp2)
            @sonobat_outputs = @sonobat_outputs.where(night: night)
            return @sonobat_outputs
        else
            @sonobat_outputs = SonobatOutput.where(manual_idspp1: manual_idspp1).or(SonobatOutput.where(manual_idspp2: manual_idspp2)).or(SonobatOutput.where(night: night))
            return @sonobat_outputs        
        end
    end

end
