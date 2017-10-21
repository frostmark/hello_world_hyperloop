class InputBox < Hyperloop::Component
  def render
    DIV do
      H4 do
        SPAN{ 'Please type ' }
        SPAN(class: 'colored') { 'Hello World' }
        SPAN{ ' in the input field below: ' }
        BR{}
        SPAN{ 'Or anything you want ' }
      end

      INPUT(type: :text, class: 'form-control').on(:change) do |e|
        MyStore.mutate.field_value e.target.value
      end
    end
  end
end
