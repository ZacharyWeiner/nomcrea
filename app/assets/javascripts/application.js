// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require bootstrap-sprockets
//= require jquery3
//= require rails-ujs
//= require jquery-ui
//= require turbolinks
//= require popper
//= require_tree .
//= require bootstrap


$ ->
  modal_holder_selector = "#modal-holder"

  $(document).on "click", "[data-behavior='modal']", ->
    $('body').modalmanager('loading')
    location = $(this).attr("href")
    $.get location, (data)->
      $(modal_holder_selector).html(data).find(".modal").modal("show")
    false

  $(document).on "ajax:success", "[data-behavior='modal-form']", (event, data, status, xhr) ->
    # make sure this event is observered by document and not by dom node itself.
    url = xhr.getResponseHeader("Location")
    # Navigates to given location header in http response or closes the modal handler.
    if url
      window.location = url
    else
      # FUTURE TODO: make sure only the modal which was called last will be destroyed.
      $(".modal").modal("hide")
    false


