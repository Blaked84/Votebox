json.extract! comment,
              :id,
              :user_id,
              :project_id,
              :text
json.published_at comment.decorate.published_at
json.author comment.author.infos_to_display
json.current_user do
  user = current_user || User.new
  json.logged_user current_user.present?
  json.can_edit can?(:edit, comment)
end
json.url comment_url(comment, format: :json)
