require_relative '../model/listings'
require "data_mapper"
require "dm-postgres-adapter"


describe Listings do 
    it { should have_property       :location   }
    it { should have_property       :price   }
    it { should have_property       :dates_available}
    it { should have_property       :owner_name  }
    it { should have_property       :contact_details }
    it { should have_property       :description  }
    
end 