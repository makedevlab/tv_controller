json.extract! child, :id, :name, :created_at, :updated_at
json.url child_url(child, format: :json)
json.photo_url child.photo.attached? ? url_for(child.photo.variant(resize: '200x')) : ''
json.chores do |chores|
  chores.array! child.chores.ordered, partial: "chores/chore", as: :chore
end