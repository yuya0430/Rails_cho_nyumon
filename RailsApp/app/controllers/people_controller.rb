class PeopleController < ApplicationController
  layout 'people'

  def index
    @msg = 'Person data.'
    @data = Person.all
  end

  def show
    @msg = "Indexed data."
    @data = Person.find(params[:id])
  end

  def add
    @msg = "add new data."
    @person = Person.new
  end

  def create
    #---コントローラー側でエラーメッセージを出す方法（非効率）---#
    #@person = Person.new person_params
    #if @person.save then
    #  redirect_to '/people'
    #else
    #  re = ''
    #  @person.errors.messages.each do |key, vals|
    #    vals.each do |val|
    #      re += '<span style="color:red">' + key.to_s + '</span> ' + val + '<br>'
    #    end
    #  end
    #  @msg = re.html_safe
    #  render 'add'
    #end
    @person = Person.new person_params
    if @person.save then
      redirect_to '/people'
    else
      render 'add'
    end
  end

  def edit
    @msg = "edit data.[id = " + params[:id] + "]"
    @person = Person.find(params[:id])
  end

  def update
    obj = Person.find(params[:id])
    obj.update(person_params)
    redirect_to '/people'
  end

  def delete
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to '/people'
  end

  def find
    @msg = 'please type search word...'
    @people = Array.new
    if request.post? then
      #obj = Person.find params['find']
      #@people.push obj
      #@people = Person.where name: params[:find] #完全一致しか無理
      
      #@people = Person.where "age >= ?", params[:find] #比較演算子による検索
      
      #@people = Person.where "mail like ?", '%' + params[:find] + '%' #あいまい検索(like)
      #%は不特定多数の文字を表す．前に%が付けば入力文字で終わるもの，後に%が付けば入力文字から始まるものを検索する

      #複数条件での検索#
      #f = params[:find].split ','
      #@people = Person.where "age >= ? and age <= ?", f[0], f[1]

      #f = '%' + params[:find] + '%'
      #@people = Person.where "name like ? or mail like ?", f, f

      #最初のデータと最後のデータを取り出す#
      #f = '%' + params[:find] + '%'
      #result = Person.where "name like ? or mail like ?", f, f
      #@people.push result.first
      #@people.push result.last

      #findでの複数検索#
      #f = params[:find].split(',')
      #@people = Person.find(f) #配列を渡せばOK，数字以外はNG

      #ソート#
      #f = '%' + params[:find] + '%'
      #@people = Person.where("name like ?", '%' + params[:find] + '%').order 'age asc' #asc:昇順, desc:降順

      #結果の一部を取り出す#
      f = params[:find].split(',')
      @people = Person.all.limit(f[0]).offset(f[1])
    else
      @people = Person.all

    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :age, :mail)
    #require(:person):paramsの中にpersonがあるかを確認
    #.permit(:name, :age, :mail):personの中にこの3つがあるか確認
    #これらを確認しることでパーミッションを得たparamsを渡すことができるので，保存可能に
  end
end
