.row
  .col-sm-11
    h2 Temperaturas
  .col-sm-1
    a.btn.btn-success.btn-sm href="/temperaturas/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Grados
        th Frecuencia
        th Actions
    tbody
      - temperaturas.each do |temperatura|
        tr
          td = temperatura.grados
          td = temperatura.frecuencia
          td
            span
              == link_to("read", "/temperaturas/#{temperatura.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/temperaturas/#{temperatura.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/temperaturas/#{ temperatura.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
