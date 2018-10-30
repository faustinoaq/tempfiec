- if temperatura.errors
  ul.errors
    - temperatura.errors.each do |error|
      li = error.to_s

== form(action: "/temperaturas/#{temperatura.id.to_s}", method: temperatura.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "grados", value: temperatura.grados, placeholder: "Grados", class: "form-control")
  .form-group
    == text_field(name: "frecuencia", value: temperatura.frecuencia, placeholder: "Frecuencia", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/temperaturas", class: "btn btn-light btn-sm")
