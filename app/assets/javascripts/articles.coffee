# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
(($) ->
   @approve = (id_to_approve)-> 
        $.ajax '/articles/approve',
            type: 'POST'
            dataType: 'json'
            data: { id: id_to_approve }
            error: (jqXHR, textStatus, errorThrown) ->
                alert " approve there was an error "+ textStatus + " "+ errorThrown
            success: (data, textStatus, jqXHR) ->
                $('#'+data.id).remove()

    @delete = (id_to_destroy)-> 
        $.ajax '/articles/delete',
            type: 'POST'
            dataType: 'json'
            data: { id: id_to_destroy }
            error: (jqXHR, textStatus, errorThrown) ->
                alert "delete there was an error "+ textStatus + " "+ errorThrown
            success: (data, textStatus, jqXHR) ->
                $('#'+id_to_destroy).remove()
) jQuery