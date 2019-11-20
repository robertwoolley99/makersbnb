require_relative '../model/landlord'
require "data_mapper"
require "dm-postgres-adapter"

describe Landlord do 
        it { should have_property       :first_name   }
        it { should have_property       :last_name   }
        it { should have_property       :email_address}
        it { should have_property       :user_name  }
        it { should have_property       :password   }
        
end 

