json.data @tasks do |task|
  json.title task.title
  json.content task.content
  json.expires_at task.expires_at
end