#Goal
�قڐÓI�ȃy�[�W���쐬����B  

#Wait a minute
�����ō쐬���Ă����̂͐ÓI�y�[�W�ł��B  
��ԍŏ��̊�{���̊�{�ł��ˁB  

���āA����ł̓T���v���A�v���P�[�V�����̑����𓥂ݏo���܂��傤�I  

#Index
Static pages  
|> Preparation  
|> Add route  
|> Create controller  
|> Create view & template  
|> Let's run!  
|> Add page  
|> Little dynamic
|> Before the end  

##Preparation
�쐬����ɂ��Ă��A�܂��T���v���A�v���P�[�V�����p�̃v���W�F�N�g���쐬���Ă��܂���ˁB  
�v���W�F�N�g�̍쐬���s���܂��B  

```cmd
>cd path/to/project
>mix phoenix.new sample_app
>cd sample_app
>mix ecto.create
>mix phoenix.server
>Ctrl+C
```

git���g���u�����`��؂�܂��B  

```cmd
>git checkout -b static_pages
>git branch
  master
* static_pages
```

####Description:
git init�����Ă��Ȃ����́A���������s���ĉ������B  

����ŏ����ǂ��B  

����ł́APhoenix-Framework�Ńy�[�W��ǉ����Ă݂܂��傤�I  
����������Ɋւ��ẮA���������͎g�킸�蓮�Ńt�@�C����ǉ����Ă����܂��B  

���������̗L��݂�������܂��B  
���肪����A���肪����...  

##Add route
�܂��ŏ��ɂ�邱�Ƃ́A���[�e�B���O�̒ǉ��ł��B  

####�t�@�C��: web/router.ex
���[�e�B���O�̒ǉ����s���܂��B  

```elixir
scope "/", SampleApp do
  pipe_through :browser # Use the default browser stack

  get "/", PageController, :index
  get "/home", StaticPagesController, :home
  get "/help", StaticPagesController, :help
end
```

�������ꂽ���[�e�B���O�����Ă݂܂��傤�B  

```cmd
>mix phoenix.routes
...
static_pages_path  GET     /home                SampleApp.StaticPagesController :home
static_pages_path  GET     /help                SampleApp.StaticPagesController :help
```

���[�e�B���O�̋L�q���@�ɂ��āA  
�ȉ��̋L�q���ɏ����������܂��B  

```elixir
get "/home", StaticPagesController, :home
```

�ȉ��̂悤�ɂȂ��Ă��܂��B  

- get �E�E�E HTTP���\�b�h
- "/home" �E�E�E �p�X
- StaticPagesController �E�E�E �R���g���[��
- :home �E�E�E Action

�ł́A�f���A�v���P�[�V�����Œǉ����Ă����ȉ��̂悤�ȃ��[�e�B���O�́H  

```elixir
resources "/users", UserController
```

HTTP���\�b�h���ł͂Ȃ��Aresources�B  
�܂��A�A�N�V�����ɓ����镔�����L�q����Ă��܂���ˁB  

�����RESTful�ȃ��[�e�B���O�𐶐����Ă����L�q�ł��B  

��L�̋L�q�Ő������ꂽ���[�e�B���O���o���Ă��܂����H  
���̈�s���ȉ��̂悤�ȃ��[�e�B���O�ɂȂ�܂��B  

```cmd
>mix phoenix.routes
...
user_path  GET     /users           DemoApp.UserController.index/2
user_path  GET     /users/:id/edit  DemoApp.UserController.edit/2
user_path  GET     /users/new       DemoApp.UserController.new/2
user_path  GET     /users/:id       DemoApp.UserController.show/2
user_path  POST    /users           DemoApp.UserController.create/2
user_path  PATCH   /users/:id       DemoApp.UserController.update/2
           PUT     /users/:id       DemoApp.UserController.update/2
user_path  DELETE  /users/:id       DemoApp.UserController.delete/2
```

�܂�A������苭���ɕ\���ƁE�E�E  

- resources �E�E�E HTTP���\�b�h
- "users" �E�E�E �p�X
- UserController �E�E�E �R���g���[��
- �A�N�V�������� �E�E�E RESTful�̃A�N�V�����S��

�ƌ������悤�ɂȂ�܂��B  

����̒i�K�ł́Aresources���g���Έ�C�Ƀ��[�e�B���O������Ă����ƌ����F���Ō��\�ł��B  
���v�ł��B�`���[�g���A�����I���鍠�ɂ́A�D���ȃ��[�e�B���O������悤�ɂȂ��Ă��邱�Ƃł��傤�B  

##Create Controller
�R���g���[���̍쐬���s���Ă����܂��B  

####�t�@�C��: web/controllers/static_pages_controller.ex

```elixir
defmodule SampleApp.StaticPagesController do
  use SampleApp.Web, :controller

  def home(conn, _params) do
    render conn, "home.html"
  end

  def help(conn, _params) do
    render conn, "help.html"
  end
end
```

##Create view & template
�r���[�ƃe���v���[�g�̍쐬���s���Ă����܂��B  

####�t�@�C��: web/views/static_pages_view.ex

```elixir
defmodule SampleApp.StaticPagesView do
  use SampleApp.Web, :view
end
```

####�f�B���N�g��: web/templates/static_pages
static_pages�ƌ������̂Ńf�B���N�g�����쐬���ĉ������B  

�ԈႦ�Ȃ��悤�ɒ��ӂ��ĉ������B  
�e���v���[�g�̃f�B���N�g�����̓R���g���[���̐擪���ƍ��킹��K�v������܂��B  

Phoenix-Framework�ł́A�f�t�H���g��EEx�e���v���[�g���g���܂��B  
Ruby on Rails�ɂ�����erb�̂悤�Ȃ��̂Ǝv���Ă����Α��v�ł��B  

���ۂɔ��Ɏ��Ă��܂��B  

####�t�@�C��: web/templates/static_pages/home.html.eex

```html
<div class="jumbotron">
  <h2>Welcome to Static Pages Home!</h2>
</div>
```

####�t�@�C��: web/templates/static_pages/help.html.eex

```html
<div class="jumbotron">
  <h2>Welcome to Static Pages Help!</h2>
</div>
```

##Let's run!
�T�[�o���N�����č쐬�����y�[�W�����Ă݂܂��傤�B  

```cmd
>mix phoenix.server
```

�ȉ��̃A�h���X�փA�N�Z�X���ĉ������B  

####�A�N�Z�X: http://localhost:4000/home
####�A�N�Z�X: http://localhost:4000/help

�蓮�Ńt�@�C����f�B���N�g���̒ǉ������Ă����̂́A���X�ʓ|�ł���ˁB  
�������A���ꂪ��{�̎菇�ɂȂ�܂��B����A�o���Ă����ĉ������B  

�����āA�V�����y�[�W��ǉ�����菇������Ă����܂��傤�B  

##Add about page
About�y�[�W��ǉ����܂��B  

####�t�@�C��: web/router.ex
���[�e�B���O��ǉ����܂��B  

```elixir
scope "/", SampleApp do
  pipe_through :browser # Use the default browser stack

  ...
  get "/about", StaticPagesController, :about
end
```

####�t�@�C��: web/controllers/static_pages_controller.ex
�A�N�V�����p�̊֐���ǉ����܂��B  

```elixir
def about(conn, _params) do
  render conn, "about.html"
end
```

####�t�@�C��: web/templates/static_pages/about.html.eex

```html
<div class="jumbotron">
  <h2>Welcome to Static Pages About!</h2>
</div>
```

�T�[�o���N�����č쐬�����y�[�W�����Ă݂܂��傤�B  

```cmd
>mix phoenix.server
```

�ȉ��̃A�h���X�փA�N�Z�X���ĉ������B  

####�A�N�Z�X: http://localhost:4000/about

##Little dynamic
�����������I�ɓ����悤�ɂ��Ă݂܂��傤�B  

�ȉ��̕������A����ꌾ�����������ł��B  

```html
<h2>Welcome to Static Pages Home!</h2>
<h2>Welcome to Static Pages Help!</h2>
<h2>Welcome to Static Pages About!</h2>
```

���̈قȂ镔���𓮓I�Ɏw�肵�Ă݂܂��傤�B  

####�t�@�C��: web/controllers/static_pages_controller.ex
�ȉ��̂悤�ɃA�N�V�����p�̊֐���ύX���ĉ������B  

```elixir
def home(conn, _params) do
  render conn, "home.html", message: "Home"
end
```

```elixir
def help(conn, _params) do
  render conn, "help.html", message: "Help"
end
```

```elixir
def about(conn, _params) do
  render conn, "about.html", message: "About"
end
```

����́A�����_�����O����e���v���[�g�֒l�𑗂��Ă��܂��B  

- message �E�E�E �e���v���[�g�ł̖���
- "About" �E�E�E �l

���́A���̒l���e���v���[�g�Ŏg���悤�ɕύX���܂��B  

####�t�@�C��: web/templates/static_pages/home.html.eex

```html
<div class="jumbotron">
  <h2>Welcome to Static Pages <%= @message %>!</h2>
</div>
```

####�t�@�C��: web/templates/static_pages/help.html.eex

```html
<div class="jumbotron">
  <h2>Welcome to Static Pages <%= @message %>!</h2>
</div>
```

####�t�@�C��: web/templates/static_pages/about.html.eex

```html
<div class="jumbotron">
  <h2>Welcome to Static Pages <%= @message %>!</h2>
</div>
```

�ȉ��̂悤�ɋL�q����ƁA�R���g���[�������瑗�����l���Q�Ƃł��܂��B  

```html
<%= @~ %>
```

����͂����܂łƂȂ�܂��B  
����ŁA�y�[�W��ǉ����Ă������@�͕�����܂����ˁB  

##Before the end
�\�[�X�R�[�h���}�[�W���܂��B  

```cmd
>git add .
>git commit -am "Finish static_pages."
>git checkout master
>git merge static_pages
```

#Bibliography
[Ruby on Rails Tutorial](http://railstutorial.jp/chapters/static-pages?version=4.0#top)  