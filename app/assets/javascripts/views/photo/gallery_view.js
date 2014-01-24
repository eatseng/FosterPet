FosterPet.Views.GalleryView = Backbone.View.extend({
  events: {
    "click button.back" : "back",
    "click img.gallery_photo" : "photo"
  },

  template: JST['photo/gallery'],

  render: function(){
    var renderedContent = this.template({
      photos: this.collection,
      id: this.id
    });
    this.$el.html(renderedContent);
    return this;
  },

  back: function() {
    window.history.back();
  },

  photo: function() {
    var photo_id = $(event.target).attr('photo_id');
    $('img.modal_photo').attr('src', this.collection.get(photo_id).get('photo_url'));
    $('img.modal_photo').attr('alt', this.collection.get(photo_id).get('description'));
    $('.modal-photo-title').text(this.collection.get(photo_id).get('description'));
    $('#pictureModal').modal();
  }
});