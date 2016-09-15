require_relative 'UserModule.rb'

class Buyer
  include UserModule
  def initialize(name, cc_info, money)
    @name = name
    @cc_info = cc_info
    @money = money
  end


end
