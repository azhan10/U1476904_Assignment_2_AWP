json.extract! film, :id, :filmtitle, :filmdescription, :created_at, :updated_at
json.url film_url(film, format: :json)