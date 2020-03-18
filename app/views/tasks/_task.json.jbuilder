json.extract! task, :id, :name, :created_at, :updated_at
json.thumbnail_url task.thumbnail.attached? ? url_for(task.thumbnail.variant(resize: '200x')) : ''
json.url task_url(task, format: :json)
