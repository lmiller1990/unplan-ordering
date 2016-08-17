module ApplicationHelper
  # parse in `created_at.strftime("%x")`
  def japanese_date_format(date)
    date = date.split('/').reverse!
    date[1], date[2] = date[2], date[1]
    s = date[0] << '/' << date[1] << '/' << date[2]
  end
end
