json.extract! project,
              :id,
              :name,
              :created_at,
              :updated_at,
              :author_name,
              :category,
              :votes_for,
              :votes_against,
              :members_count,
              :comments_count
json.members_infos project.users.map(&:infos_to_display)
json.description sanitize( project.description)
json.voters_for project.voters(true)
json.voters_against project.voters(false)
json.current_user do
  user = current_user || User.new
  json.logged_user current_user.present?
  json.voted_for user.voted_for?(project)
  json.voted_against user.voted_against?(project)
  json.is_member user.projects.include?(project)
  json.can_edit can?(:edit, project)
end
json.urls do
  json.vote_for project_vote_path(project, direction: "up")
  json.vote_against project_vote_path(project, direction: "down")
  json.join project_membership_path(project, membership_action: "join")
  json.leave project_membership_path(project, membership_action: "leave")
  json.edit edit_project_path(project)
  json.show project_path(project)
end
json.url project_url(project, format: :json)
