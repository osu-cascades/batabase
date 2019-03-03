class DetectorLocationDecorator < ApplicationDecorator

  delegate_all
  
  def coordinates
    "[#{latitude}, #{longitude}]"
  end
 #killed

end
