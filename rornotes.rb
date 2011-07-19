#========================================================== user from 20110714 to 20110914
#[users] &&
id
email                 varchar(50)
name                  nvarchar(50)     
password              varchar(50)
encrypted_password    varchar(50)
salt                  varchar(50)
active_code           varchar(50)          #active accout by email, 1=actived
male                  boolean 
description           nvarchar(500)
reader_score          integer       comment+10,post+1
maxfavorite           integer       default=10 ,消耗积分,增加额度
maxbook               integer       最多可以創建的book數量,默認10,向admin申请增加
admin                 boolean    administrators,
maintainer            boolean    可添加非原著书,不受maxbook限制
author                boolean 
author_name           nvarchar(50)

#[relationships] &&
id
follower_id           integer
followed_id           integer



#[microposts] &&   小谈
id
book_id               integer
comment_id            integer     (could be removed by comment  owner) 
forked_id             integer     forked from others micropost id
user_id               integer  
content               nvarchar(366)


#[favorites] 
id
book_id               integer    
chapter_id            integer         章節ID (第一次收藏,記錄第一節. 閱讀時,記錄當前章節)
user_id               integer
score                 integer         coment+10 ,micropost+1 , chapterclick+1  ,clear after removed from favorite
last_read_at          datetime  



#==========================================================book
#[categories]
id
parent_id             integer
title                 nvarchar(50)
description           nvarchar(500)
show_on_header        boolean
sequence              int

#[books]
id
category_id           int
user_id               int
title                 nvarchar(50)
description           nvarchar(500)
keywords              nvarchar(50)
cover_picture_url     varchar(100)
author                boolean 只有maintainer可以单独设定,其他自动关联users.author_name
status                tinyint 0-ongoing 1-end 2-pending
all_click             int
month_click           int
week_click            int
day_click             int
last_click_at         datetime  

#[sections]   分卷
id                    int
book_id               int
title                 nvarchar(50)
description           nvarchar(500)
sequence              int

#[chapters]  
id  
section_id            int 
sequence              int        
title                 nvarchar (50) 
content               ntext   
public                boolean         是否公开


#[comments] only for books in favorites  书评
id
book_id               integer 
user_id               integer  
title                 nvarchar(50)
content               nvarchar(4000)
all_click             integer
status                integer         1，book固顶，4，锁定 (by author)
submit_to_homepage    boolean

#========================================================== site 
#[lookups]
id
code                  varchar(50)
category              varchar(50)
description           nvarchar(500)

SiteName                  站點名稱
SiteKeyWord               關鍵字
SiteContact               聯繫方式
SiteAbout                 站點說明,放在底部
SiteBak                   網站備案信息
bodystyle                 主站默認風格
bookstyle                 讀書頁面默認風格

#==========================================================plan
1.淡化阅读,强化读者交互
2.只可以对添加到收藏的书发表评论.评论可以被跟帖post,post可以被移除出此评论,
3.microposts可以被fork,可以作为comment的跟帖, 也可以作为对book的单独microposts但不列在book页面(只显示数量,可在单独页面查看),只显示给follower
4.user可以互相follow,个人页面可以看到followed user的microposts,comment, favorite book的最后更新







#============================operation============================
# 创建一个表及相关的mvc
$ rails generate model User name:string email:string    #User , not Users ,created a migrate in /db/migrate/, edit if needs.
$ rake db:migrate 
$ rails generate controller Users show                  #Users ,not User




 

#============================rails:============================
$ rails new sample_app -T						#without testing code
$ rails server									#rails s
$ rails server --environment production
$ rails console									# rails c  ,quit,ctrl+c,ctrl+d
$ rails console --sandbox				#no changes
$ rails console test

$ tail -f log/development.log					#show database log


# ============================gem:   ============================
$ set HTTP_PROXY=http://172.30.4.63:3128   #set proxy=http://172.30.4.63:3128 
$ gem install rails               # -p --http-proxy http://172.30.4.63:3128


# ============================rake:   ruby make============================
$ rake db:create
$ rake db:test:prepare
$ rake db:reset									#clear database
$ rake db:populate              # lib/tasks/sample_data.rake task :populate =>:environment 
$ rake db:rollback                #回滚到最近的一次migration执行的状态  
$ rake db:rollback STEP=3         #回滚最近的3次的迁移任务
$ rake db:migrate:redo            #重做迁移


# ============================git:============================
$ git config --global user.name "name"
$ git config --global user.email "mail"
$ git config --global http.proxy http://172.30.4.63:3128
$ git config --global alias.co checkout
$ git config --global co.editor "vim -f"
$ git config --global core.autocrlf false
$ git config --global github.user username		#connected with https 
$ git config --global github.token tokencode	#https security code
$ git init										#init repository for a new folder
$ git checkout -b modify-readme					#new branch
$ git status
$ git branch
$ git branch -d some-branch  / git branch -D modify-readme  #delte branch,-d needs merged all changes ,-D not care about changes.
$ git merge modify-readme		  
$ git add .                                     #add all include new file
$ git commit -m "message"                       #commit modified one file 
$ git commit -a                                 #commit all changes ,not include new files 
$ git commit -am "message"						          #short write
$ git mv README README.markdown                 #rename file
$ git log
$ git rm public/index.html						#tell git that a file should be removed
$ git add . / git commit -am "massage" / git checkout master / git merge other-branch / git push # merge a branch
$ git checkout master / git checkout -b new-branch      #make a new branch, and leave on new-branch


# ============================github:============================
$ git remote add origin git@github.com:brookzhang/first_app.git
$ git push origin master
$ git push origin master:master
$ git push
$ git clone https://brookzhang@github.com/brookzhang/first_app.git
$ git pull
$ git fetch
$ git push heroku master
$ git remote rm heroku
$ git remote add heroku git@heroku.com:brook.git


# ============================rspec:============================
$ rails generate rspec:install
$ rails generate integration_test layout_links
$ rspec spec/
$ bundle exec rspec spec/
$ time rspec spec/
$ rspec spec/models/user_spec.rb -e "should have an encrypted password attribute"





# ============================heroku:============================
$ sudo gem install heroku
$ heroku keys:add               #follow steps ,add ssh public key
$ heroku create
$ heroku rake db:migrate
$ [sudo] gem install taps
$ heroku db:push								#push data to heroku
$ heroku console                #same as rails console on heroku


# ============================vim:============================
$ :w                                            #write = save
$ :q                                            #quit
$ d                                             #delete



# ============================ubuntu:============================
$ cd                                            #change directory
$ ls                                            #list
$ mv                                            #move
$ cp                                            #copy
$ rm                                            #remove file or directory
$ rm rf											                    #remove recursive force
$ rm -rf spec/views
$ ps -e | grep apt                              #show apt* process
$ sudo killall apt                              #kill process
$ sudo killall apt-get
 
 
 
 
 
 
 
 