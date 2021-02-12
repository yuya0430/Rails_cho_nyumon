class EmailValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        #record:バリデーションが実行されるモデルのインスタンス
        #attribute:バリデーションが設定されているモデルの項目
        #value: チェックする値
        #unless: falseなら実行
        unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            record.errors[attribute] << (options[:message] || "is not an email")
            #recordのerrosに追加
            #options[:message]:エラーメッセージが用意されていたらそれを表示
            #|| "is ~":エラーメッセージがなければこちらを表示
        end
    end

end