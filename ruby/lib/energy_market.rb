require 'json'

class EnergyMarket
  def initialize(plans = Plan.new)
    @plans = plans
  end

# Returns cost for the variable plan
  def variable_plan(con)
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

# Returns cost for the standard plan
  def standard_plan(con)
    if con <= 300
      price = con * 12.5
      vat = price * 0.05
      full_price = price + vat
      p vat_price = full_price / 100
    elsif con > 300
      s = 12.5 * 300
      con = con - 300
      full_price = s + (con * 11)
      vat = full_price * 0.05
      vat_price = (full_price + vat)/100
    end
  end

# Returns cost for the fixed plan
  def fixed_plan(con)
      if con >= 250
        price = 250 * 14.5
        con = con - 250
          if con >= 200
            price = price + 200 * 10.1
            con = con - 200
              if con > 0
                price = price + con * 9
                vat  = price * 0.05
                vat_price = (price + vat) / 100
              end
          end
      end
  end

  def standing_charge(con)
    price = con * 9 + 7 * 365
    vat = price * 0.05
    vat_price = (price + vat) / 100
  end

  # Displays the array of plans it recieves in desending ordern of price
  # def display_table(array)
  #   array.sort_by {|x| x[:price]}.reverse
  # end

  # Returns an array of plans available in the market for a given consumption.
  #
  # [{"supplier"=>"edf", "plan name"=>"fixed", "price"=>"205.75"},
  #  {"supplier"=>"eon", "plan name"=>"variable", "price"=>"213.68"},
  #  {"supplier"=>"bg", "plan name"=>"standing-charge", "price"=>"215.83"},
  #  {"supplier"=>"ovo", "plan name"=>"standard", "price"=>"235.73"}]
  def price(consumption)
    variable_plan(consumption)
    standard_plan(consumption)
    fixed_plan(consumption)
    standing_charge(consumption)
    @plans
  end

  def usage(supplier_name, plan_name, monthly_spend)
    10
  end
end
