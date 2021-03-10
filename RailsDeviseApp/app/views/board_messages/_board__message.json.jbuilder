json.extract! board__message, :id, :content, :board_user_id, :created_at, :updated_at
json.url board__message_url(board__message, format: :json)
