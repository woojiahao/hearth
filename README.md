# Hearth

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Lifecycle of a Phoenix page

The router first defines a route to the controller. This includes the name of the controller and the function to render
the page.

The controller defines a function (referenced above) to render the page. This function often calls a `render` function
which specifies the name of a template to be rendered. The controller's name defines the naming conventions of the view
and the templates. The controller's name will indicate where Phoenix will look for a view.

The view -- named accordingly -- will house functions that are universal across all templates rendered under that view.

The view will then render the given template (specified by the controller). The template must be housed in a folder 
following the name of the controller.

The root layout of a set of pages will be specified as a pipeline in router.