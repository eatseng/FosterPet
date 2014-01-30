FosterPet.Views.Feeds = Backbone.View.extend({
  events: {
    "click img.post_photo" : "photo"
  },

  initialize: function() {
  },

  template: JST['feeds/feeds'],

  render: function() {
    var renderedContent = this.template ({
      feeds: this.collection
    });

    this.$el.html(renderedContent);
    return this;
  },

  photo: function() {
    $('img.modal_photo').attr('src', $(event.target).attr('src'));
    $('img.modal_photo').attr('alt', $(event.target).attr('alt'));
    $('.modal-photo-title').text($(event.target).attr('alt'));
    $('#signUpModal').remove()
    $('#signInModal').remove()
    $('#guestModal').remove()
    $('#pictureModal').modal();
  },

  _close:function() {
  }
});