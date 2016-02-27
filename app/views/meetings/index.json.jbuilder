json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :title
  json.url meeting_url(meeting, format: :json)
end
