class FlexibleSearch < ApplicationRecord
    before_save do
        self[:search_field] = "{ "
        @deployment_start = false
        @so_start = false
        self.searchables.each do |s|
            if parent_table(s) == "deployment" and @deployment_start == false
                self[:search_field] << parent_table(s)
                self[:search_field] << " => ["
                @deployment_start = true
            end
            if @deployment_start == true and @so_start == false
                self[:search_field] << "\""
                self[:search_field] << s
                self[:search_field] << "\", "
            end
            if parent_table(s) == "sonobat_output" and @so_start == false
                self[:search_field] = self[:search_field] [0...-2]
                if @deployment_start == true
                    self[:search_field] << " ], "
                end
                self[:search_field] << "sonobat_output => [ "
                @so_start = true
            end
            if parent_table(s) == "sonobat_output" and @so_start == true
                self[:search_field] << "\""
                self[:search_field] << s
                self[:search_field] << "\", "
            end
        end
        self[:search_field] = self[:search_field][0...-2]
        self[:search_field] << " ]}"
    end

<<<<<<< HEAD

=======
>>>>>>> feature/flexible-searches
    def parent_table(strng)
        if Deployment.column_names().include? strng
            return "deployment"
        elsif SonobatOutput.column_names().include? strng
            return "sonobat_output"
        end
    end

    # def self.ransackable_attributes(auth_object = nil)
    #     self[:searchables]
    # end


    # def search()
    #     #assign parameters in a for each
    #     manual_idspp1 = params[:manual_idspp1]
    #     manual_idspp2 = params[:manual_idspp2]
    #     night = params[:night]
    #     if flexible_search.narrow?
    #         @sonobat_outputs = SonobatOutput.where(manual_idspp1: manual_idspp1)
    #         @sonobat_outputs = @sonobat_outputs.where(manual_idspp2: manual_idspp2)
    #         @sonobat_outputs = @sonobat_outputs.where(night: night)
    #         return @sonobat_outputs
    #     else
    #         @sonobat_outputs = SonobatOutput.where(manual_idspp1: manual_idspp1).or(SonobatOutput.where(manual_idspp2: manual_idspp2)).or(SonobatOutput.where(night: night))
    #         return @sonobat_outputs        
    #     end
    # end

end
