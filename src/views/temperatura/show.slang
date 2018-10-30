h1 Show Temperatura
p = temperatura.grados
p = temperatura.frecuencia
p
  == link_to("back", "/temperaturas", class: "btn btn-light btn-sm")
  == link_to("edit", "/temperaturas/#{temperatura.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/temperaturas/#{temperatura.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
