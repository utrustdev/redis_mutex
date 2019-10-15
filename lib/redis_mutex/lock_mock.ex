defmodule RedisMutex.LockMock do
  @default_timeout :timer.seconds(40)

  @spec with_lock(any(), integer()) :: {boolean(), any()}
  defmacro with_lock(key, timeout \\ @default_timeout, do: clause) do
    quote do
      key = unquote(key)
      timeout = unquote(timeout)

      RedisMutex.LockMock.take_lock(key)
      block_value = unquote(clause)
      RedisMutex.LockMock.unlock(key)

      {true, block_value}
    end
  end

  def take_lock(_key) do
  end

  def unlock(_key) do
  end
end
