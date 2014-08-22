module Luminate
  class Donation < Base
    def_endpoints('SRDonationAPI','addOfflineDonation')
  end
end
