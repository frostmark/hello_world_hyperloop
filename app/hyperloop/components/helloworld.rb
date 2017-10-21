
  class Helloworld < Hyperloop::Component
    # param :my_param
    # param param_with_default: "default value"
    # param :param_with_default2, default: "default value" # alternative syntax
    # param :param_with_type, type: Hash
    # param :array_of_hashes, type: [Hash]
    # collect_other_params_as :attributes  # collects all other params into a hash

    # The following are the most common lifecycle call backs,
    # the following are the most common lifecycle call backs# delete any that you are not using.
    # call backs may also reference an instance method i.e. before_mount :my_method

    before_mount do
      # any initialization particularly of state variables goes here.
      # this will execute on server (prerendering) and client.
    end

    after_mount do
      # any client only post rendering initialization goes here.
      # i.e. start timers, HTTP requests, and low level jquery operations etc.
    end

    before_update do
      # called whenever a component will be re-rerendered
    end

    before_unmount do
      # cleanup any thing (i.e. timers) before component is destroyed
    end

    def show_button
      BUTTON(class: 'btn btn-info') do
        state.show_field ? "Click to hide HelloWorld input field" : "Click to show HelloWorld input field"
      end.on(:click) do |ev|
        MyStore.toggle_field
        toggle_logo(ev)
      end
    end

    def show_text
      H1 { "#{MyStore.field_value}" }
    end

    def toggle_logo(ev)
      ev.prevent_default
      logo = Element['img']
      MyStore.show_field ? logo.hide('slow') : logo.show('slow')
    end

    render(DIV) do
      DIV(class: 'hyperloophelloword') do
        IMG(src: 'https://rawgit.com/ruby-hyperloop/hyperloop-js-helloworld/master/hyperloop-logo-medium-white.png?raw=true')
        H3 { "The complete isomorphic ruby framework" }
        BR{}

        show_button

        DIV(class: 'formdiv') do
          InputBox()
          show_text
        end if MyStore.show_field
      end
    end
  end
