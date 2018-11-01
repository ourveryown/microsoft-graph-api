defmodule MicrosoftGraphApi.Service.UserService do
  alias MicrosoftGraphApi.Models.User
  alias HTTPoison
  alias Poison

  @doc """
  takes in an azure token as a string
  returns a User structure that matches a profile return response
  """
  def return_user(azure_token) do
    response =
      HTTPoison.get!("https://graph.microsoft.com/v1.0/me", [
        {"Authorization", "Bearer #{azure_token}"}
      ])

    transform_to_user(response)
  end

  @doc """
  Transforms the json response from Microsoft into a proper structure
  """
  def transform_to_user(response) do
    {:ok,
     %{
       "businessPhones" => business_phones,
       "displayName" => display_name,
       "givenName" => given_name,
       "id" => id,
       "jobTitle" => job_title,
       "mail" => mail,
       "mobilePhone" => mobile_phone,
       "officeLocation" => office_location,
       "preferredLanguage" => preferred_language,
       "surname" => surname,
       "userPrincipalName" => user_principal_name
     }} = Poison.decode(response.body)

    {:ok,
     %User{
       business_phones: business_phones,
       display_name: display_name,
       given_name: given_name,
       id: id,
       job_title: job_title,
       mail: mail,
       mobile_phone: mobile_phone,
       office_location: office_location,
       preferred_language: preferred_language,
       surname: surname,
       user_principal_name: user_principal_name
     }}
  end
end
