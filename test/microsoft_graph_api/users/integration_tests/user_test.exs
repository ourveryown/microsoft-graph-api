defmodule MicrosoftGraphApi.Accounts.AccountsTest do
  use MicrosoftGraphApiWeb.ConnCase, async: true

  describe "User queries" do
    setup do
      query = """
      query {
        user{
          id
          businessPhones
          displayName
          givenName
          jobTitle
          mail
          mobilePhone
          officeLocation
          preferredLanguage
          surname
          userPrincipleName
        }
      }
      """

      {:ok, query: query}
    end

    test "returns user", %{query: query} do
      assert %{
               "data" => %{
                 "user" => %{
                   "id" => id,
                   "businessPhones" => business_phones,
                   "displayName" => display_name,
                   "givenName" => given_name,
                   "jobTitle" => job_title,
                   "mail" => mail,
                   "mobilePhone" => mobile_phone,
                   "officeLocation" => office_location,
                   "preferredLanguage" => preferred_language,
                   "surname" => surname,
                   "userPrincipleName" => user_principle_name
                 }
               }
             } = json_response(post(%Plug.Conn{}, "/api", %{query: query}), 200)

      assert id == "1"
      assert business_phones == ["123456789", "123456789"]
      assert display_name == "name"
      assert given_name == "name"
      assert job_title == "job title"
      assert mail == "name@name.com.au"
      assert mobile_phone == "123456789"
      assert office_location == "location"
      assert preferred_language == "language"
      assert surname == "name"
      assert user_principle_name == "name"
    end
  end
end
