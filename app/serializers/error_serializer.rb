class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def format_error
    {
      errors: [
        {
          detail: @error.message
        }
      ]
    }
  end
end
