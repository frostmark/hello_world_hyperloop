class MyStore < Hyperloop::Store
  state show_field: false, reader: true, scope: :class
  state :field_value, reader: true, scope: :class
end
