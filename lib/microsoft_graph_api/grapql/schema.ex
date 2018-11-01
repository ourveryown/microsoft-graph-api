defmodule MicrosoftGraphApi.Schema do
  use Absinthe.Schema
  import_types(__MODULE__.UserTypes)

  # queries
  query do
    import_fields(:user_queries)
  end

  # mutations
  mutation do
    import_fields(:user_mutations)
  end
end
