class Blogpost < ApplicationRecord
    belongs_to :bloggenre
    has_rich_text :content #contetにAction Textを設定
    
    validates :title, :content, presence: {message:'は，必須項目です．'}
end
