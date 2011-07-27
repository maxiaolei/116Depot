module ApplicationHelper
<<<<<<< HEAD
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end
=======
end
>>>>>>> 3ae876a4685c17aafb9b3e9b3e7c806d0b111c2f
