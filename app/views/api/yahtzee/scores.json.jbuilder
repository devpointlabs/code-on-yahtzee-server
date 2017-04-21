json.scores @scores do |score|
  user = User.find(score.user_id)
  json.email user.email
  json.nickname user.nickname
  json.score score.value
  json.created_at score.created_at
end