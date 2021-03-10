class HelloController < ApplicationController
  layout 'application'
  before_action :authenticate_account!, only: :login_check
  #ログイン必須に設定（authenticate_(モデル名)!はDeviceを組み込めば自動で追加されるメソッド）
  #モデル名に入るのは，「rails generate device モデル名」で作成したモデル
  def index
    @msg = 'this is sample page.'
  end

  def login_check
    @account = current_account
    #current_モデル名 は，ログインしている利用者のAccountインスタンスが返ってくる
    @msg = 'account created at: ' + @account.created_at.to_s
  end
end
