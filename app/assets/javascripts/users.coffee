# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
(($) ->
   @promote = (id_to_promote)-> 
        $.ajax '/users/promote',
            type: 'POST'
            dataType: 'json'
            data: { id: id_to_promote }
            error: (jqXHR, textStatus, errorThrown) ->
                alert " approve there was an error "+ textStatus + " "+ errorThrown
            success: (data, textStatus, jqXHR) ->
                alert "User # " + id_to_promote + " is now an admin"

    @destroy = (id_to_destroy)-> 
        $.ajax '/users/delete',
            type: 'POST'
            dataType: 'json'
            data: { id: id_to_destroy }
            error: (jqXHR, textStatus, errorThrown) ->
                alert "delete there was an error "+ textStatus + " "+ errorThrown
            success: (data, textStatus, jqXHR) ->
                $('#'+id_to_destroy).remove()
                $('#'+id_to_destroy).hide()
) jQuery