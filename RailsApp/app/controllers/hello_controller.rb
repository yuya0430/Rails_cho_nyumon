class HelloController < ApplicationController
    #protect_from_forgery
    layout 'hello'

    def index
        #render plain:"Hello, This is Rails sample page!"

        """if params['msg'] != nil then
            msg = 'Hello, ' + params['msg'] + '!'
        else
            msg = 'this is sample page.'
        end

        html = '
        <html>
        <body>
            <h1>Sample Page</h1>
            <p> ' + msg + '   </p>
        </body>
        </html>
        '
        render html: html.html_safe"""

        #@title = "View Sample"
        #@msg = "コントローラーに用意した値です．"

        """if params['msg'] != nil then
            @title = params['msg']
        else
            @title = 'index'
        end
        @msg = 'this is redirect sample...'"""


        """if request.post? then
            @title = 'Result'
            if params['s1'] then
                @msg = 'you selected: '
                for val in params['s1']
                    @msg += val + ' '
                end
            else
                @msg = 'not selected...'
            end
        else
            @title = 'Index'
            @msg = 'select radio button...'
        end"""

        @header = 'layout sample'
        @footer = 'copyright SYODA-Tuyano 2020.'
        @title = 'New Layout'
        @msg = 'this is sample page!'

    end

    def other
        redirect_to action: :index, params: {'msg': 'from other page'}
    end
end
