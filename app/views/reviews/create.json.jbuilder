if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {artist: @artist, review: Review.new})
  json.inserted_item render(partial: "artists/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {artist: @artist, review: @review})
end
