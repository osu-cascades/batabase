module ComponentsHelper
  # Main component call
  def component(name, *options, &block)
    render("components/#{name}", *options, &block)
  end

  # All components

  def alert(*options, &block)
    component(:alert, *options, &block)
  end

  def global_header(*options, &block)
    component(:global_header, *options, &block)
  end

  # These are component calls for bootstrap popover and tooltips.
  # We aren't using them yet but we are just keeping them around.
  # def popover(content, title: '', **options)
  #   {
  #     data: {
  #       toggle: :popover,
  #       content: content,
  #       title: title,
  #       **options,
  #     }
  #   }
  # end

  # def tooltip(title, **options)
  #   {
  #     title: title,
  #     data: {
  #       toggle: :tooltip,
  #       **options
  #     }
  #   }
  # end
end