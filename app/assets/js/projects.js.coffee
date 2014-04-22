jQuery ($) ->
	$('#project_product_name').autocomplete
		source: $('#project_product_name').data('autocomplete-source')