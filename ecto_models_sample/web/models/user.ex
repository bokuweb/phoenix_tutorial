defmodule EctoModelsSample.User do
  use EctoModelsSample.Web, :model
  use Ecto.Model.Callbacks

  before_insert :set_password_digest

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_digest, :string
    field :password, :string, virtual: true

    has_many :microposts, EctoModelsSample.Micropost
    timestamps
  end

  @required_fields ~w(name email password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, ~r/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    |> validate_unique(:name, on: EctoModelsSample.Repo)
    |> validate_unique(:email, on: EctoModelsSample.Repo)
    |> validate_length(:name, min: 1)
    |> validate_length(:name, max: 50)
    |> validate_length(:password, min: 8)
    |> validate_length(:password, max: 100)
    |> validate_presence(:name)
    |> validate_presence(:email)
  end

  def set_password_digest(changeset) do
    password = Ecto.Changeset.get_field(changeset, :password)
    change(changeset, %{password_digest: password})
  end

  def validate_presence(changeset, field_name) do
    field_data = Ecto.Changeset.get_field(changeset, field_name)
    cond do
      field_data == nil ->
        add_error changeset, field_name, "#{field_name} is nil"
      field_data == "" ->
        add_error changeset, field_name, "No #{field_name}"
      true ->
        changeset
    end
  end
end