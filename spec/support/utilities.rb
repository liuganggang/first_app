def full_title(page_title)
  base_title = 'Ruby on Rails Tutorial Sample App'
  if page_title.present?
    base_title + ' | ' + page_title
  else
    base_title
  end
end