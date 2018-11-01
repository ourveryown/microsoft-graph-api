defmodule MicrosoftGraphApi.UserResolver do
  alias MicrosoftGraphApi.Service.UserService

  def return_user(%{azure_token: azure_token}, _) do
    UserService.return_user(azure_token)
  end
end
