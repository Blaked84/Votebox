json.extract! project,
              :id,
              :name,
              :description,
              :created_at,
              :updated_at,
              :author,
              :category,
              :votes_for,
              :votes_against
json.current_user do
  user = current_user || User.new
  json.logged_user current_user.present?
  json.voted_for user.voted_for?(project)
  json.voted_against user.voted_against?(project)
  json.is_member user.projects.include?(project)
end
json.urls do
  json.vote_for project_vote_path(project, direction: "up")
  json.vote_against project_vote_path(project, direction: "down")
  json.join project_membership_path(project, membership_action: "join")
  json.leave project_membership_path(project, membership_action: "leave")
end
json.url project_url(project, format: :json)
