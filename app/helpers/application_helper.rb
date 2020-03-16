# frozen_string_literal: true

module ApplicationHelper
  def format_currency(amount)
    number_to_currency(amount, locale: :de)
  end
end
