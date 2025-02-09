json.array!(@books) do |book|
  json.extract! book, :id, :title, :description, :author, :isbn, :is_borrowed, :is_deleted, :owner, :location
  json.url book_url(book, format: :json)
end
