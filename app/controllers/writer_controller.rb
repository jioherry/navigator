class WriterController < ApplicationController

  private

  def writer_params
    params.require(:writer).permit(:name, :Introduction, :photo, :experience)
  end

end
