class FlexibleSearch < ApplicationRecord
    def search_sonobat_outputs
        sonobat_outputs = SonobatOutput.all

        sonobat_outputs = sonobat_outputs.where(["manual_idspp1 LIKE ?", "%#{manual_idspp1}%"]) if manual_idspp1.present?
        sonobat_outputs = sonobat_outputs.where(["manual_idspp2 LIKE ?", "%#{manual_idspp2}%"]) if manual_idspp2.present?
        sonobat_outputs = sonobat_outputs.where(["night LIKE ?", "%#{night}%"]) if night.present?

        return sonobat_outputs

    end

end
