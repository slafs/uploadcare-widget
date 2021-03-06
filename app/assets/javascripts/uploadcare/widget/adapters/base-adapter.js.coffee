uploadcare.whenReady ->
  {
    namespace,
    jQuery: $
  } = uploadcare

  namespace 'uploadcare.widget.adapters', (ns) ->
    ns.registered = {}

    class ns.BaseAdapter
      @registerAs: (name) ->
        @registeredName = name
        ns.registered[name] = this

      constructor: (@widget) ->
        name = @constructor.registeredName

        @button = if name in @widget.buttons
          @widget.template.addButton(name)
        else
          $()

        @tab = if name in @widget.tabs
          @widget.dialog.addTab(name)
        else
          $()
