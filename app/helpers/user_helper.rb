# frozen_string_literal: true

module UserHelper
  def formatted_date(datetime)
    datetime.strftime("%d %b %Y at %I:%M %p")
  end

  def truncated_content(content, length: 50)
    truncate(content, length:)
  end
end
