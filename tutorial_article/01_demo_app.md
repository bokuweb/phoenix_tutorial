#Goal
�f���A�v�����쐬����B

#Dev-Environment
OS: Windows8.1
Erlang: Eshell V6.4, OTP-Version 17.5
Elixir: v1.0.4
Phoenix Framework: v0.13.1
PostgreSQL: postgres (PostgreSQL) 9.4.4
Safetybox: v0.1.2
Scrivener: v0.11.0

#Wait a minute
�ŏ��̎��n�߂Ƃ��āA�f���A�v���̍쐬���s���܂��B

�쐬����f���A�v���́A
���[�U��(�Z��)�}�C�N���|�X�g�݂̂��T�|�[�g����}�C�N���u���O�ł��B

�قƂ�ǂ����������R�}���h�ōs���܂��̂ŁA
Phoenix-Framework��̌����Ă݂���x�̐S�\���Ō��\�ł��B

���v�ł��B
�ڂ������Ƃ́A��̏͂Ő������Ă����܂��B

Phoenix-Framework���g���Ă݂邱�ƂɏW�����܂��傤�I�I

#Index
Let's play a phoenix!
|> Preparation
|> Data model
|> Create users resource
|> Create microposts resource
|> Associate with has_many

##Preparation
�����A�s�����ƗV�ڂ��Ǝv���܂����E�E�E�������������܂��B

Phoenix�𓮂����O�Ƀv���W�F�N�g���K�v�ł��ˁB
�v���W�F�N�g�̍쐬���s���܂��B

Phoenix-Framework�̃C���X�g�[����
�V�K�Ƀv���W�F�N�g���쐬���邽�߂̃R�}���h������mix�ɂ���܂��B

�ȉ��̃R�}���h�ō쐬���邱�Ƃ��ł��܂��B

```cmd
>mix phoenix.new project_name
```

�ł́A���ۂɍ쐬���Ă݂܂��傤�B

```cmd
>cd path/to/workspace
>mix phoenix.new demo_app
```

�f�B���N�g�����m�F����ƁA
demo_app���쐬����Ă��܂��ˁB

