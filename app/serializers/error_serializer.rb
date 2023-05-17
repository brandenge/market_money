class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def format_not_found
    {
      errors: [
        {
          detail: @error.message
        }
      ]
    }
  end
end
