module Luminate
  class Constituent < Base
    def_endpoints('SRConsAPI','getUser','isEmailValid','getUserTransactions')
  end
end
