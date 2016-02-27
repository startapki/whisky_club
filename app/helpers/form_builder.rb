class FormBuilder < ActionView::Helpers::FormBuilder
  def raty_field(method, _options = {})
    id = "#{@object_name}_#{method}_#{random_string}"
    raty_id = "#{id}_raty"
    value = @object.send(method)

    @template.capture do
      @template.concat hidden_field(method, id: id)

      @template.concat @template.content_tag(:div, '', id: raty_id)

      @template.concat raty_js(raty_id, id, value)
    end
  end

  private

  def random_string
    SecureRandom.hex
  end

  def raty_js(raty_id, id, value)
    @template.javascript_tag(<<~JAVASCRIPT)
      $('##{raty_id}').raty({
        half: true,
        targetScore: '##{id}',
        score: #{value || 0}
      });
    JAVASCRIPT
  end
end
