module DiariesHelper
  def formatted_date(date)
    l(date, format: :long)
  end
end
