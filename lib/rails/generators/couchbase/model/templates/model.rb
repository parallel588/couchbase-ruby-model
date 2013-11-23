class <%= class_name %> < <%= parent_class_name.classify %>

<%- attributes.each do |attribute| -%>
  attribute :<%= attribute.name %>
<% end -%>


end
