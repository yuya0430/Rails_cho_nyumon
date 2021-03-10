json.extract! board_comment, :id, :content, :board_user_id, :created_at, :updated_at
json.url board_comment_url(board_comment, format: :json)
