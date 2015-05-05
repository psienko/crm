App.MessageModalView = Em.View.extend(

  didInsertElement: ->
    $(document).ready ->
      $('.wysihtml5').each (i, elem) ->
        $(elem).wysihtml5()
        return
      $('#modal').on 'hidden', ->
        $('.wysihtml5-sandbox, .wysihtml5-toolbar').remove()
        $('#textarea').show()
        return
      do ->
        # -------------------------------- MODAL TO SELECT A PICTURE ----------
        $(document).find("[data-wysihtml5-command='createLink']").remove()
        $(document).find("[data-wysihtml5-command='insertImage']").remove()
        #imageModal = $(document.getElementsByClassName("bootstrap-wysihtml5-insert-image-modal"))
        #openPictureModal = $(document).find("[data-wysihtml5-command='insertImage']").removeAttr("data-wysihtml5-command")
        #openPictureModal.click ->
          #imageModal.addClass("in")
          #imageModal.append( "<div class='modal-backdrop fade in'></div>" )
          #imageModal.attr('aria-hidden', 'false').attr('style', 'display: block; padding-right: 15px;')
        #x = imageModal.find('a.close')
        #x.removeAttr('data-dismiss')
        #x.click ->
          #imageModal.find('.modal-backdrop.fade.in').remove()
          #imageModal.removeClass('in')
          #imageModal.removeAttr('aria-hidden').removeAttr('style')
          
        #imageModal.find("a:contains('Cancel')").replaceWith('<a class="btn btn-default" href="#">Anuluj</a>')
        #imageModal.find("a:contains('Anuluj')").click ->
          #imageModal.find('.modal-backdrop.fade.in').remove()
          #imageModal.removeClass('in')
          #imageModal.removeAttr('aria-hidden').removeAttr('style')

        #imageModal.on 'click', '[data-dismiss="modal"]', (e) ->
          #alert()
          #e.preventDefault() #stopPropagation()
          #return
        #add = imageModal.find("a:contains('Insert image')").removeAttr('data-dismiss') #.replaceWith(' <a class="btn btn-primary" data-wysihtml5-dialog-action="save" href="#">Dodaj obraz</a>')
        #add.click ->
          #alert() 
         # $('#my-modal').modal('show') #addClass('in').ad
        # -------------------------------- MODAL TO ENTER A HYPERLINK ----------

        #linkModal = $(document.getElementsByClassName("bootstrap-wysihtml5-insert-link-modal"))
        #openLinkModal = $(document).find("[data-wysihtml5-command='createLink']").removeAttr("data-wysihtml5-command")
        #openLinkModal.click ->
          #linkModal.addClass("in")
          #linkModal.attr('aria-hidden', 'false').attr('style', 'display: block; padding-right: 15px;')
        #x = linkModal.find('a.close')
        #x.removeAttr('data-dismiss')
        #x.click ->
          #linkModal.find('.modal-backdrop.fade.in').remove()
          #linkModal.removeClass('in')
          #linkModal.removeAttr('aria-hidden').removeAttr('style')
          
        #linkModal.find("a:contains('Cancel')").replaceWith('<a class="btn btn-default" href="#">Anuluj</a>')
        #linkModal.find("a:contains('Anuluj')").click ->
          #linkModal.find('.modal-backdrop.fade.in').remove()
          #linkModal.removeClass('in')
          #linkModal.removeAttr('aria-hidden').removeAttr('style')
    return
)