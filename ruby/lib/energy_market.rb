require 'json'

class EnergyMarket
  def initialize(plans)
    @plans = plans
  end

# Returns cost for the variable plan
  def variable(con)
  	if con <= 100
      price = con * 13.5
      vat = price * 0.05
      full_price = price + vat
      p vat_price = full_price / 100
  	elsif con > 100
      s = 13.5 * 100
      con = con - 100
      full_price = s + (con * 10)
      vat = full_price * 0.05
      vat_price = (full_price + vat)/100
    end
  end



  # Returns an array of plans available in the market for a given consumption.
  #
  # [{"supplier"=>"edf", "plan name"=>"fixed", "price"=>"205.75"},
  #  {"supplier"=>"eon", "plan name"=>"variable", "price"=>"213.68"},
  #  {"supplier"=>"bg", "plan name"=>"standing-charge", "price"=>"215.83"},
  #  {"supplier"=>"ovo", "plan name"=>"standard", "price"=>"235.73"}]
  def price(consumption)
  end

  def usage(supplier_name, plan_name, monthly_spend)
    10
  end
end
