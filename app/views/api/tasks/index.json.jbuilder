json.set! :status, 200
json.data do |json|
  json.tasks @tasks do |task|
    json.title task.title
    json.content task.content
    json.expires_at task.expires_at
  end
end