���́A�T�[�o���N�����Ă݂܂��傤�B

```cmd
>cd demo_app
>mix phoenix.server
```

####Description:
Ctrl+C�ŃT�[�o���I���ł��܂��B

####Caution:
�ŐV�o�[�W����(v0.17.0)�ł́A�ȉ��̂悤�Ȍ`�ɂȂ�܂��B

```cmd
>cd demo_app
>mix ecto.create
>mix phoenix.server
```

�ȉ��̃A�h���X�փA�N�Z�X���ĉ������B

####�A�h���X: http://localhost:4000
Phoenix�̃y�[�W���\������܂����ˁB

�悤�����IPhoenix-Framework�ցI�I

##Data model
�����v���O�������������ł��ˁI
�������A�v���O�����Ɏ��|����O�ɂ�邱�Ƃ�����܂��B

�f�[�^���f���̔c���ł��B

�]��y�������e�ł͂Ȃ��ł����A���Ԃ͊|���܂���B
����쐬����f�[�^���f���ɂ��Ĕc�����܂��傤�B

- ���[�U�̃f�[�^���f��
  * ���f����: User
  * �e�[�u����: users
  * �����J����(�J������:�^): name:string, email:string
  * ���������J����(�J������:�^): id:integer, inserted_at:timestamp, updated_at:timestamp

���̃��[�U���f����Web�C���^�[�t�F�[�X(�f�[�^���f����Web�Ŏ�舵����悤�ɂ�������)��
���킹�����̂����[�U���\�[�X�ƌĂт܂��B

����́A������f�[�^���f�������݂��܂��B

- �}�C�N���|�X�g�̃f�[�^���f��
  * ���f����: Micropost
  * �e�[�u����: microposts
  * �����J����(�J������:�^): content:string, user_id:integer
  * ���������J����(�J������:�^): id:integer, inserted_at:timestamp, updated_at:timestamp

���āA��������(���������J����)������܂��ˁB
����́A�������������J�����ɂȂ�܂��B

�ڂ������Ƃ́A�ʂ̏͂ɂĐ�������@�����܂��B
����܂ŁA���҂�c��܂��đ҂��Ă��ĉ������B

##Create users resource
���悢��A�R�[�h���쐬���Ă����܂��I

Phoenix-Framework�ɂ́A����R�}���h(�J�X�^���^�X�N)������܂��B
�m�F���Ă݂܂��傤�B

�v���W�F�N�g�̃f�B���N�g���ňȉ��̂悤�Ɏ��s���ĉ������B

```cmd
>mix help | grep phoenix
mix phoenix.digest      # Digests and compress static files
mix phoenix.gen.channel # Generates a Phoenix channel
mix phoenix.gen.html    # Generates controller, model and views for an HTML-based resource
mix phoenix.gen.json    # Generates a controller and model for an JSON-based resource
mix phoenix.gen.model   # Generates an Ecto model
mix phoenix.new         # Create a new Phoenix v0.17.0 application
mix phoenix.routes      # Prints all routes
mix phoenix.server      # Starts applications and their servers
```

####Caution:
phoenix.new�̃o�[�W�����ɍ��ق�����܂����������ĉ������I�I

�ڂ��������́APhoenix-Framework���g���Ă����ߒ��Ő�������Ƃ��āA
���͂Ƃ�����g���Ă݂܂��傤�B

����g���̂́A�ȉ��̃R�}���h�ł��B

```cmd
mix phoenix.gen.html    # Generates controller, model and views for an HTML-based resource
```

���̃R�}���h�́A
�R���g���[���A���f���A�r���[�A�e���v���[�g����C�ɐ������Ă������ɕ֗��ȃR�}���h�ł��B

�܂��́A���[�U����쐬���Ă����܂��B
�v���W�F�N�g�̃f�B���N�g���ňȉ��̂悤�Ɏ��s���ĉ������B

```cmd
>mix phoenix.gen.html User users name:string email:string
* creating priv/repo/migrations/20150620043753_create_user.exs
* creating web/models/user.ex
* creating test/models/user_test.exs
* creating web/controllers/user_controller.ex
* creating web/templates/user/edit.html.eex
* creating web/templates/user/form.html.eex
* creating web/templates/user/index.html.eex
* creating web/templates/user/new.html.eex
* creating web/templates/user/show.html.eex
* creating web/views/user_view.ex
* creating test/controllers/user_controller_test.exs

Add the resource to the proper scope in web/router.ex:

    resources "/users", UserController

and then update your repository by running migrations:

    $ mix ecto.migrate

```

�F�X�Ɛ�������܂����ˁB

����������ɂ�邱�Ƃ�����܂��B
���[�e�B���O�̒ǉ��ƃ}�C�O���[�V�����̎��s�ł��B

�܂��̓��[�e�B���O�̒ǉ�������{���܂��B

####�t�@�C��: web/router.ex
�R�����g��Additional lines�Ə����Ă���s��ǉ����ĉ������B

```elixir
scope "/", DemoApp do
  pipe_through :browser # Use the default browser stack

  get "/", PageController, :index
  resources "/users", UserController # Additional lines
end
```

���[�e�B���O���ǉ����ꂽ���m�F���Ă݂܂��傤�B

```cmd
>mix phoenix.routes
page_path  GET     /                DemoApp.PageController.index/2
user_path  GET     /users           DemoApp.UserController.index/2
user_path  GET     /users/:id/edit  DemoApp.UserController.edit/2
user_path  GET     /users/new       DemoApp.UserController.new/2
user_path  GET     /users/:id       DemoApp.UserController.show/2
user_path  POST    /users           DemoApp.UserController.create/2
user_path  PATCH   /users/:id       DemoApp.UserController.update/2
           PUT     /users/:id       DemoApp.UserController.update/2
user_path  DELETE  /users/:id       DemoApp.UserController.delete/2
```

####Description:
resources���g���ă��[�e�B���O���쐬����ƁA
RESTful�ȃ��[�e�B���O���쐬���Ă���܂��B

���́A�}�C�O���[�V���������s���܂��B
�}�C�O���[�V�����Ɏg���R�}���h�́A�܂��ʂ̂��̂ɂȂ�܂��B
Phoenix-Framework�ł�Ecto�ƌĂ΂�郉�C�u�������g���Ă��܂��B

DB�Ƃ̐ڑ����y�ɂ��Ă����f���炵�����C�u�����ł��B
(Rails�ɂ�����Active Record�̂悤�ȑ��݂ł�)

Ecto�̃R�}���h�����Ă݂܂��B

```cmd
>mix help | grep ecto
mix ecto.create         # Create the storage for the repo
mix ecto.drop           # Drop the storage for the repo
mix ecto.gen.migration  # Generate a new migration for the repo
mix ecto.gen.repo       # Generate a new repository
mix ecto.migrate        # Run migrations up on a repo
mix ecto.rollback       # Rollback migrations from a repo
```

�ȉ��̃R�}���h���g���ă}�C�O���[�V���������s���܂��B

```cmd
mix ecto.migrate        # Run migrations up on a repo
```

���ۂɂ���Ă����܂��傤�B

```cmd
>mix ecto.migrate
** (exit) exited in: GenServer.call(#PID<0.168.0>, {:query, "SELECT count(1) FROM pg_class c\n  JOIN pg_namespace n ON n.oid = c.relnamespace\n WHERE c.relkind IN ('r','v','m')\n
     AND c.relname = 'schema_migrations'\n       AND n.nspname = ANY (current_schemas(false))\n", []}, :infinity)
    ** (EXIT) %Postgrex.Error{message: nil, postgres: %{code: :invalid_catalog_name, file: "src\\backend\\utils\\init\\postinit.c", line: "794", message: <<131, 102, 129, 91, 131,
94, 131, 120, 129, 91, 131, 88, 34, 100, 101, 109, 111, 95, 97, 112, 112, 95, 100, 101, 118, 34, 130, 205, 145, 182, 141, 221, 130, 181, 130, 220, 130, 185, 130, 241>>, pg_code: "3
D000", routine: "InitPostgres", severity: "FATAL"}}
    (elixir) lib/gen_server.ex:356: GenServer.call/3
    (postgrex) lib/postgrex/connection.ex:87: Postgrex.Connection.query/4
    (ecto) lib/ecto/adapters/postgres/connection.ex:37: Ecto.Adapters.Postgres.Connection.query/4
    (stdlib) timer.erl:194: :timer.tc/3
    (ecto) lib/ecto/adapters/sql.ex:191: anonymous fn/6 in Ecto.Adapters.SQL.pool_query!/5
    (ecto) lib/ecto/adapters/sql.ex:615: Ecto.Adapters.SQL.pool_transaction/4
    (ecto) lib/ecto/adapters/sql.ex:189: Ecto.Adapters.SQL.pool_query!/5
    (ecto) lib/ecto/adapters/postgres.ex:59: Ecto.Adapters.Postgres.ddl_exists?/3
```

�킟���I�����G���[���o�Ă��܂��܂����ˁB

�}�C�O���[�V��������ɂ́A���̃}�C�O���[�V�����悪�Ȃ��Ƃ����܂���ˁB
�܂��A����Ă��܂���ł����B(���h�A���h///)

�쐬����ɂ͈ȉ��̃R�}���h���g���܂��B

```cmd
>mix ecto.create
The database for DemoApp.Repo has been created.
```

####Caution:
�ŐV�o�[�W����(v0.17.0)���g���Ă�����́A
�ŏ��ɍ쐬���Ă���̂ŏ�L�̑���͕s�v�ł��B

�ēx�A�}�C�O���[�V���������s���܂��B

```cmd
>mix ecto.migrate
[info] == Running DemoApp.Repo.Migrations.CreateUser.change/0 forward
[info] create table users
[info] == Migrated in 0.2s
```

���x�͖����}�C�O���[�V�����ł��܂����B

�����܂ŁA���{�ł������x�T�[�o���N�����Ċm�F���Ă݂܂��傤�B

�܂��A�����v���O�������Ă��Ȃ��H
���v�ł��I��قǂ̑���Ŋ��Ƀ��[�U�̉�ʂ��o���オ���Ă��܂��I�I

```cmd
>mix phoenix.server
```

�ȉ��̃A�h���X�ɃA�N�Z�X���ĉ������B

####�A�h���X: http://localhost:4000/users

���[�U�̈ꗗ�y�[�W���\������܂����ˁB

���̎��_�ŁA���[�U�̍쐬 / �\�� / �X�V / �폜����������Ă��܂��B
�C�ɂȂ���́A��ʂ��瑀�삵�Ă݂ĉ������B

�e��ʂɂ�����AURL�̗�͈ȉ��̂悤�ɂȂ�܂��B

- index
��) http://localhost:4000/users
���[�U�ꗗ��\������y�[�W�B

- new
��) http://localhost:4000/users/new
�V�K�̃��[�U�o�^���s���y�[�W�B

- show
��) http://localhost:4000/users/1 
���[�U�ʂ̃v���t�@�C����\������y�[�W�B
(URL���̐��l1��id����)

- edit
��) http://localhost:4000/users/1/edit
���[�U���̍X�V���s���y�[�W�B

Description:
create�Aupdate�Adelete�̓��\�b�h���قȂ�̂Ŋ������܂��B

##Create microposts resource
�����āA�}�C�N���|�X�g���\�[�X���쐬���܂��B

���[�U���\�[�X���쐬�������Ǝ菇�́A
�قړ���Ȃ̂ŕK�v�ȕ����̂݋L�q���܂��B

�܂��́A���������R�}���h���g���Ĉ�ʂ�̂��̂𐶐����܂��B

```cmd
>mix phoenix.gen.html Micropost microposts content:string user_id:integer
* creating priv/repo/migrations/20150620055222_create_micropost.exs
* creating web/models/micropost.ex
* creating test/models/micropost_test.exs
* creating web/controllers/micropost_controller.ex
* creating web/templates/micropost/edit.html.eex
* creating web/templates/micropost/form.html.eex
* creating web/templates/micropost/index.html.eex
* creating web/templates/micropost/new.html.eex
* creating web/templates/micropost/show.html.eex
* creating web/views/micropost_view.ex
* creating test/controllers/micropost_controller_test.exs

Add the resource to the proper scope in web/router.ex:

    resources "/microposts", MicropostController

and then update your repository by running migrations:

    $ mix ecto.migrate

```

���[�e�B���O�̒ǉ������܂��B

####�t�@�C��: web/router.ex
�R�����g��Additional lines�Ə����Ă���s��ǉ����ĉ������B

```elixir
scope "/", DemoApp do
  pipe_through :browser # Use the default browser stack

  get "/", PageController, :index
  resources "/users", UserController
  resources "/microposts", MicropostController # Additional lines
end
```

���[�e�B���O���ǉ����ꂽ���m�F����B

���̃��[�e�B���O���\������܂��B
���L�̌��ʂł́A�}�C�N���|�X�g�̂ݕ\�����Ă��܂��B

```cmd
>mix phoenix.routes
...
micropost_path  GET     /microposts           DemoApp.MicropostController.index/2
micropost_path  GET     /microposts/:id/edit  DemoApp.MicropostController.edit/2
micropost_path  GET     /microposts/new       DemoApp.MicropostController.new/2
micropost_path  GET     /microposts/:id       DemoApp.MicropostController.show/2
micropost_path  POST    /microposts           DemoApp.MicropostController.create/2
micropost_path  PATCH   /microposts/:id       DemoApp.MicropostController.update/2
                PUT     /microposts/:id       DemoApp.MicropostController.update/2
micropost_path  DELETE  /microposts/:id       DemoApp.MicropostController.delete/2
```

�}�C�O���[�V���������s���܂��B

```cmd
>mix ecto.migrate
[info] == Running DemoApp.Repo.Migrations.CreateMicropost.change/0 forward
[info] create table microposts
[info] == Migrated in 0.1s
```

�T�[�o���N�����āA�}�C�N���|�X�g�̃y�[�W���m�F�ɂ����܂��B

```cmd
>mix phoenix.server
```

####�A�h���X: http://localhost:4000/microposts


�܊p������A���̓v���O���~���O�����邺�I�I
���낻��v���O�������������̂ŁA���������\�[�X�R�[�h��ǉ����܂��B

####�t�@�C��: web/models/micropost.ex
changeset/2�̊֐�������܂��ˁB
���e���ȉ��̂悤�ɕҏW���ĉ������B
(Additional lines�̕���)

```elixir
def changeset(model, params \\ :empty) do
  model
  |> cast(params, @required_fields, @optional_fields)
  |> validate_length(:content, min: 140) # Additional lines
end
```

����������̂��H
�}�C�N���|�X�g�̓��e�ɂ����āA140�����̐����������܂����B

�����Ƀ}�C�N���|�X�g�̍쐬 / �X�V�̉�ʂ���140�����ȏ����͂��Ă݂ĉ������B
��ʂɃG���[��\�����Ă����͂��ł��B

##Associate with has_many
���������\�[�X�R�[�h���������Ă݂܂��傤�I

���[�U�ƃ}�C�N���|�X�g�Ɋ֘A�t�����s���Ă݂܂��B

####�t�@�C��: web/models/user.ex
schema�̕������ȉ��̂悤�ɕҏW���ĉ������B

```elixir
schema "users" do
  field :name, :string
  field :email, :string
  has_many :microposts, DemoApp.Micropost

  timestamps
end
```

####�t�@�C��: web/models/micropost.ex
schema�̕������ȉ��̂悤�ɕҏW���ĉ������B

```elixir
schema "microposts" do
  field :content, :string
  belongs_to :user, DemoApp.User, foreign_key: :user_id

  timestamps
end
```

�֘A�t�����ł��܂����B
����ł́A����Ŋ֘A�t�����ł���ƌ����F���ő��v�ł��B

1�Α��A���Α��̊֌W���͌�̏͂ŏo�Ă��܂��B
�Ȃ̂ŏڂ��������������ł͂��܂���B

#Speaking to oneself
�����l�ł����B����͂����܂łɂȂ�܂��B

Phoenix-Framework�̎��n�߂Ƃ��Ă͂ǂ��ł����ł��傤���H

Rails���g�������Ƃ�������X�́A
�ǂ����Ō������Ƃ�����悤�ȓ��e�������Ǝv���܂��B

���߂ăt���[�����[�N�G�ꂽ���X�́A
������Ȃ������͂���ǁA���܂��������Ȃ������̂ł͂Ȃ��ł��傤���H

����쐬�����A�v���P�[�V������
�����Ɩ{�i�I�Ɏ������Ă����̂�Tutorial�̓��e�ɂȂ�܂��B

�Ō�܂ł��t������������΍K���ł��B

#Bibliography
[Ruby on Rails Tutorial](http://railstutorial.jp/chapters/a-demo-app?version=4.0#top)
[Phoenix Framework - Guides - Mix Tasks](http://www.phoenixframework.org/v0.13.1/docs/mix-tasks)
[Phoenix Framework - Guides - Ecto Models](http://www.phoenixframework.org/v0.13.1/docs/ecto-models)