defmodule Sender do
  @moduledoc """
  Documentation for `Sender`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Sender.hello()
      :world

  """
  def hello do
    :world
  end

  def send_email(email) do
    # Sleep for 3 seconds.
    Process.sleep(3000)
    IO.puts("Email to #{email} sent")

    # Tuple to indicate that the email was sent.
    {:ok, "email_sent"}
  end

  def notify_all(emails) do
    # Iterate over emails and call send_email/1.
    Enum.each(emails, &send_email/1)
  end
end
