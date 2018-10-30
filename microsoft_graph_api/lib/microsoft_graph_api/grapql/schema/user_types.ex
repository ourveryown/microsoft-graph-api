defmodule MicrosoftGraphApi.Schema.UserTypes do
  use Absinthe.Schema.Notation

  # =====================================
  # Models
  # =====================================

  @desc "User model"
  object :user do
    field(:id, :id)
    field(:business_phones, list_of(:string))
    field(:display_name, :string)
    field(:given_name, :string)
    field(:job_title, :string)
    field(:mail, :string)
    field(:mobile_phone, :string)
    field(:office_location, :string)
    field(:preferred_language, :string)
    field(:surname, :string)
    field(:user_principle_name, :string)
  end

  # =====================================
  # Queries
  # =====================================

  @desc "User queries"
  object :user_queries do
    @desc "Returns a user"
    field :user, :user do
      resolve(&MicrosoftGraphApi.UserResolver.return_user/3)
    end
  end

  # =====================================
  # Mutations
  # =====================================

  @desc "User mutations"
  object :user_mutations do
  end
end
