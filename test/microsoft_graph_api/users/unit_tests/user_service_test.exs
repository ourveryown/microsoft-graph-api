defmodule MicrosoftGraphApi.UserServiceTest do
  use ExUnit.Case, async: true

  alias MicrosoftGraphApi.Service.UserService

  describe "User" do
    setup do
      bypass = Bypass.open()
      {:ok, bypass: bypass}
    end

    test "not authroized", %{bypass: bypass} do
      Bypass.expect(bypass, fn conn ->
        Plug.Conn.resp(conn, 401, "Not authorized: 401")
      end)

      url = "localhost:#{bypass.port}/"

      assert {:ok, %{body: "Not authorized: 401"}} = UserService.call_graph_api("token", url)
    end

    test "server down", %{bypass: bypass} do
      Bypass.down(bypass)

      url = "localhost:#{bypass.port}/"

      assert {:error, "timeout"} = UserService.call_graph_api("token", url)
    end

    test "returned successfully", %{bypass: bypass} do
      resp_body = %{
        "businessPhones" => [],
        "displayName" => "Test",
        "givenName" => "test",
        "id" => "ff44e747-4292-8464-fc48-30a71749145f",
        "jobTitle" => "job",
        "mail" => "test@test.com",
        "mobilePhone" => "123456789",
        "officeLocation" => "location",
        "preferredLanguage" => "English",
        "surname" => "test",
        "userPrincipalName" => "test@test.com"
      }

      Bypass.expect(bypass, fn conn ->
        Plug.Conn.send_resp(conn, 200, Poison.encode!(resp_body))
      end)

      url = "localhost:#{bypass.port}/"

      assert resp_body = UserService.call_graph_api("token", url)
    end
  end
end
