json.extract! chore, :id, :child_id, :complete, :created_at, :updated_at
json.url chore_url(chore, format: :json)
json.task do |task|
  task.partial! "tasks/task", task: chore.task
end
