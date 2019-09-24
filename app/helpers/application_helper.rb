module ApplicationHelper
  def number_to_currency(number, options = {})
    options[:locale] ||= I18n.locale
    super(number, options)
  end
end
