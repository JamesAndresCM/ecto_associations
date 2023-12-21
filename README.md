# Streamovies

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Example for associations
- Serie `has_many Videos`, `has_one Metadata` and `belongs_to Category`
  
````
Create

Streamovies.Multimedia.create_category(%{name: "terror"})
category = Repo.get_by(Category, name: "terror")
create_params = %{name: "Thun", category_id: category.id, metadata: %{description: "example"}, videos: [ %{name: "test"}  ] }
Streamovies.Multimedia.create_category(params)


Update
serie = Repo.get_by(Serie, name: "Thun") |> Repo.preload([:metadata, :videos, :category])
update_params_1 = %{name: "Thun", category_id: category.id, metadata: %{description: "example"}, videos: [ %{name: "test"}  ] }
update_params_2 = %{name: "Thun2", category_id: category.id, metadata: %{id: id, description: "example2"}, videos: [ %{id: id, name: "test"}, {name: "other"}  ] }
update_params_3 = %{name: "Thun", category_id: category.id, metadata: %{id: id, delete: true}, videos: [ %{id: id, delete: true}  ] }
Streamovies.Multimedia.create_category(serie, update_params_1)
````
