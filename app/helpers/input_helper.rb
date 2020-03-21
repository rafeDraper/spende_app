module InputHelper
  def strip_inputmask(amount)
    amount.is_a?(String) ? amount.gsub(/#{Money.default_currency.symbol}|,/, '').strip.to_i : amount
  end
end
