module Luminate
  class Constituent < Base
    def_endpoints('SRConsAPI','getUser','isEmailValid','getUserTransactions', 'create', 'listUserFields')
  end
end
