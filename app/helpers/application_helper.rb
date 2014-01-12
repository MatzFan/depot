module ApplicationHelper

  # general helper method to hide an element upon a given condition
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes['style'] = 'display: none'
    end
    # Rails helper 'content_tag' wraps output from a block in a tag
    content_tag('div', attributes, &block) # uses block passed to hidden_div_if
  end

end
