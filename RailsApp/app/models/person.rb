class Person < ApplicationRecord
    #has_one :message #1:1の対応付け．1つのmessageインスタンスしか得られない
    has_many :message #1:多の対応付け．複数のmessageインスタンスを与えられる

    validates :name, presence: {message:'は，必須項目です．' }
    validates :age, numericality: {message:'は，数字で入力してください．'}
    validates :mail, email: {message:'はメールアドレスではありません．'}
end
