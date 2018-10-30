defmodule MicrosoftGraphApi.UserResolver do
  def return_user(_, _, _) do
    {:ok,
      %{
        id: 1,
        business_phones: ["123456789","123456789"],
        display_name: "name",
        given_name: "name",
        job_title: "job title",
        mail: "name@name.com.au",
        mobile_phone: "123456789",
        office_location: "location",
        preferred_language: "language",
        surname: "name",
        user_principle_name: "name"
      }}
  end
end
